@extends('admin.main')
@section('content')
<div class="admin-content-main-content-order-list-in">
    <div class="admin-content-main-content-order-list-inner">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Ảnh</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Tùy biến</th>
                </tr>
            </thead>
            <body>
                @php
                    $total = 0;
                @endphp
                @foreach ($products as $product)
                @php
                    $price = $product -> price_sale * $order_detail[$product -> id];
                    $total += $price;
                @endphp
                    <tr>
                        <td>{{$product -> id}}</td>
                        <td><img style="width: 70px;" src="{{asset($product -> image)}}" alt=""></td>
                        <td>{{$product -> name}}</td>
                        <td>{{number_format($product -> price_sale)}}</td>
                        <td>{{$order_detail[$product -> id]}}</td>
                        <td>{{number_format($price)}}</td>
                        <td>
                            <a onclick="removeRow(product_id=<?php echo $product -> id?>,url='/admin/order/delete_detail')" class="delete-class" href="">Xóa</a>
                        </td>
                    </tr>
                @endforeach
            </body>
        </table>
    </div>
</div>
<div class="total-money">
    <span class="total-money-heading">Tổng cộng</span> 
    <span class="total-money-detail">{{number_format($total)}}<sup>đ</sup></span>
</div>
@endsection
@section('footer')
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
@endsection