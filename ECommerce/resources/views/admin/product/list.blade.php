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
                        <form action="{{route('product.search')}}" method="GET">
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
                        <div class="admin-content-main-content-product-list">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá bán</th>
                                        <th>Ngày đăng</th>
                                        <th>Tùy chỉnh</th>
                                    </tr>
                                </thead>
                                <body>
                                    @foreach ($products as $product)
                                        <tr>
                                            <td>{{$product -> id}}</td>
                                            <td><img style="width: 70px;" src="{{asset($product -> image)}}" alt=""></td>
                                            <td>{{$product -> name}}</td>
                                            <td>{{number_format($product -> price_sale)}}</td>
                                            <td>{{$product -> created_at}}</td>
                                            <td>
                                                <a href="/admin/product/edit/{{$product -> id}}" class="edit-class" href="">Sửa</a>
                                                |
                                                <a onclick="removeRow(product_id=<?php echo $product -> id?>,url='/admin/product/delete')" class="delete-class" href="">Xóa</a>
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
    </section>
</body>
<script src="{{asset('backend/asset/js/script.js')}}"></script>
<script>
    function removeRow(product_id,url){
        if(confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')){
                $.ajax({
                url: url,
                data: {product_id},
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