<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class BeritaController extends Controller
{
    public function index()
    {
        $posts = Post::latest()->when(request()->q, function ($posts) {
            $posts = $posts->where('title', 'like', '%' . request()->q . '%');
        })->paginate(10);

        return view('admin.berita.index', compact('posts'));
    }
    public function create()
    {
        $categories = Category::latest()->get();
        return view('admin.berita.create', compact('categories'));
    }
    public function store(Request $request)
    {
        $this->validate($request, [
            'image'         => 'required|image|mimes:jpeg,jpg,png|max:2000',
            'title'         => 'required|unique:posts',
            'category_id'   => 'required',
            'content'       => 'required',
        ]);

        //upload image
        $image = $request->file('image');
        $image->storeAs('public/posts', $image->hashName());

        $post = Post::create([
            'image'       => $image->hashName(),
            'title'       => $request->input('title'),
            'slug'        => Str::slug($request->input('title'), '-'),
            'category_id' => $request->input('category_id'),
            'content'     => $request->input('content')
        ]);
        $post->save();

        if ($post) {
            //redirect dengan pesan sukses
            return redirect()->route('berita')->with(['success' => 'Data Berhasil Disimpan!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('berita')->with(['error' => 'Data Gagal Disimpan!']);
        }
    }
    public function edit(Post $post,$id)
    {
        $post = Post::findOrFail($id);
        $categories = Category::latest()->get();
        return view('admin.berita.edit', compact('post', 'categories'));
    }
    public function update(Request $request, Post $post)
    {
        $this->validate($request, [
            'title'         => 'required|unique:posts,title,' . $post->id,
            'category_id'   => 'required',
            'content'       => 'required',
        ]);

        if ($request->file('image') == "") {

            $post = Post::findOrFail($post->id);
            $post->update([
                'title'       => $request->input('title'),
                'slug'        => Str::slug($request->input('title'), '-'),
                'category_id' => $request->input('category_id'),
                'content'     => $request->input('content')
            ]);
        } else {

            //remove old image
            Storage::disk('local')->delete('public/posts/' . $post->image);

            //upload new image
            $image = $request->file('image');
            $image->storeAs('public/posts', $image->hashName());

            $post = Post::findOrFail($post->id);
            $post->update([
                'image'       => $image->hashName(),
                'title'       => $request->input('title'),
                'slug'        => Str::slug($request->input('title'), '-'),
                'category_id' => $request->input('category_id'),
                'content'     => $request->input('content')
            ]);
        }

        return redirect()->route('berita')->with('success', 'Data Berhasil Diubah!');
    }
    public function destroy($id)
    {
        $post = Post::findOrFail($id);
        $image = Storage::disk('local')->delete('public/posts/' . basename($post->image));
        $post->delete();

        if ($post) {
            return response()->json([
                'status' => 'success'
            ]);
        } else {
            return response()->json([
                'status' => 'error'
            ]);
        }
    }
}
