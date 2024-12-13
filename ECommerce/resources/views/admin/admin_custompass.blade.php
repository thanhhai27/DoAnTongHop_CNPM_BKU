<!DOCTYPE html>
<html lang="en">
<head>
    @include('admin.parts.head')
</head>
<body>
    <section class="admin">
        <div class="row-grid">
            <div class="admin-sidebar">
                <div class="admin-sidebar-top">
                    <a href="/admin/adminpage"><img src="{{asset('backend/asset/images/logo.png')}}" alt=""></a>
                </div>
                <div class="admin-sidebar-content">
                    <ul>
                        <li>
                            <a href="/admin/adminpage">
                                <i class="ri-dashboard-line"></i>
                                <div class="admin-sidebar-headline">Trang chủ</div>
                                <i class="ri-add-box-line"></i>
                            </a>
                        </li>
                        <li class="{{ request()->is('admin/admin_info') ? 'active' : '' }}">
                            <a href="/admin/admin_info">
                                <i class="ri-file-info-line"></i>
                                <div class="admin-sidebar-headline">Thông tin</div>
                                <i class="ri-add-box-line"></i>
                            </a>
                        </li>
                        <li class="{{ request()->is('admin/admin_custompass') ? 'active' : '' }}">
                            <a href="/admin/admin_custompass">
                                <i class="ri-lock-line"></i>
                                <div class="admin-sidebar-headline">Đổi mật khẩu</div>
                                <i class="ri-add-box-line"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="admin-content">
                <div class="admin-content-top">
                    @include('admin/parts/header')
                </div>
                <div class="admin-content-main">
                    <div class="admin-content-main-title">
                        <h1>{{$title}}</h1>
                    </div>
                    <div class="admin-content-main-content">
                        <form action="/change-admin-password" method="POST">
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
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<footer>
        @include('admin/parts/footer')
</footer>
</html>