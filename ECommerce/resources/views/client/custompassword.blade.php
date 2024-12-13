<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"rel="stylesheet" />
    <link rel="stylesheet" href="{{asset('frontend/asset/css/confirm_success.css')}}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <title>{{$title}}</title>
</head>
<body>
    <section class="admin">
        <div class="row-grid">
            <div class="admin-sidebar">
                <div class="admin-sidebar-top">
                    <a href="/client/list/food"><img src="{{asset('frontend/asset/images/logo.png')}}" alt=""><h3>ECOMMERCE</h3></a>
                </div>
                <div class="admin-sidebar-content">
                    <ul>
                        <li>
                            <a href="/client/list/food" >
                                <img src="{{asset('frontend/asset/images/home.png')}}" alt="">
                                <span>Trang chủ</span>
                            </a>
                        </li>
                        <li class="{{ request()->is('client/client_info') ? 'active' : '' }}">
                            <a href="/client/client_info" >
                                <img src="{{asset('frontend/asset/images/information.png')}}" alt="">
                                <span>Thông tin cá nhân</span>
                            </a>
                        </li>
                        <li class="{{ request()->is('client/custompassword') ? 'active' : '' }}">
                            <a href="/client/custompassword">
                                <img src="{{asset('frontend/asset/images/change-password.png')}}" alt="">
                                <span>Đổi mật khẩu</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="admin-content">
                <div class="admin-content-top">
                    @include('client/parts/header')
                </div>
                <section class="info-detail">
                    <div class="info-detail-overall">
                        <h3>Thay đổi mật khẩu</h3>
                    </div>
                    <form action="/change-password" method="POST">
                        <div class="info-password-body">
                            <p>Mật khẩu cũ:</p>
                            <div class="password-content">
                                <input type="password" name="old_password" placeholder="Mật khẩu cũ" id="old_password">
                                <a id="eye-icon" class="ri-eye-off-fill" onclick="togglePasswordVisibility('old_password', this)"></a>
                            </div>
                            @if ($errors->has('old_password'))
                                <div class="error-message">
                                    {{ $errors->first('old_password') }}
                                </div>
                            @endif
                            <p>Mật khẩu mới:</p>
                            <div class="password-content">
                                <input type="password" name="new_password" placeholder="Mật khẩu mới" id="new_password">
                                <a id="eye-icon" class="ri-eye-off-fill" onclick="togglePasswordVisibility('new_password', this)"></a>
                            </div>
                            @if ($errors->has('new_password'))
                                <div class="error-message">
                                    {{ $errors->first('new_password') }}
                                </div>
                            @endif
                            <p>Xác nhận mật khẩu mới:</p>
                            <div class="password-content">
                                <input type="password" name="confirm_password" placeholder="Mật khẩu xác nhận" id="confirm_password">
                                <a id="eye-icon" class="ri-eye-off-fill" onclick="togglePasswordVisibility('confirm_password', this)"></a>
                            </div>
                            @if ($errors->has('confirm_password'))
                                <div class="error-message">
                                    {{ $errors->first('confirm_password') }}
                                </div>
                            @endif
                            <button type="submit">Thay đổi mật khẩu</button>
                        </div>
                        @csrf
                    </form>
                </section>
            </div>
        </div>
    </section>
    <footer>
        @include('client/parts/footer')
    </footer>
</body>
</html>