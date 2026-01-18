<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\Post;
use App\Models\View;
use Illuminate\Support\Facades\Auth;

class WelcomeController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        $categories = Category::withCount('posts')->get();
        $posts = Post::latest()->get();
        $posts->each(function($post) {
            $post->created_at = Carbon::parse($post->created_at);
        });
        return view('welcome', compact('categories','posts'));
    }
    public function showCategory($id)
    {
        $category = Category::findOrFail($id);
        $posts = $category->posts()->latest()->get();
        return view('kategoriuser', compact('category', 'posts'));
    }
    public function showPost($id)
    {
        $post = Post::findOrFail($id);

        $ipAddress = request()->ip();
        $userId = Auth::id();

        // Berita sebelumnya berdasarkan ID lebih kecil
        $previousPost = Post::where('created_at', '<', $post->created_at)
        ->orderBy('created_at', 'desc')
        ->first();

        // Berita berikutnya berdasarkan ID lebih besar
        $nextPost = Post::where('created_at', '>', $post->created_at)
            ->orderBy('created_at', 'asc')
            ->first();

        // Cek apakah pengguna atau IP sudah mencatat view untuk konten ini
        $hasViewed = View::where('post_id', $id)
        ->where(function ($query) use ($userId, $ipAddress) {
            if ($userId) {
                $query->where('user_id', $userId);
            } else {
                $query->where('ip_address', $ipAddress);
            }
        })
        ->exists();

        if (!$hasViewed) {
            View::create([
                'post_id' => $id,
                'user_id' => $userId,
                'ip_address' => $ipAddress,
            ]);
        }

        $post = Post::with('comments.user')->findOrFail($id);
        $posts = Post::latest()->get();
        $categories = Category::all();
        return view('beritauser', compact('post', 'categories', 'posts', 'previousPost', 'nextPost'));
    }
    public function search(Request $request)
    {
        $query = $request->input('q');
        $posts = Post::where('title', 'LIKE', '%' . $query . '%')
                    ->orWhere('slug', 'LIKE', '%' . $query . '%')
                    ->latest()
                    ->get();
        return view('beritasearch', compact('posts', 'query'));
    }
    public function store(Request $request, $postId)
    {
        $request->validate([
            'message' => 'required|string',
        ]);

        $post = Post::findOrFail($postId);

        $post->comments()->create([
            'message' => $request->message,
            'user_id' => Auth::id(),
        ]);
        return redirect()->back()->with('success', 'Komentar berhasilk ditambahkan!');
    }

}
