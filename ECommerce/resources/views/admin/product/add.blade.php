@extends('admin.main')
@section('content')
<form action="/admin/product/add" enctype="multipart/form-data" method="post">
    <div class="admin-content-main-content-product-add">
        <div class="admin-content-main-content-input">
            <div class="admin-content-main-content-error">
                <input type="text" value="{{old('category')}}" name="category" placeholder="Loại sản phẩm">
                @if ($errors->has('category'))
                    <div class="error-message">
                        {{ $errors->first('category') }}
                    </div>
                @endif
            </div>
            <div class="admin-content-main-content-error">
                <input type="text" value="{{old('subcategory')}}" name="subcategory" placeholder="Nhánh sản phẩm">
                @if ($errors->has('subcategory'))
                    <div class="error-message">
                        {{ $errors->first('subcategory') }}
                    </div>
                @endif
            </div>
        </div>
        <div class="admin-content-main-content-input">
            <div class="admin-content-main-content-error">
                <input type="text" value="{{old('name')}}" name="name" placeholder="Tên sản phẩm">
                @if ($errors->has('name'))
                    <div class="error-message">
                        {{ $errors->first('name') }}
                    </div>
                @endif
            </div>
            <div class="admin-content-main-content-error">
                <input type="text" value="{{old('price_sale')}}"  name="price_sale" placeholder="Giá bán">
                @if ($errors->has('price_sale'))
                    <div class="error-message">
                        {{ $errors->first('price_sale') }}
                    </div>
                @endif
            </div>
        </div>
        <div class="admin-content-main-content-image">
            <label for="file">Ảnh Sản Phẩm</label>
            <input id="file" type="file">
            <input type="hidden" name="image" id="input-file-img-hiden">
            <div class="cover-image-show">
                <div class="image-show" id="input-file-img">
                
                </div>
            </div>
        </div>
        @if ($errors->has('image'))
            <div class="error-image">
                {{ $errors->first('image') }}
            </div>
        @endif
        <button type="submit" class="main-btn">Thêm Sản Phẩm</button>
    </div>
    @csrf
</form>
@endsection
@section('footer')
<script src="{{asset('backend/asset/js/product_ajax.js')}}"></script>
@endsection