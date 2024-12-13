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
                        <h3>Thông tin cá nhân</h3>
                    </div>
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
                            <p id="error-message" style="color:red; display:none;">Mật khẩu không chính xác</p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
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
        @include('client/parts/footer')
    </footer>
</body>
</html>