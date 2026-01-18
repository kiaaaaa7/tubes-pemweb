<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <!-- Meta Tags -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="Site keywords here">
		<meta name="description" content="">
		<meta name='copyright' content=''>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Title -->
        <title>Insighthub</title>

		<!-- Favicon -->
        <link rel="icon" href="{{ asset('bahan-tubes/img/favicon1.png') }}">

		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="{{ asset('bahan-tubes/css/bootstrap.min.css') }}">
		<!-- Nice Select CSS -->
		<link rel="stylesheet" href="{{ asset('bahan-tubes/css/nice-select.css') }}">
		<!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
		<!-- icofont CSS -->
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/icofont.css') }}">
		<!-- Slicknav -->
		<link rel="stylesheet" href="{{ asset('bahan-tubes/css/slicknav.min.css') }}">
		<!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/owl-carousel.css') }}">
		<!-- Datepicker CSS -->
		<link rel="stylesheet" href="{{ asset('bahan-tubes/css/datepicker.css') }}">
		<!-- Animate CSS -->
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/animate.min.css') }}">
		<!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/magnific-popup.css') }}">

		<!-- Medipro CSS -->
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/normalize.css') }}">
        <link rel="stylesheet" href="{{ asset('bahan-tubes/style.css') }}">
        <link rel="stylesheet" href="{{ asset('bahan-tubes/css/responsive.css') }}">

        {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> --}}

        <style>
            /* Fun Facts Slider Custom Styling */
            .fun-facts .fun-facts-slider {
                padding: 0 60px;
            }

            .fun-facts .owl-nav {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 100%;
                left: 0;
                pointer-events: none;
            }

            .fun-facts .owl-nav button {
                position: absolute;
                background: rgba(255, 255, 255, 0.9) !important;
                width: 45px;
                height: 45px;
                border-radius: 50%;
                font-size: 24px;
                line-height: 45px;
                text-align: center;
                transition: all 0.3s ease;
                pointer-events: all;
                box-shadow: 0 3px 10px rgba(0,0,0,0.2);
            }

            .fun-facts .owl-nav button:hover {
                background: #fff !important;
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            }

            .fun-facts .owl-nav button.owl-prev {
                left: 0;
            }

            .fun-facts .owl-nav button.owl-next {
                right: 0;
            }

            .fun-facts .owl-nav button i {
                color: #1A76D1;
            }

            .fun-facts .single-fun {
                text-align: center;
                padding: 10px;
            }

            @media (max-width: 768px) {
                .fun-facts .fun-facts-slider {
                    padding: 0 50px;
                }

                .fun-facts .owl-nav button {
                    width: 35px;
                    height: 35px;
                    line-height: 35px;
                    font-size: 18px;
                }
            }
        </style>

    </head>
    <body>

        <div class="preloader">
            <div class="loader">
                <div class="loader-outter"></div>
                <div class="loader-inner"></div>

                <div class="indicator">
                    <svg width="16px" height="12px">
                        <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                        <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                    </svg>
                </div>
            </div>
        </div>
        <!-- End Preloader -->

		<!-- Header Area -->
		<header class="header" >
			<!-- Header Inner -->
			<div class="header-inner">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-12">
								<!-- Start Logo -->
								<div class="logo">
									<a href="/"><img src="{{ asset('bahan-tubes/img/InsightHub__2__1-removebg-preview.png') }}" alt="#"></a>
								</div>
								<!-- End Logo -->
								<!-- Mobile Nav -->
								<div class="mobile-nav"></div>
								<!-- End Mobile Nav -->
							</div>
							<div class="col-lg-7 col-md-9 col-12">
								<!-- Main Menu -->
								<div class="main-menu">
									<nav class="navigation">
										<ul class="nav menu">
                                            <li><a href="/">Home</a></li>
                                            <li><a href="#service">Kategori </a></li>
											<li><a href="#blog">Berita </a></li>
											<li><a href="#footer">Hubungi Kami</a></li>
										</ul>
									</nav>
								</div>
								<!--/ End Main Menu -->
							</div>
							<div class="col-lg-2 col-12">
								@if (Route::has('login'))
                                    <div class="get-quote">
                                        @auth
                                        <div class="dropdown">
                                            <button class="dropdown-btn" onclick="toggleDropdown()">Hi, {{ auth()->user()->name }}</button>
                                            <div class="dropdown-menu" id="dropdownMenu">
                                                <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Keluar</a>
                                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                    @csrf
                                                </form>
                                            </div>
                                        </div>
                                        @else
                                            <a href="{{ route('login') }}" class="btn btn-primary" href="#" role="button">Masuk</a>

                                            @if (Route::has('register'))
                                                <a href="{{ route('register') }}" class="btn btn-primary" href="#" role="button">Daftar</a>
                                            @endif
                                        @endauth
                                    </div>
                                @endif
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Header Inner -->
		</header>
		<!-- End Header Area -->

        <!-- Main Content -->
        @yield('content')

		<!-- Footer Area -->
		<section id="footer" class="footer section p-0" data-section="footer">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer">
								<h2>About Us</h2>
								<p>Lorem ipsum dolor sit am consectetur adipisicing elit do eiusmod tempor incididunt ut labore dolore magna.</p>
								<!-- Social -->
								<ul class="social">
									<li><a href="#"><i class="icofont-facebook"></i></a></li>
									<li><a href="#"><i class="icofont-google-plus"></i></a></li>
									<li><a href="#"><i class="icofont-twitter"></i></a></li>
									<li><a href="#"><i class="icofont-vimeo"></i></a></li>
									<li><a href="#"><i class="icofont-pinterest"></i></a></li>
								</ul>
								<!-- End Social -->
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer">
								<h2>Newsletter</h2>
								<p>subscribe to our newsletter to get allour news in your inbox.. Lorem ipsum dolor sit amet, consectetur adipisicing elit,</p>
								<form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
									<input name="email" placeholder="Email Address" class="common-input" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Your email address'" required="" type="email">
									<button class="button"><i class="icofont icofont-paper-plane"></i></button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Footer Top -->
		</section>
		<!--/ End Footer Area -->

		<!-- jquery Min JS -->
        <script src="{{ asset('bahan-tubes/js/jquery.min.js') }}"></script>
		<!-- jquery Migrate JS -->
		<script src="{{ asset('bahan-tubes/js/jquery-migrate-3.0.0.js') }}"></script>
		<!-- jquery Ui JS -->
		<script src="{{ asset('bahan-tubes/js/jquery-ui.min.js') }}"></script>
		<!-- Easing JS -->
        <script src="{{ asset('bahan-tubes/js/easing.js') }}"></script>
		<!-- Color JS -->
		<script src="{{ asset('bahan-tubes/js/colors.js') }}"></script>
		<!-- Popper JS -->
		<script src="{{ asset('bahan-tubes/js/popper.min.js') }}"></script>
		<!-- Bootstrap Datepicker JS -->
		<script src="{{ asset('bahan-tubes/js/bootstrap-datepicker.js') }}"></script>
		<!-- Jquery Nav JS -->
        <script src="{{ asset('bahan-tubes/js/jquery.nav.js') }}"></script>
		<!-- Slicknav JS -->
		<script src="{{ asset('bahan-tubes/js/slicknav.min.js') }}"></script>
		<!-- ScrollUp JS -->
        <script src="{{ asset('bahan-tubes/js/jquery.scrollUp.min.js') }}"></script>
		<!-- Niceselect JS -->
		<script src="{{ asset('bahan-tubes/js/niceselect.js') }}"></script>
		<!-- Tilt Jquery JS -->
		<script src="{{ asset('bahan-tubes/js/tilt.jquery.min.js') }}"></script>
		<!-- Owl Carousel JS -->
        <script src="{{ asset('bahan-tubes/js/owl-carousel.js') }}"></script>
		<!-- counterup JS -->
		<script src="{{ asset('bahan-tubes/js/jquery.counterup.min.js') }}"></script>
		<!-- Steller JS -->
		<script src="{{ asset('bahan-tubes/js/steller.js') }}"></script>
		<!-- Wow JS -->
		<script src="{{ asset('bahan-tubes/js/wow.min.js') }}"></script>
		<!-- Magnific Popup JS -->
		<script src="{{ asset('bahan-tubes/js/jquery.magnific-popup.min.js') }}"></script>
		<!-- Counter Up CDN JS -->
		<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
		<!-- Bootstrap JS -->
		<script src="{{ asset('bahan-tubes/js/bootstrap.min.js') }}"></script>
		<!-- Main JS -->
		<script src="{{ asset('bahan-tubes/js/main.js') }}"></script>
        <script>
            // Owl Carousel for Fun Facts
            $('.fun-facts-slider').owlCarousel({
                items: 4,
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                margin: 30,
                stagePadding: 0,
                nav: false,
                dots: false,
                smartSpeed: 600,
                center: false,
                responsive: {
                    0: {
                        items: 1,
                        margin: 10,
                        stagePadding: 0
                    },
                    576: {
                        items: 2,
                        margin: 15,
                        stagePadding: 0
                    },
                    768: {
                        items: 3,
                        margin: 20,
                        stagePadding: 0
                    },
                    992: {
                        items: 4,
                        margin: 25,
                        stagePadding: 0
                    },
                    1200: {
                        items: 4,
                        margin: 30,
                        stagePadding: 0
                    }
                }
            });

            //according to loftblog tut
            $('.nav li:first').addClass('active');

            var showSection = function showSection(section, isAnimate) {
              var
              direction = section.replace(/#/, ''),
              reqSection = $('.section').filter('[data-section="' + direction + '"]'),
              reqSectionPos = reqSection.offset().top - 0;

              if (isAnimate) {
                $('body, html').animate({
                  scrollTop: reqSectionPos },
                800);
              } else {
                $('body, html').scrollTop(reqSectionPos);
              }

            };

            var checkSection = function checkSection() {
              $('.section').each(function () {
                var
                $this = $(this),
                topEdge = $this.offset().top - 80,
                bottomEdge = topEdge + $this.height(),
                wScroll = $(window).scrollTop();
                if (topEdge < wScroll && bottomEdge > wScroll) {
                  var
                  currentId = $this.data('section'),
                  reqLink = $('a').filter('[href*=\\#' + currentId + ']');
                  reqLink.closest('li').addClass('active').
                  siblings().removeClass('active');
                }
              });
            };

            $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
              if($(e.target).hasClass('external')) {
                return;
              }
              e.preventDefault();
              $('#menu').removeClass('active');
              showSection($(this).attr('href'), true);
            });

            $(window).scroll(function () {
              checkSection();
            });

            function toggleDropdown() {
                var dropdownMenu = document.getElementById('dropdownMenu');
                dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
            }

            // Close the dropdown menu if clicked outside
            window.onclick = function(event) {
                var dropdown = document.querySelector('.dropdown');
                var dropdownMenu = document.getElementById('dropdownMenu');
                if (!dropdown.contains(event.target)) {
                    dropdownMenu.style.display = 'none';
                }
            }
        </script>
    </body>
</html>
