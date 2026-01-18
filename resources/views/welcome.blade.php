@extends('layouts.user')

@section('content')
		<section id="home" class="slider" data-section="home">
			<div class="hero-slider">
				<div class="single-slider" style="background-image:url('{{ asset('bahan-tubes/img/sliderr.jpg') }}')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>Temukan Peluang <span>Pendidikan & Karirmu</span> di Satu Tempat!</h1>
									<p>Dapatkan informasi terbaru seputar beasiswa, lomba, dan peluang karir. Kami hadir untuk membantumu meraih mimpi dan mencapai potensi terbaik! </p>
									<div class="button">
										<a href="#" class="btn">Get Appointment</a>
										<a href="#" class="btn primary">Learn More</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider" style="background-image:url('{{ asset('bahan-tubes/img/slider.jpg') }}')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>Temukan Peluang <span>Pendidikan & Karirmu</span> di Satu Tempat!</h1>
									<p>Dapatkan informasi terbaru seputar beasiswa, lomba, dan peluang karir. Kami hadir untuk membantumu meraih mimpi dan mencapai potensi terbaik! </p>
									<div class="button">
										<a href="#" class="btn">Get Appointment</a>
										<a href="#" class="btn primary">About Us</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider" style="background-image:url('{{ asset('bahan-tubes/img/slider3.jpg') }}')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>Temukan Peluang <span>Pendidikan & Karirmu</span> di Satu Tempat!</h1>
									<p>Dapatkan informasi terbaru seputar beasiswa, lomba, dan peluang karir. Kami hadir untuk membantumu meraih mimpi dan mencapai potensi terbaik! </p>
									<div class="button">
										<a href="#" class="btn">Get Appointment</a>
										<a href="#" class="btn primary">Contact Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div id="fun-facts" class="fun-facts section overlay" data-section="fun-facts">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-12">
						<div class="owl-carousel fun-facts-slider">
							@foreach($categories as $category)
							<div class="single-fun">
								<i class="fa-solid fa-podcast"></i>
								<div class="content">
									<span class="counter">{{ $category->posts_count }}</span>
									<p>{{ $category->name }}</p>
								</div>
							</div>
							@endforeach
						</div>
					</div>
				</div>
			</div>
		</div>
		<section id="service" class="services section" data-section="service">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Kategori</h2>
							<img src="{{ asset('bahan-tubes/img/section-img.png') }}" alt="#">
						</div>
					</div>
				</div>
				<div class="row">
					@foreach($categories as $category)
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-service">
                            <i class="fa-solid fa-rectangle-list"></i>
                            <h4><a href="{{ route('category.show', $category->id) }}">{{ $category->name }}</a></h4>
                        </div>
                    </div>
                    @endforeach
				</div>
			</div>
		</section>
		<section class="blog section" id="blog" data-section="blog">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Berita</h2>
							<img src="{{ asset('bahan-tubes/img/section-img.png') }}" alt="#">
						</div>
					</div>
				</div>
				<div class="row">
					@foreach($posts as $post)
                    <div class="col-lg-4 col-md-6 col-12 mb-5">
                        <div class="single-news">
                            <div class="news-head">
                                <img src="{{ $post->image }}" alt="{{ $post->title }}">
                            </div>
                            <div class="news-body">
                                <div class="news-content">
                                    <div class="date">{{ $post->formatted_date }}</div>
                                    <div class="kategori">{{ $post->category->name }}</div>
                                    <h2><a href="{{ route('post.show', $post->id) }}">{{ $post->title }}</a></h2>
                                    <p class="text">{{ Str::limit(strip_tags($post->content), 150) }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
				</div>
			</div>
		</section>
		<div class="clients overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-12">
						<div class="owl-carousel clients-slider">
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
							<div class="single-clients">
								<img src="{{ asset('bahan-tubes/img/itenas.png') }}" alt="#">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
@endsection
