<!DOCTYPE html>
<html lang="en">
<head>
    @include('admin.parts.head')
</head>
<body>
    <section class="admin">
        <div class="row-grid">
            <div class="admin-sidebar">
                @include('admin/parts/sidebar')
            </div>
            <div class="admin-content">
                <div class="admin-content-top">
                    <div class="admin-content-top-left">
                        <form action="{{route('order.search')}}" method="GET">
                            <div class="header-search">
                                <input type="text" name="keyword" placeholder="Tìm kiếm" value="{{ request()->input('keyword') }}">
                                <button type="submit">
                                    <i class="ri-search-line"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="admin-content-top-right">
                        <ul class="flex-box">
                            <li class="cart-noti"><i class="ri-notification-4-line" number='3'></i></li>
                            <li class="cart-noti"><i class="ri-message-2-line" number='5'></i></li>
                            <li class="flex-box profile-menu">
                                <img style="width: 45px;" src="{{asset('backend/asset/images/profile.png')}}">
                                <i style="font-size: 23px;" class="ri-arrow-down-s-fill"></i>

                                <!-- Dropdown menu hiển thị khi nhấn vào flex-box -->
                                <div class="dropdown-content">
                                    <ul>
                                        <li><a href="/admin/admin_info">Thông tin cá nhân</a></li>
                                        <li><a href="/admin/admin_custompass">Đổi mật khẩu</a></li>
                                        <li><a href="{{ route('logout') }}">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="admin-content-main">
                    <div class="admin-content-main-title">
                        <h1>{{$title}}</h1>
                    </div>
                    <div class="admin-content-main-content">
                        <div class="admin-content-main-content-order-list">
                            <div class="admin-content-main-content-order-list-outer">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên</th>
                                            <th>Điện thoại</th>
                                            <th>Email</th>
                                            <th>Địa chỉ</th>
                                            <th>Thông tin bổ sung</th>
                                            <th>Hình thức TT</th>
                                            <th>Chi tiết</th>
                                            <th>Ngày</th>
                                            <th>Tùy biến</th>
                                        </tr>
                                    </thead>
                                    <body>
                                        @foreach ($orders as $order)
                                            <tr>
                                                <td>{{$order -> id}}</td>
                                                <td>{{$order -> name}}</td>
                                                <td>{{$order -> phone}}</td>
                                                <td>{{$order -> email}}</td>
                                                <td>{{$order -> address}}, {{$order -> city}}, {{$order -> district}}, {{$order -> ward}}</td>
                                                <td>{{$order -> note}}</td>
                                                <td>{{$order -> method}}</td>
                                                <td>
                                                    <a class="edit-class" href="/admin/order/detail/{{$order -> order_detail}}">Chi tiết</a>
                                                </td>
                                                <td>{{$order -> created_at}}</td>
                                                <td>
                                                    <a onclick="removeRow(order_id=<?php echo $order -> id?>,url='/admin/order/delete_order')" class="delete-class" href="">Xóa</a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </body>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
    function removeRow(order_id,url){
    if(confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')){
            $.ajax({
            url: url,
            data: {order_id},
            method: 'GET',
            dataType:'JSON',
            success: function (res){
            console.log(res)
            }
        }
        )
    }
    }
</script>
<script src="{{asset('backend/asset/js/script.js')}}"></script>