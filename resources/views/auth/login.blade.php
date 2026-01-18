<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masuk | Insighthub</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="{{ asset('login n register/style.css') }}">
</head>

<body>

    <div class="container">
        <div class="form-box login">
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <h1>Masuk</h1>
                <div class="input-box">
                    <x-input-label for="email" :value="__('')" />
                    <x-text-input id="email" class="block mt-1 w-full"

                                    type="email" placeholder="Email"
                                    name="email" :value="old('email')"
                                    required autofocus autocomplete="username" />

                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                    <i class='bx bxs-envelope' ></i>
                </div>
                <div class="input-box">
                    <x-input-label for="password" :value="__('')" />

                    <x-text-input id="password" class="block mt-1 w-full"
                                    type="password" placeholder="Password"
                                    name="password"
                                    required autocomplete="current-password" />

                    <x-input-error :messages="$errors->get('password')" class="mt-2" />
                    <i class='bx bxs-lock-alt' ></i>
                </div>
                <button type="submit" class="btn">Masuk</button>
            </form>
        </div>

        <div class="form-box register">
            <form action="">
                <h1>Daftar</h1>
                <div class="input-box">
                    <input type="text" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <input type="email" placeholder="Email" required>
                    <i class='bx bxs-envelope' ></i>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Password" required>
                    <i class='bx bxs-lock-alt' ></i>
                </div>
                <button type="submit" class="btn">Daftar</button>
            </form>
        </div>

        <div class="toggle-box">
            <div class="toggle-panel toggle-left">
                <a href="/"><img src="{{ asset('bahan-tubes/img/INSIGHTHUB (9).png') }}" alt="#" class="logo-img"></a>
                <p></p>
                <h1>Selamat Datang!</h1>
                <p>Belum mempunyai akun?</p>
                <button class="btn register-btn" onclick="delayedRedirect('{{ route('register') }}')">Daftar</button>
            </div>
            <div class="toggle-panel toggle-right">
                <a href="/"><img src="{{ asset('bahan-tubes/img/INSIGHTHUB (9).png') }}" alt="#" class="logo-img"></a>
                <p></p>
                <h1>Buat Akun!</h1>
                <p>Sudah mempunyai akun?</p>
                <button class="btn login-btn" onclick="delayedRedirect('{{ route('login') }}')">Masuk</button>
            </div>
        </div>
    </div>




    <script src="{{ asset('login n register/script.js') }}"></script>
</body>
</html>
