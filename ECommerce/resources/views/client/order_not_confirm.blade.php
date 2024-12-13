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
            </div>
            <div class="admin-content">
                <div class="admin-content-top">
                    @include('client/parts/header')
                </div>
            </div>
        </div>
    </section>
    <section class="order-not-confirm">
        <div class="order-not-confirm-detail">
            <div class="order-not-confirm-top">
                <span class="order-not-confirm-top-left">Xác nhận thất bại đơn hàng:</span>
                <span class="order-not-confirm-top-right">{{$orderName}}</span>
            </div>
            <div class="order-not-confirm-content">
                <div class="order-not-confirm-bottom">
                    <p class="order-not-confirm-bottom-1">Đơn hàng của bạn đã gửi <span class="order-not-confirm-bottom-2">Không thành công</span><span class="order-not-confirm-bottom-3">!</span><br>
                    <span class="order-not-confirm-bottom-4">Vui lòng check lại <span class="order-not-confirm-bottom-5">Giỏ hàng</span> của bạn và thực hiện lại thanh toán.</span>
                    </p>
                    <button class="un-main-btn" onclick="window.location.href='/client/cart'">Quay lại giỏ hàng</button>
                </div>
            </div>
        </div>
    </section>
    <footer>
        @include('client/parts/footer')
    </footer>
</body>
</html>