@extends('layouts.user')

@section('content')
<div class="breadcrumbs overlay">
    <div class="container">
        <div class="bread-inner">
            <div class="row">
                <div class="col-12">
                    <h2>Kategori Selengkapnya</h2>
                    <ul class="bread-list">
                        <li><a href="/">Home</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">Kategori {{ $category->name }}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="blog section p-0" id="blog" data-section="blog">
    <div class="container">
        <div class="input-group py-5">
            <form action="{{ route('post.search') }}" method="GET" class="w-100 d-flex">
                <input type="text" class="form-control" name="q" placeholder="Cari berdasarkan judul berita">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-search"></i> CARI
                    </button>
                </div>
            </form>
        </div>
        <div class="row pb-5">
            @if($posts->isEmpty())
                <div class="col-12">
                    <p class="text-center">Tidak ada berita untuk kategori ini.</p>
                </div>
            @else
                @foreach($posts as $post)
                <div class="col-lg-4 col-md-6 col-12 mb-5">
                    <div class="single-news">
                        <div class="news-head">
                            <img src="{{ $post->image }}" alt="{{ $post->title }}">
                        </div>
                        <div class="news-body">
                            <div class="news-content">
                                <div class="date">{{ $post->created_at->format('d M Y') }}</div>
                                <div class="kategori">{{ $post->category->name }}</div>
                                <h2><a href="{{ route('post.show', $post->id) }}">{{ $post->title }}</a></h2>
                                <p class="text">{{ Str::limit($post->slug, 150) }}</p>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @endif
        </div>
    </div>
</section>
@endsection
