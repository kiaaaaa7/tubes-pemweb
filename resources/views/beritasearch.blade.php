@extends('layouts.user')

@section('content')
<div class="breadcrumbs overlay">
    <div class="container">
        <div class="bread-inner">
            <div class="row">
                <div class="col-12">
                    <h2>Hasil Pencarian</h2>
                    <ul class="bread-list">
                        <li><a href="/">Home</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">Hasil Pencarian untuk "{{ $query }}"</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="blog section p-0" id="blog" data-section="blog">
    <div class="container mt-5">
        <div class="row pb-5">
            @if($posts->isEmpty())
                <div class="col-12">
                    <p class="text-center">Tidak ada hasil untuk "{{ $query }}".</p>
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
