@extends('layouts.user')

@section('content')
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Berita Selengkapnya</h2>
							<ul class="bread-list">
								<li><a href="/">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">{{ $post->title }}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section class="news-single section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12">
						<div class="row">
							<div class="col-12">
								<div class="single-main">
									<div class="news-head">
										<img src="{{ $post->image }}" alt="#">
									</div>
									<h1 class="news-title">{{ $post->title }}</h1>
									<div class="meta">
										<div class="meta-left">
											<span class="date"><i class="fa fa-clock-o"></i>{{ $post->formatted_date }}</span>
										</div>
										<div class="meta-right">
											<span class="comments"><i class="fa fa-comments"></i>{{ $post->comments->count() }} Komentar</span>
											<span class="views"><i class="fa fa-eye"></i>{{ $post->views->count() }} Dilihat</span>
										</div>
									</div>
									<div class="news-text">
										<p>{{ Str::limit(strip_tags($post->content), 150) }}</p>
									</div>
									<div class="blog-bottom">
										<ul class="social-share">
											<li class="facebook"><a href="#"><i class="fa fa-facebook"></i><span>Facebook</span></a></li>
											<li class="twitter"><a href="#"><i class="fa fa-twitter"></i><span>Twitter</span></a></li>
											<li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
											<li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
											<li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
										</ul>
										<ul class="prev-next">
											@if($previousPost)
                                                <li class="prev">
                                                    <a href="{{ route('post.show', $previousPost->id) }}">
                                                        <i class="fa fa-angle-double-left"></i>
                                                    </a>
                                                </li>
                                            @else
                                                <li class="prev disabled">
                                                    <a href="javascript:void(0);" aria-disabled="true">
                                                        <i class="fa fa-angle-double-left"></i>
                                                    </a>
                                                </li>
                                            @endif
											@if($nextPost)
                                                <li class="next">
                                                    <a href="{{ route('post.show', $nextPost->id) }}">
                                                        <i class="fa fa-angle-double-right"></i>
                                                    </a>
                                                </li>
                                            @else
                                                <li class="next disabled">
                                                    <a href="javascript:void(0);" aria-disabled="true">
                                                        <i class="fa fa-angle-double-right"></i>
                                                    </a>
                                                </li>
                                            @endif
										</ul>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="blog-comments">
									<h2>Komentar</h2>
									<div class="comments-body">
										<!-- Single Comments -->
                                        @foreach($post->comments as $comment)
										<div class="single-comments">
											<div class="main">
												<div class="body">
													<h4>{{ $comment->user->name ?? 'Anonymous' }}</h4>
													<div class="comment-meta"><span class="meta"><i class="fa fa-calendar"></i></span>{{ $comment->created_at->format('F j, Y') }}<span class="meta"><i class="fa fa-clock-o"></i>{{ $comment->created_at->format('h:i A') }}</span></div>
													<p>{{ $comment->message }}</p>
												</div>
											</div>
										</div>
                                        @endforeach
                                        @if($post->comments->isEmpty())
                                            <p>Belum ada komentar, Masukan komentar pertama!</p>
                                        @endif
										<!--/ End Single Comments -->
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="comments-form">
									<h2>Tinggalkan Komentar</h2>
									<form class="form" method="POST" action="{{ route('comment.store', $post->id) }}">
                                        @csrf
										<div class="row">
											<div class="col-12">
												<div class="form-group message">
													<i class="fa fa-pencil"></i>
													<textarea name="message" rows="7" placeholder="Tuliskan komentar anda disini" required></textarea>
												</div>
											</div>
											<div class="col-12">
												<div class="form-group button">
													<button type="submit" class="btn primary"><i class="fa fa-send"></i>Kirim Komentar</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="main-sidebar">
							<div class="single-widget category">
								<h3 class="title">Kategori Informasi</h3>
								<ul class="categor-list">
                                    @foreach($categories as $category)
                                        <li><a href="{{ route('category.show', $category->id) }}">{{ $category->name }}</a></li>
                                    @endforeach
								</ul>
							</div>
							<div class="single-widget recent-post">
								<h3 class="title">Berita Lainnya</h3>
                                @foreach($posts as $post)
								<div class="single-post">
									<div class="image">
										<img src="{{ $post->image }}" alt="{{ $post->title }}">
									</div>
									<div class="content">
										<h5><a href="{{ route('post.show', $post->id) }}">{{ $post->title }}</a></h5>
										<ul class="comment">
											<li><i class="fa fa-calendar" aria-hidden="true"></i>{{ $post->formatted_date }}</li>
										</ul>
									</div>
								</div>
                                @endforeach
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
@endsection
