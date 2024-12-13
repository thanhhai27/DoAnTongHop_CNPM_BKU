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
                        <section class="info-detail">
                            <div class="info-detail-body">
                                <p class="info-detail-name">Tên: <span>{{ session('user_data.name') }}</span></p>
                                <?php
                                    $email = session('user_data.email');
                                    $atPosition = strpos($email, '@');
                                    $maskedEmail = substr($email, 0, $atPosition - 5) . '*****' . substr($email, $atPosition);
                                ?>
                                <p class="info-detail-email">Email: <span id="email-display">{{ $maskedEmail }}</span><a id="eye-icon" class="ri-eye-off-fill"></a></p>
                                <p class="info-detail-password">Mật khẩu: <span id="password-display"><?php echo str_repeat('*', strlen(session('user_data.password'))); ?></span></p>
                                <p class="hidden_password" style="display: none">{{ session('user_data.password') }}</p>
                                <p class="hidden_email" style="display: none">{{ session('user_data.email') }}</p>

                                <!-- Modal nhập mật khẩu -->
                                <div class="passwordModal" id="passwordModal">
                                    <h3>Nhập mật khẩu để hiển thị</h3>
                                    <div class="passwordModal-detail">
                                        <input type="password" id="passwordInput" placeholder="Nhập mật khẩu">
                                        <button onclick="checkPassword()">Xác nhận</button>
                                        <button onclick="closeModal()">Đóng</button>
                                    </div>
                                    <p id="error-message" style="font-size: 18px ;color:red; display:none;">Mật khẩu không chính xác</p>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
        const sessionPassword = document.querySelector('.hidden_password').textContent;
        const fullEmail = document.querySelector('.hidden_email').textContent;
        const maskedEmail = "{{ $maskedEmail }}"; // Đảm bảo maskedEmail là chuỗi JavaScript

        document.getElementById('eye-icon').addEventListener('click', function () {
            if (this.classList.contains('ri-eye-off-fill')) {
                // Hiển thị modal để nhập mật khẩu
                document.getElementById('passwordModal').style.display = 'block';
            } else if (this.classList.contains('ri-eye-fill')) {
                // Che lại email
                document.getElementById('email-display').innerText = maskedEmail;
                this.className = 'ri-eye-off-fill';
            }
        });

        function checkPassword() {
            const inputPassword = document.getElementById('passwordInput').value;
            if (inputPassword === sessionPassword) {
                // Hiển thị email đầy đủ khi mật khẩu đúng
                document.getElementById('email-display').innerText = fullEmail;
                document.getElementById('eye-icon').className = 'ri-eye-fill';
                closeModal();
            } else {
                // Hiển thị thông báo lỗi khi mật khẩu không đúng
                document.getElementById('error-message').style.display = 'block';
            }
        }

        function closeModal() {
            document.getElementById('passwordModal').style.display = 'none';
            document.getElementById('error-message').style.display = 'none';
            document.getElementById('passwordInput').value = '';
        }
    </script>
<footer>
        @include('admin/parts/footer')
</footer>
</html>