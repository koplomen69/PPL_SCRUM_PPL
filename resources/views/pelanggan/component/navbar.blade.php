<nav class="navbar navbar-dark navbar-expand-lg" style="background-color: #025464">
    <div class="container">
        <a class="navbar-brand" href="#">Toko Pakaian Canggih</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end gap-4" id="navbarSupportedContent">
            <ul class="navbar-nav gap-4">
                <!-- Favorite -->
                <li class="nav-item">
                    <div class="notif">
                        <a href="{{ route('favorites.index') }}" class="fs-5 nav-link {{ Request::path() == 'favorites' ? 'active' : '' }}">
                            <i class="fa fa-heart"></i> Favorite
                        </a>
                        @if (isset($favoritesCount) && $favoritesCount > 0)
                            <div class="circle">{{ $favoritesCount }}</div>
                        @endif
                    </div>
                </li>

                <!-- Home -->
                <li class="nav-item">
                    <a class="nav-link {{ Request::path() == '/' ? 'active' : '' }}" aria-current="page" href="/">Home</a>
                </li>

                <!-- Shop -->
                <li class="nav-item">
                    <a class="nav-link {{ Request::path() == 'shop' ? 'active' : '' }}" href="/shop">Shop</a>
                </li>

                <!-- About Us -->
                <li class="nav-item">
                    <a class="nav-link {{ Request::path() == 'contact' ? 'active' : '' }}" href="/contact">About Us</a>
                </li>

                <!-- Contact Us -->
                <li class="nav-item">
                    <a class="nav-link {{ Request::path() == 'contact_us' ? 'active' : '' }}" href="/contact_us">Contact Us</a>
                </li>

                <!-- User Authentication -->
                @auth
                    <div class="select" tabindex="0" role="button">
                        <div class="text-links">
                            <div class="d-flex gap-2 align-items-center">
                                <img src="{{ asset('storage/user/' . Auth::user()->foto) }}" class="rounded-circle" style="width: 50px;" alt="">
                                <div class="d-flex flex-column text-white">
                                    <p class="m-0" style="font-weight: 700; font-size:14px;">{{ Auth::user()->name }}</p>
                                    <p class="m-0" style="font-size:12px">{{ Auth::user()->email }}</p>
                                </div>
                            </div>
                        </div>
                        <div class="links-login text-white" id="links-login">
                            <a href="logout_pelanggan" style="text-decoration: none" role="button" tabindex="0">Keluar</a>
                        </div>
                    </div>
                @else
                    <li class="nav-item">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Login | Register
                        </button>
                    </li>
                @endauth

                <!-- Transaksi -->
                <li class="nav-item">
                    <div class="notif">
                        <a href="/transaksi" class="fs-5 nav-link {{ Request::path() == 'transaksi' ? 'active' : '' }}">
                            <i class="fa fa-bag-shopping"></i>
                        </a>
                        @if ($count)
                            <div class="circle">{{ $count }}</div>
                        @endif
                    </div>
                </li>

                <!-- Checkout -->
                <li class="nav-item">
                    <div class="notif">
                        <a href="/checkOut" class="fs-5 nav-link {{ Request::path() == 'checkOut' ? 'active' : '' }}">
                            <i class="fa fa-cash-register"></i>
                        </a>
                    </div>
                </li>

                <!-- History -->
                <li class="nav-item">
                    <div class="notif">
                        <a href="/history" class="fs-5 nav-link {{ Request::path() == 'history' ? 'active' : '' }}">
                            <i class="fa fa-history"></i> History
                        </a>
                        @if (isset($historyCount) && $historyCount > 0)
                            <div class="circle">{{ $historyCount }}</div>
                        @endif
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
