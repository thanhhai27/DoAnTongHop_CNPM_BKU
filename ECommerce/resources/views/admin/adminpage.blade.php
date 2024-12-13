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
                    @include('admin/parts/header')
                </div>
                <div class="admin-content-main">
                    <div class="admin-content-main-title">
                        <h1>{{$title}}</h1>
                    </div>
                    <div class="admin-content-main-content">
                        <div class="dashboard-content-bottom">
                            <div class="form-container">
                                <form method="GET" action="/admin/adminpage">
                                    <label for="start_date">Ngày bắt đầu:</label>
                                    <input type="date" id="start_date" name="start_date" value="{{ $startDate }}">

                                    <label for="end_date">Ngày kết thúc:</label>
                                    <input type="date" id="end_date" name="end_date" value="{{ $endDate }}">

                                    <button type="submit">Xem thống kê</button>
                                </form>
                            </div>
                            <!-- Flex container for chart and table -->
                            <div class="flex-container">
                                <!-- Line Chart -->
                                <div class="chart-container">
                                    <p>Tổng thu nhập: {{ number_format($totalIncome, 0, ',', '.') }} VNĐ</p>
                                    <p>Tổng số đơn hàng: {{number_format($totalOrdersCount)}}</p>
                                    <canvas id="orderChart"></canvas>
                                </div>

                                <!-- Table for displaying top 5 products -->
                                <div class="table-container">
                                    <h3>Top 5 Sản Phẩm Bán Chạy</h3>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Ảnh</th>
                                                <th>Tên</th>
                                                <th>Số lượng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($topProducts->sortByDesc(fn($product) => $productCounts[$product->id] ?? 0) as $product)
                                                <tr>
                                                    <td>
                                                        <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" width="50" height="50">
                                                    </td>
                                                    <td>{{ $product->name }}</td>
                                                    <td>{{ $productCounts[$product->id] ?? 0 }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="{{asset('backend/asset/js/script.js')}}"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById('orderChart').getContext('2d');
    var orderData = @json($orders);

    var labels = orderData.map(order => new Date(order.date).toISOString().slice(0, 10));
    var data = orderData.map(order => order.total_orders);

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Số đơn hàng',
                data: data,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    type: 'category'
                },
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Số đơn hàng'
                    }
                }
            }
        }
    });
</script>
</html>
