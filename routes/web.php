<?php

use App\Http\Controllers\BeritaController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WelcomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function () {
    return view('kategori.lomba');
});

Route::get('/singleblog', function () {
    return view('single-blog');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Akses Siswa
Route::get('/', [WelcomeController::class, 'index'])->name('post');
Route::get('/post/{post}', [WelcomeController::class, 'showPost'])
    ->name('post.show')
    ->middleware('auth', 'verified', 'role:user');
Route::get('/category/{id}', [WelcomeController::class, 'showCategory'])
    ->name('category.show')
    ->middleware('auth', 'verified', 'role:user');
Route::get('/search', [WelcomeController::class, 'search'])
    ->name('post.search')
    ->middleware('auth', 'verified', 'role:user');
Route::post('/post/{post}/comment', [WelcomeController::class, 'store'])
    ->name('comment.store')
    ->middleware('auth', 'verified', 'role:user');

// Dashboard
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard')->middleware(['auth', 'verified', 'role:admin']);

//User Admin
Route::get('/user', [UserController::class, 'index'])->name('user')->middleware(['auth', 'verified', 'role:admin']);
Route::delete('/user/delete/{id}', [UserController::class, 'destroy'])->name('user.delete')->middleware(['auth', 'verified', 'role:admin']);

//Berita
Route::get('/berita', [BeritaController::class, 'index'])->name('berita')->middleware(['auth', 'verified', 'role:admin']);
Route::get('/berita/create', [BeritaController::class, 'create'])->name('berita.create')->middleware(['auth', 'verified', 'role:admin']);
Route::post('/berita/create', [BeritaController::class, 'store'])->name('berita.store')->middleware(['auth', 'verified', 'role:admin']);
Route::get('/berita/edit/{id}', [BeritaController::class, 'edit'])->name('berita.edit')->middleware(['auth', 'verified', 'role:admin']);
Route::put('/berita/update/{post}', [BeritaController::class, 'update'])->name('berita.update')->middleware(['auth', 'verified', 'role:admin']);
Route::delete('/berita/delete/{id}', [BeritaController::class, 'destroy'])->name('berita.delete')->middleware(['auth', 'verified', 'role:admin']);

// Category
Route::get('/kategori', [CategoryController::class, 'index'])->name('kategori')->middleware(['auth', 'verified', 'role:admin']);
Route::get('/kategori/create', [CategoryController::class, 'create'])->name('kategori.create')->middleware(['auth', 'verified', 'role:admin']);
Route::post('/kategori/create', [CategoryController::class, 'store'])->name('kategori.store')->middleware(['auth', 'verified', 'role:admin']);
Route::get('/kategori/edit/{id}', [CategoryController::class, 'edit'])->name('kategori.edit')->middleware(['auth', 'verified', 'role:admin']);
Route::put('/kategori/update/{id}', [CategoryController::class, 'update'])->name('kategori.update')->middleware(['auth', 'verified', 'role:admin']);
Route::delete('/kategori/delete/{id}', [CategoryController::class, 'destroy'])->name('kategori.delete')->middleware(['auth', 'verified', 'role:admin']);

require __DIR__.'/auth.php';
