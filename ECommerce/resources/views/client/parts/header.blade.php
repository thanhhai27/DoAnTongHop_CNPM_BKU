<div class="admin-content-top-left">
    <form action="{{ route('client.search') }}" method="GET">
        <div class="header-search">
            <input type="text" name="keyword" placeholder="Tìm kiếm" value="{{ request()->input('keyword') }}">
            <button type="submit">
                <i class="ri-search-line"></i>
            </button>
        </div>
    </form>
    <div class="sorting-icon-cover">
        <a id="sortIcon" onclick="window.location.href='?sort=asc'" class="ri-sort-asc">
            <span class="tooltip">Giá tăng</span>
        </a> 
        <a id="sortIcon" onclick="window.location.href='?sort=desc'" class="ri-sort-desc">
            <span class="tooltip">Giá giảm</span>
        </a>
    </div>
</div>
<div class="admin-content-top-right">
    <ul class="flex-box">
        @php
            $cart = Session::get('cart', []);
            $totalItems = array_sum($cart);
        @endphp
        <li class="cart-noti">
            <a href="/client/cart"><i class="ri-shopping-cart-line" number="{{$totalItems}}"></i></a>
            <div class="dropdown-cart">
                <ul>
                    @foreach ($dropcart_products as $dropcart_product)
                    @php
                        $price = $dropcart_product -> price_sale * Session::get('cart')[$dropcart_product -> id];
                    @endphp
                        <li>
                            <div class="product-item-image">
                                <img src="{{asset($dropcart_product-> image)}}" alt="">
                            </div>
                            <div class="product-detail-info">
                                <h1>{{$dropcart_product -> name}}</h1>
                                <div class="product-item-price">
                                    <p>{{number_format($dropcart_product -> price_sale)}}<sup>đ</sup></p>
                                </div>
                            </div>
                            <div class="product-item-quantity">
                                <span class="product-item-quantity-title">SL: </span>
                                <span class="product-item-quantity-info">{{Session::get('cart')[$dropcart_product -> id]}}</span>
                                <p class="product-item-quantity-total">{{number_format($price)}}<sup>đ</sup></p>
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>
        </li>
        <li class="cart-noti"><i class="ri-notification-4-line" number='1'></i></li>
        <li class="flex-box profile-menu">
            <img style="width: 45px;" src="{{asset('frontend/asset/images/profile.png')}}">
            <i style="font-size: 23px;" class="ri-arrow-down-s-fill"></i>
            <!-- Dropdown menu hiển thị khi nhấn vào flex-box -->
            <div class="dropdown-content">
                <ul>
                    <li><a href="/client/client_info">Thông tin cá nhân</a></li>
                    <li><a href="/client/custompassword">Đổi mật khẩu</a></li>
                    <li><a href="{{ route('logout') }}">Đăng xuất</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>