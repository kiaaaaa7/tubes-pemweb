@extends('layouts.app')

@section('content')
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Kategori</h1>
        </div>
            <div class="section-body">
                <div class="card">
                    <div class="card-header">
                        <h4><i class="fas fa-folder"></i> Kategori</h4>
                    </div>
                    <div class="card-body">
                        <form action="" method="GET">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <a href="{{ route('kategori.create') }}" class="btn btn-primary"
                                                style="padding-top: 10px;"><i class="fa fa-plus-circle"></i> TAMBAH</a>
                                        </div>
                                    <input type="text" class="form-control" name="q"
                                        placeholder="Cari berdasarkan nama kategori">
                                    <div class="input-group-append">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> CARI
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;width: 6%">NO.</th>
                                        <th scope="col">NAMA KATEGORI</th>
                                        <th scope="col" style="width: 15%;text-align: center">AKSI</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($categories as $no => $category)
                                        <tr>
                                            <th scope="row" style="text-align: center">
                                                {{ ++$no + ($categories->currentPage() - 1) * $categories->perPage() }}</th>
                                            <td>{{ $category->name }}</td>
                                            <td class="text-center">
                                                    <a href="{{ route('kategori.edit', $category->id) }}"
                                                        class="btn btn-sm btn-primary">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </a>
                                                    <button onClick="Delete({{ $category->id }})" class="btn btn-sm btn-danger">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <div style="text-align: center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        function Delete(id) {
            var token = $("meta[name='csrf-token']").attr("content");

            swal({
                title: "APAKAH KAMU YAKIN?",
                text: "INGIN MENGHAPUS DATA INI!",
                icon: "warning",
                buttons: [
                    'TIDAK',
                    'YA'
                ],
                dangerMode: true,
            }).then(function(isConfirm) {
                if (isConfirm) {
                    jQuery.ajax({
                        url: "/kategori/delete/" + id,
                        data: {
                            "_token": token
                        },
                        type: 'DELETE',
                        success: function(response) {
                            if (response.status == "success") {
                                swal({
                                    title: 'BERHASIL!',
                                    text: 'DATA BERHASIL DIHAPUS!',
                                    icon: 'success',
                                    timer: 1000,
                                    showConfirmButton: false,
                                    showCancelButton: false,
                                    buttons: false,
                                }).then(function() {
                                    location.reload();
                                });
                            } else {
                                swal({
                                    title: 'GAGAL!',
                                    text: 'DATA GAGAL DIHAPUS!',
                                    icon: 'error',
                                    timer: 1000,
                                    showConfirmButton: false,
                                    showCancelButton: false,
                                    buttons: false,
                                }).then(function() {
                                    location.reload();
                                });
                            }
                        },
                        error: function() {
                            swal({
                                title: 'GAGAL!',
                                text: 'Terjadi kesalahan, silakan coba lagi.',
                                icon: 'error',
                                timer: 1000,
                                showConfirmButton: false,
                                showCancelButton: false,
                                buttons: false,
                            }).then(function() {
                                location.reload();
                            });
                        }
                    });
                } else {
                    return true;
                }
            });
        }
    </script>
@stop
