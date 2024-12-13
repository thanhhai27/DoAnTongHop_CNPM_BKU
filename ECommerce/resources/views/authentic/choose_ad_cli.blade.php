<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" 
    integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" 
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>{{$title}}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('authenticate/asset/css/choose.css')}}">
    <link rel="stylesheet" href="{{asset('authenticate/asset/css/reset.css')}}">
</head>
<body>
    <div id="choose-page">
        <div id="form-choose">
            <div class="form-choose-img">
                <img class="form-img" src="{{asset('authenticate/asset/images/logo.png')}}" alt="">
            </div>
            <h1 class="form-choose-heading">Đăng nhập bằng tài khoản của bạn</h1>
            <a href="/authentic/cli_login">Khách hàng</a>
            <a href="/authentic/login">Quản trị viên</a>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="{{asset('authenticate/asset/js/login.js')}}"></script>
</html>