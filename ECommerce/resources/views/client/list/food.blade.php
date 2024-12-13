@extends('client.main')
@section('content')
    <form action="/cart/add" method="post">
        <div class="admin-content-main-content">
            @php
                $sortParam = request()->get('sort');
                $sortOrder = $sortParam === 'desc' ? 'sortByDesc' : 'sortBy';

                $groupedProducts = $products->groupBy('subcategory');

                // Hàm để trích xuất số từ chuỗi
                function extractNumber($string) {
                    preg_match('/\d+/', $string, $matches); // Tìm số đầu tiên trong chuỗi
                    return $matches ? (int)$matches[0] : 0; // Trả về số hoặc 0 nếu không tìm thấy
                }
            @endphp

            @foreach ($groupedProducts as $subcategory => $items)
                <div class="admin-content-main-content-headline">
                    <h3>
                    @if ($subcategory === 'FOOD1')
                        Các Loại Bánh Mì
                    @elseif ($subcategory === 'FOOD2')
                        Các Loại Bánh Bao
                        @elseif ($subcategory === 'FOOD3')
                        Mì Trộn
                    @endif
                    </h3>
                </div>
                <ul class="admin-content-main-content-products">
                    @foreach ($items->{$sortOrder}
                    (function($product) use ($sortParam) 
                    {
                        return $sortParam === 'asc' || $sortParam === 'desc' ? (int) $product->price_sale : (int) extractNumber($product->name);
                    }) as $product)
                        <li>
                            <div class="admin-content-main-content-product-item">
                                <div class="product-top">
                                    <a href="/client/product_detail/{{$product->id}}" class="product-thumb">
                                        <img src="{{ asset($product->image) }}" alt="{{ $product->name }}">
                                    </a>
                                </div>
                                <div class="product-info">
                                    <a href="/client/product_detail/{{$product->id}}" class="product-name">{{ $product->name }}</a>
                                    <div class="product-price">{{ number_format($product->price_sale) }} VNĐ</div>
                                </div>
                            </div>
                        </li>
                    @endforeach
                </ul>
            @endforeach
        </div>
    </form>
@endsection