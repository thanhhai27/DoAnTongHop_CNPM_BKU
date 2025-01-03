<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Báo Đơn Hàng Mới</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        .highlight {
            font-weight: bold;
            font-size: 1.5em;
            color: #2a7ae2;
        }
        h3 {
            color: #2a7ae2; 
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }
        .order-detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .order-detail-table th, .order-detail-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .order-detail-table th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <p class="highlight">Thông Báo Đơn Hàng Mới</p>
    
    <p>Quản trị viên thân mến,</p>
    <p>Hệ thống vừa ghi nhận một đơn hàng mới từ khách hàng {{ $mailInfo['name'] }}. Dưới đây là thông tin chi tiết về đơn hàng.</p>
    
    <h3>Thông tin khách hàng:</h3>
    <ul>
        <li><strong>Tên khách hàng:</strong> {{ $mailInfo['name'] }}</li>
        <li><strong>Số điện thoại:</strong> {{ $mailInfo['phone'] }}</li>
        <li><strong>Email:</strong> {{ $mailInfo['email'] }}</li>
        <li><strong>Tỉnh/Thành Phố:</strong> {{ $mailInfo['city'] }}</li>
        <li><strong>Quận/Huyện:</strong> {{ $mailInfo['district'] }}</li>
        <li><strong>Xã/Phường:</strong> {{ $mailInfo['ward'] }}</li>
        <li><strong>Địa chỉ:</strong> {{ $mailInfo['address'] }}</li>
        <li><strong>Ghi chú:</strong> {{ $mailInfo['note'] }}</li>
        <li><strong>Phương thức thanh toán:</strong> {{ $mailInfo['method'] }}</li>
    </ul>
    
    <h3>Chi tiết đơn hàng:</h3>
    <div class="order_detail_info_table">
        <table class="order-detail-table">
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                @foreach($mailInfo['$order_detail_info'] as $item)
                @php
                    $price = $item->price_sale * $mailInfo['$order_detail_ids'][$item->id];
                @endphp
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $mailInfo['$order_detail_ids'][$item->id] }}</td>
                        <td>{{ number_format($item->price_sale) }}</td>
                        <td>{{ number_format($price) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    
    <p>Xin vui lòng kiểm tra và xử lý đơn hàng kịp thời để đảm bảo trải nghiệm tốt nhất cho khách hàng.</p>
    
    <p>Trân trọng,<br>
    <strong>Hệ thống ECommerce</strong><br>
    Địa chỉ: 268 Lý Thường Kiệt, Phường 14, Quận 10, Hồ Chí Minh <br>
    Hotline: 028 3865 4087</p>
</body>
</html>
