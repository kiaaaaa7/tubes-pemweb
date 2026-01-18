<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>InsightHub Admin</title>
    <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}" type="image/x-icon">
    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/modules/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/modules/fontawesome/css/all.min.css') }}">

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="{{ asset('assets/modules/select2/dist/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/select2-bootstrap4.css') }}" />

    <link rel="stylesheet" href="{{ asset('focus-2/vendor/owl-carousel/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('focus-2/vendor/owl-carousel/css/owl.theme.default.min.css') }}">
    <link href="{{ asset('focus-2/vendor/jqvmap/css/jqvmap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('focus-2/css/style.css') }}" rel="stylesheet">

    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/components.css') }}">

    <style>
        /* Sidebar Fixed - No Toggle */
        .main-sidebar {
            position: fixed;
        }

        .main-content {
            min-height: 100vh;
        }

        /* Logo styling */
        .sidebar-logo {
            max-width: 150px;
            height: auto;
        }

        .sidebar-sm-logo {
            max-width: 40px;
            height: auto;
        }
    </style>

    <script src="{{ asset('assets/modules/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/js/sweetalert.min.js') }}"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body style="background-color: white">
    <div id="app">
        <div class="main-wrapper main-wrapper-1">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar">
                <form class="form-inline mr-auto">
                    <ul class="navbar-nav mr-3">
                        <!-- Sidebar toggle removed -->
                    </ul>
                </form>
                <ul class="navbar-nav navbar-right">
                    <li class="dropdown"><a href="#" data-toggle="dropdown"
                        class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <img alt="image" src="{{ asset('assets/img/avatar/avatar-1.png') }}"
                            class="rounded-circle mr-1">
                        <div class="d-sm-none d-lg-inline-block">Hi, {{ auth()->user()->name }}</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a href="{{ route('logout') }}" style="cursor: pointer"
                            onclick="event.preventDefault();
                                                document.getElementById('logout-form').submit();"
                            class="dropdown-item has-icon text-danger">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST"
                            style="display: none;">
                            @csrf
                        </form>
                    </div>
                    </li>
                </ul>
            </nav>
            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <link rel="shortcut icon" href="#" type="image/x-icon">
                        <img src="{{ asset('assets/img/InsightHub.png') }}" alt="InsightHub Logo" class="sidebar-logo">
                    </div>
                    <div class="sidebar-brand sidebar-brand-sm">
                        <a href="{{ route('dashboard') }}">
                            <img src="{{ asset('assets/img/logo-dashboard.png') }}" alt="Mini Logo" class="sidebar-sm-logo">
                        </a>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="menu-header">MAIN MENU</li>
                        <li class=""><a class="nav-link"
                                href="{{ route('dashboard') }}"><i class="fas fa-home"></i>
                                <span>Dashboard</span></a></li>

                            <li class=""><a class="nav-link"
                                    href="{{ route('user') }}
                            "><i class='fas fa-address-book'></i>
                                    <span>User</span></a></li>
                            <li class=""><a class="nav-link"
                                    href="{{ route('kategori') }}"><i class="fas fa-folder"></i>
                                    <span>Kategori</span></a>
                             </li>
                            <li class=""><a class="nav-link"
                                    href="{{ route('berita') }}
                            "><i
                                        class="fas fa-book-open"></i>
                                    <span>Berita</span></a></li>
                    </ul>
                </aside>
            </div>

            <!-- Main Content -->
            @yield('content')

            <footer class="main-footer bg-white">
                <!-- Copyright -->
                <div class="text-center mb-0">
                    <p>Copyright 2026 Insight Hub</p>
                </div>
                <!-- Copyright -->
            </footer>
        </div>
    </div>

    <!-- General JS Scripts -->
    <script src="{{ asset('assets/modules/popper.js') }}"></script>
    <script src="{{ asset('assets/modules/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/modules/nicescroll/jquery.nicescroll.min.js') }}"></script>
    <script src="{{ asset('assets/js/stisla.js') }}"></script>
    <script src="{{ asset('assets/modules/select2/dist/js/select2.full.min.js') }}"></script>

    <!-- JS Libraies -->

    <!-- Page Specific JS File -->

    <!-- Template JS File -->
    <script src="{{ asset('assets/js/scripts.js') }}"></script>
    <script src="{{ asset('assets/js/custom.js') }}"></script>

    <!-- Vectormap -->
    <script src="{{ asset('focus-2/vendor/raphael/raphael.min.js') }}"></script>
    <script src="{{ asset('focus-2/vendor/morris/morris.min.js') }}"></script>

    <script src="{{ asset('focus-2/vendor/circle-progress/circle-progress.min.js') }}"></script>
    <script src="{{ asset('focus-2/vendor/chart.js/Chart.bundle.min.js') }}"></script>

    <script>
        //active select2
        $(document).ready(function() {
            $('select').select2({
                theme: 'bootstrap4',
                width: 'style',
            });
        });

        //flash message
        @if (session()->has('success'))
            swal({
                type: "success",
                icon: "success",
                title: "BERHASIL!",
                text: "{{ session('success') }}",
                timer: 1500,
                showConfirmButton: false,
                showCancelButton: false,
                buttons: false,
            });
        @elseif (session()->has('error'))
            swal({
                type: "error",
                icon: "error",
                title: "GAGAL!",
                text: "{{ session('error') }}",
                timer: 1500,
                showConfirmButton: false,
                showCancelButton: false,
                buttons: false,
            });
        @endif
    </script>

    @yield('scripts')
</body>

</html>
