<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"rel="stylesheet" />
    <link rel="stylesheet" href="{{asset('frontend/asset/css/paid.css')}}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <title>{{$title}}</title>
</head>
<body>
    <section class="cart-section">
        <form action="/cart/send" method="post">
        <div class="container-heading">
            <a href="/client/list/food"><img src="{{asset('frontend/asset/images/logo.png')}}" alt=""><span>ECOMMERCE</span></a>
            <span>| Giỏ Hàng</span>
        </div>
        <div class="container">
            <div class="row-grid">
                <div class="cart-section-left">
                    <h2 class="main-h2">Chi tiết Đơn hàng</h2>
                    <div class="cart-section-left-detail">
                        <table>
                            <thead>
                                <tr>
                                    <th>Ảnh</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Thành Tiền</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody class="cart-section-left-body">
                                @php
                                    $total = 0;
                                @endphp
                                @foreach ($products as $product )
                                @php
                                    $price = $product -> price_sale * Session::get('cart')[$product -> id];
                                    $total += $price;
                                @endphp
                                    <tr>
                                        <td><img src="{{asset($product-> image)}}" alt=""></td>
                                        <td>
                                            <div class="product-detail-info">
                                                <h1>{{$product -> name}}</h1>
                                                <div class="product-item-price">
                                                    <p>{{number_format($product -> price_sale)}}<sup>đ</sup></p>
                                                </div>
                                            </div>
                                            <div class="product-detail-quatity">
                                                <button formaction="/cart/update" class="subtract-button">-</button>
                                                <input onkeydown="return false" class="quantity-input" name="product_id[{{$product -> id}}]" type="number" value="{{Session::get('cart')[$product -> id]}}">
                                                <button formaction="/cart/update" class="add-button">+</button>
                                            </div>
                                        </td>
                                        <td>{{number_format($price)}}<sup>đ</sup></td>
                                        <td><a href="/cart/delete/{{$product -> id}}"><i class="ri-delete-bin-2-line"></i></a></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="total-money">
                        <span class="total-money-heading">Tổng tiền</span> 
                        <span class="total-money-detail">{{number_format($total)}}<sup>đ</sup></span>
                    </div>
                    <a class="cart-return-button" href="/client/list/food"><i class="ri-arrow-go-back-line"></i>Tiếp tục Mua hàng</a>
                </div>
                <div class="cart-section-right">
                    <h2 class="main-h2">Thông tin Giao hàng</h2>
                    <div class="cart-section-right-input-name-phone">
                        <div class="cart-section-rinp-error">
                            <input type="text" placeholder="Tên" name="name" id="" value="{{ session('user_data.name', '') }}">
                            @if ($errors->has('name'))
                                <div class="error-message">
                                    {{ $errors->first('name') }}
                                </div>
                            @endif
                        </div>
                        <div class="cart-section-rinp-error">
                            <input type="text" placeholder="Số điện thoại" name="phone" id="">
                            @if ($errors->has('phone'))
                                <div class="error-message">
                                    {{ $errors->first('phone') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="cart-section-right-input-email">
                        <input type="text" placeholder="Email" name="email" id="" value="{{ session('user_data.email', '') }}">
                    </div>
                    @if ($errors->has('email'))
                        <div class="error-message">
                            {{ $errors->first('email') }}
                        </div>
                    @endif
                    <div class="cart-section-right-select">
                        <select name="city" id="city">
                            <option value="">Tỉnh/Thành phố</option>
                        </select>
                        <select name="district" id="district">
                            <option value="">Quận/Huyện</option>
                        </select>
                        <select name="ward" id="ward">
                            <option value="">Phường/Xã</option>
                        </select>
                    </div>
                    @if ($errors->has('location'))
                        <div class="error-message">
                            {{ $errors->first('location') }}
                        </div>
                    @endif
                    <div class="cart-section-right-input-address">
                        <input type="text" placeholder="Địa chỉ" name="address" id="">
                    </div>
                    @if ($errors->has('address'))
                        <div class="error-message">
                            {{ $errors->first('address') }}
                        </div>
                    @endif
                    <div class="cart-section-right-input-note">
                        <input type="text" placeholder="Ghi chú" name="note" id="">
                    </div>
                    <div class="cart-section-right-input-method">
                        <select name="method" id="payment_method">
                            <option value="" disabled selected>Phương thức</option>
                            <option value="Tiền mặt">Tiền mặt</option>
                            <option value="Chuyển khoản">Chuyển khoản</option>
                        </select>
                    </div>
                    @if ($errors->has('method'))
                        <div class="error-message">
                            {{ $errors->first('method') }}
                        </div>
                    @endif
                    <button class="main-btn">Thanh Toán Đơn Hàng</button>
                </div>
            </div>
        </div>
        @csrf
        </form>
    </section>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script src="{{asset('frontend/asset/js/apiprovince.js')}}"></script>
<script src="{{asset('frontend/asset/js/cart.js')}}"></script>
</html>