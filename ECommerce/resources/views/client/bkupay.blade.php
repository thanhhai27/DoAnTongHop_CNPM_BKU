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
        <form action="/cart/banking" method="post">
        <div class="container-heading">
            <a href="/client/list/food"><img src="{{asset('frontend/asset/images/logo.png')}}" alt=""><span>ECOMMERCE</span></a>
            <span>| Thanh Toán</span>
            <div class="container-heading-right">
                <span>Thời gian còn lại: </span>
                <span id="minutes">00</span>
                <span>:</span>
                <span id="seconds">30</span>
            </div>
        </div>
        <div class="bankingcart">
            <div class="bankingcart-heading">
                <h3>Thanh toán đơn hàng của </h3>
                <p>{{$orderName}}</p>
            </div>
            <div class="bankingcart-body">
                <div class="bankingcart-body-left">
                    <div class="bankingcart-body-left-top">
                        <h3>Thông tin đơn hàng</h3>
                    </div>
                    <div class="bankingcart-body-left-bottom">
                        <table class="bankingcart-body-table">
                            <tr>
                                <th>Tên khách hàng</th>
                                <td>{{$orderName}}</td>
                            </tr>
                            <tr>
                                <th>Số điện thoại</th>
                                <td>{{$orderPhone}}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>{{$orderMail}}</td>
                            </tr>
                            <tr>
                                <th>Tổng đơn hàng</th>
                                <td>{{number_format($orderTotal)}} VNĐ</td>
                            </tr>
                            <tr>
                                <th>Địa chỉ</th>
                                <td>{{$orderAddress}}, {{$orderCity}}, {{$orderDistrict}}, {{$orderWard}}</td>
                            </tr>
                            <tr>
                                <th>Ghi chú</th>
                                <td>{{$orderNote}}</td>
                            </tr>
                            <tr>
                                <th>Trạng thái</th>
                                <td style="color: #EEB422; font-weight: bold">Chờ thanh toán</td>
                            </tr>
                            <tr>
                                <th>Phí ship</th>
                                <td style="color: #00CD00; font-weight: bold">FREE SHIP</td>
                            </tr>
                        </table>
                    </div>
                    <a class="cart-return-button" href="/client/cart"><i class="ri-arrow-go-back-line"></i>Quay lại</a>
                </div>
                <div class="bankingcart-body-right">
                    <div class="bankingcart-body-right-left">
                        <div class="bankingcart-body-rl-heading">
                            <h3>Thông tin thanh toán</h3>
                        </div>
                        <div class="bankingcart-body-rl-body">
                            <div class="bankingcart-body-rlb-top">
                                <p>Quý khách vui lòng chuyển khoản tới số tài khoản bên dưới hoặc quét mã QR để thực hiện thanh toán. Vui lòng nhập đúng số tài khoản và nội dung chuyển khoản</p>
                            </div>
                            <div class="bankingcart-body-rlb-bottom">
                                <ul>
                                    <li>Ngân hàng TMCP Ngoại Thương Việt Nam - Chi nhánh Hùng Vương - TP.HCM</li>
                                    <li>Số tài khoản: 0421000789789</li>
                                    <li>Tên tài khoản: TRƯỜNG ĐẠI HỌC BÁCH KHOA</li>
                                    <li>Số tiền: {{number_format($orderTotal)}} VNĐ</li>
                                    <li>Nội dùng: [Email]_Tiền hàng</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="bankingcart-body-right-right">
                        <div class="banking-cart-body-rr-heading">
                            <h3>Quét mã để thanh toán</h3>
                        </div>
                        <div class="banking-cart-body-rr-image">
                            <img src="{{asset("frontend/asset/images/qrcode.jpg")}}" alt="">
                        </div>
                        <button class="main-btn">Xác nhận thanh toán</button>
                    </div>
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
<script>
        let timeLeft = 30;

        function startCountdown() {
            const minutesDisplay = document.getElementById("minutes");
            const secondsDisplay = document.getElementById("seconds");

            const countdown = setInterval(() => {
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;

        // Cập nhật giao diện từng phần tử
        minutesDisplay.textContent = minutes.toString().padStart(2, '0');
        secondsDisplay.textContent = seconds.toString().padStart(2, '0');

        // Add warning effect when time is under 10 seconds
        if (timeLeft < 10) {
                minutesDisplay.classList.add("warning");
                secondsDisplay.classList.add("warning");
        } else {
            minutesDisplay.classList.remove("warning");
            secondsDisplay.classList.remove("warning");
        }

        // Khi hết thời gian
        if (timeLeft <= 0) {
            clearInterval(countdown);
            minutesDisplay.textContent = "00";
            secondsDisplay.textContent = "00";
            window.location.href = '/client/order_not_confirm';
        }

        timeLeft--;
        }, 1000);
    }

// Bắt đầu đếm ngược khi trang được tải
window.onload = startCountdown;
</script>
</html>