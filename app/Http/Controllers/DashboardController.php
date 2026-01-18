<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Data untuk jumlah views
    $topViewedPosts = Post::withCount('views')
    ->orderBy('views_count', 'desc')
    ->take(5) // Ambil 5 berita teratas
    ->get();

    // Data untuk jumlah komentar
    $topCommentedPosts = Post::withCount('comments')
        ->orderBy('comments_count', 'desc')
        ->take(5) // Ambil 5 berita dengan komentar terbanyak
        ->get();

    return view('admin.dashboard.index', [
        'postTitles' => $topViewedPosts->pluck('title'),
        'postViews' => $topViewedPosts->pluck('views_count'),
        'commentTitles' => $topCommentedPosts->pluck('title'),
        'postComments' => $topCommentedPosts->pluck('comments_count'),
    ]);
        }
}
