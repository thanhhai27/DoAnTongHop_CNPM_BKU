<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\order;
use App\Models\product;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function add_product(){
        return view('admin.product.add',[
            'title' => 'Thêm Sản Phẩm'
        ]);
    }
    public function insert_product(Request $request){
        // Initialize error array
        $errors = [];

        // Check the 'category' field
        $category = $request->input('category');
        if (empty($category)) {
            $errors['category'] = 'Loại sản phẩm là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'subcategory' field
        $subcategory = $request->input('subcategory');
        if (empty($subcategory)) {
            $errors['subcategory'] = 'Nhánh sản phẩm là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'name' field
        $name = $request->input('name');
        if (empty($name)) {
            $errors['name'] = 'Tên sản phẩm là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (strlen($name) < 2) {
            $errors['name'] = 'Tên sản phẩm phải có ít nhất 2 ký tự';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'price_sale' field
        $price_sale = $request->input('price_sale');
        if (empty($price_sale)) {
            $errors['price_sale'] = 'Giá bán là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (!is_numeric($price_sale)) {
            $errors['price_sale'] = 'Giá bán phải là số';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'image' field
        $image = $request->input('image');
        if (empty($image)) {
            $errors['image'] = 'Hình ảnh là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        $product = new product();
        $product -> category = $request -> input('category');
        $product -> subcategory = $request -> input('subcategory');
        $product -> image = $request -> input('image');
        $product -> name = $request -> input('name');
        $product -> price_sale = $request -> input('price_sale');
        $product -> save();
        return redirect()-> back();
    }
    public function list_product(Request $request){
        $keyword = $request->input('keyword');
        $query = product::query();
        if ($keyword) {
            $query->where(function($q) use ($keyword) {
                $q->where('name', 'like', '%' . $keyword . '%')
                  ->orWhere('price_sale', 'like', '%' . $keyword . '%')
                  ->orWhere('category', 'like', '%' . $keyword . '%')
                  ->orWhere('subcategory', 'like', '%' . $keyword . '%')
                  ->orWhere('created_at', 'like', '%' . $keyword . '%');
            });
        }
        $product = $query->get();

        return view('admin.product.list',[
            'title' => 'Danh sách Sản Phẩm',
            'products' => $product
        ]);
    }

    public function delete_product(Request $request){
        product::find($request -> product_id) -> delete();
    }
    public function edit_product(Request $request){
        $product = product::find($request -> id);
        return view('/admin/product/edit',[
            'title' => 'Sửa Sản Phẩm',
            'product' => $product
        ]);
    }
    public function update_product(Request $request){
        $product = product::find($request -> id);
        $product -> image = $request -> input('image');
        $product -> name = $request -> input('name');
        $product -> price_sale = $request -> input('price_sale');
        $product -> save();
        return redirect('/admin/product/list');
    }
    public function show_admin_info(){
        return view('admin.admin_info',[
            'title'=> 'Thông tin cá nhân'
        ]);
    }

    public function show_admin_custompass(){
        return view('admin.admin_custompass',[
            'title'=> 'Đổi mật khẩu'
        ]);
    }

    public function show_main(Request $request){
        
        // Nhận giá trị ngày bắt đầu và ngày kết thúc từ request, nếu không có thì lấy mặc định
        $startDate = $request->input('start_date', Carbon::now()->subMonth()->format('Y-m-d'));
        $endDate = $request->input('end_date', Carbon::now()->format('Y-m-d'));
    
        // Chuyển $endDate sang cuối ngày
        $endDate = Carbon::parse($endDate)->endOfDay();
    
        // Truy vấn tổng số đơn hàng theo từng ngày
        $orders = DB::table('orders')
                    ->select(DB::raw('DATE(created_at) as date'), DB::raw('COUNT(*) as total_orders'))
                    ->whereBetween('created_at', [$startDate, $endDate])
                    ->groupBy('date')
                    ->orderBy('date')
                    ->get();

        // Tính tổng số lượng hóa đơn trong khoảng thời gian
        $totalOrdersCount = DB::table('orders')
        ->whereBetween('created_at', [$startDate, $endDate])
        ->count();
        
        // Lấy tất cả order_detail trong khoảng thời gian
        $orderDetails = DB::table('orders')
        ->whereBetween('created_at', [$startDate, $endDate])
        ->pluck('order_detail');

        // Đếm số lượng từng sản phẩm và tính tổng thu nhập
        $productCounts = [];
        $totalIncome = 0;
        
        foreach ($orderDetails as $detail) {
            $items = json_decode($detail, true);
            if ($items) {
                foreach ($items as $productId => $quantity) {
                    // Tăng số lượng sản phẩm
                    if (isset($productCounts[$productId])) {
                        $productCounts[$productId] += $quantity;
                    } else {
                        $productCounts[$productId] = $quantity;
                    }

                    // Tính tổng thu nhập cho sản phẩm hiện tại
                    $product = DB::table('products')
                        ->select('price_sale')
                        ->where('id', $productId)
                        ->first();

                    if ($product) {
                        $totalIncome += $product->price_sale * $quantity;
                    }
                }
            }
        }

        // Sắp xếp sản phẩm theo số lượng và lấy ra top 5 ID có số lượng lớn nhất
        arsort($productCounts);
        $topProductIds = array_slice(array_keys($productCounts), 0, 5);

        // Truy vấn để lấy tên và ảnh của các sản phẩm trong top 5
        $topProducts = DB::table('products')
            ->whereIn('id', $topProductIds)
            ->select('id', 'name', 'image')
            ->get();

        // Truyền dữ liệu vào view
        return view('admin.adminpage', [
            'title' => 'Trang chủ',
            'orders' => $orders,
            'startDate' => $startDate,
            'endDate' => $endDate->format('Y-m-d'),
            'topProducts' => $topProducts,
            'productCounts' => $productCounts,
            'totalIncome' => $totalIncome,
            'totalOrdersCount' => $totalOrdersCount,
        ]);
    }
    

    public function delete_order_detail(Request $request){
        product::find($request -> product_id) -> delete();
    }

    public function delete_order(Request $request){
        order::find($request -> order_id) -> delete();
    }
}
