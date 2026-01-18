@extends('layouts.app')

@section('content')
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Dashboard</h1>
        </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-address-book"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4 title="USER">USER</h4>
                            </div>
                            <div class="card-body">
                                {{ (App\Models\User::count() ?? 0) - 1 }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-folder"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4 title="KATEGORI">KATEGORI</h4>
                            </div>
                            <div class="card-body">
                                {{ App\Models\Category::count() ?? '0' }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-book-open text-white fa-2x"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4 title="BERITA">BERITA</h4>
                            </div>
                            <div class="card-body">
                                {{ App\Models\Post::count() ?? '0' }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <!-- Chart untuk Views -->
                    <div class="card h-100 mb-4">
                        <div class="card-header">
                            <h4 class="card-title">Berita yang Dilihat Terbanyak</h4>
                        </div>
                        <div class="card-body d-flex justify-content-center align-items-center p-0" style="height: calc(100vh - 500px);">
                            <canvas id="topViewsChart" width="400" height="200"></canvas>
                        </div>
                    </div>

                    <!-- Chart untuk Komentar -->
                    <div class="card h-100">
                        <div class="card-header">
                            <h4 class="card-title">Berita dengan Komentar Terbanyak</h4>
                        </div>
                        <div class="card-body d-flex justify-content-center align-items-center p-0" style="height: calc(100vh - 500px);">
                            <canvas id="topCommentsChart" width="400" height="200"></canvas>
                        </div>
                    </div>
                </div>
                <script>
                    // Data dari server untuk Views
                    const postTitles = @json($postTitles);
                    const postViews = @json($postViews);

                    // Data dari server untuk Komentar
                    const commentTitles = @json($commentTitles);
                    const postComments = @json($postComments);

                    // Chart untuk Views
                    const ctxViews = document.getElementById('topViewsChart').getContext('2d');
                    const topViewsChart = new Chart(ctxViews, {
                        type: 'bar',
                        data: {
                            labels: postTitles,
                            datasets: [{
                                label: 'Jumlah Dilihat',
                                data: postViews,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'Jumlah Dilihat'
                                    }
                                },
                                x: {
                                    title: {
                                        display: true,
                                        text: 'Judul Berita'
                                    }
                                }
                            }
                        }
                    });

                    // Chart untuk Komentar
                    const ctxComments = document.getElementById('topCommentsChart').getContext('2d');
                    const topCommentsChart = new Chart(ctxComments, {
                        type: 'bar',
                        data: {
                            labels: commentTitles,
                            datasets: [{
                                label: 'Jumlah Komentar',
                                data: postComments,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'Jumlah Komentar'
                                    }
                                },
                                x: {
                                    title: {
                                        display: true,
                                        text: 'Judul Berita'
                                    }
                                }
                            }
                        }
                    });
                </script>
            </div>
        </section>
    </div>
@endsection
