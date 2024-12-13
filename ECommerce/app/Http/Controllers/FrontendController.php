<?php

namespace App\Http\Controllers;

use App\Mail\AdminMail;
use App\Mail\ClientMail;
use App\Models\order;
use App\Models\product;
use App\Notifications\EmailNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Str;
use function PHPUnit\Framework\isNull;

class FrontendController extends Controller
{
    public function index() {
        $products = product::where('category', 'FOOD')
                           ->where(function($query) {
                               $query->where('subcategory', 'FOOD1')
                                     ->orWhere('subcategory', 'FOOD2')
                                     ->orWhere('subcategory', 'FOOD3');
                           })->get();
        
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();     

        return view('client.list.food', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Ăn'
        ]);
    }
    public function drink_index() {
        $products = product::where('category', 'DRINK')
                           ->where(function($query) {
                               $query->where('subcategory', 'DRINK1')
                                     ->orWhere('subcategory', 'DRINK2')
                                     ->orWhere('subcategory', 'DRINK3');
                           })->get();
    
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();

        return view('client.list.drink', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Uống'
        ]);
    }
    public function vefr_index() {
        $products = product::where('category', 'VEFR')
                           ->where(function($query) {
                               $query->where('subcategory', 'VEFR1')
                                     ->orWhere('subcategory', 'VEFR2')
                                     ->orWhere('subcategory', 'VEFR3');
                           })->get();
 
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
                                                      
        return view('client.list.fruit', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Rau Củ và Trái Cây'
        ]);
    }
    public function frozen_index() {
        $products = product::where('category', 'FROZEN')
                           ->where(function($query) {
                               $query->where('subcategory', 'FROZEN1')
                                     ->orWhere('subcategory', 'FROZEN2')
                                     ->orWhere('subcategory', 'FROZEN3');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
                           
        return view('client.list.frozen', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Đông Lạnh'
        ]);
    }
    public function snack_index() {
        $products = product::where('category', 'SNACK')
                           ->where(function($query) {
                               $query->where('subcategory', 'SNACK1')
                                     ->orWhere('subcategory', 'SNACK2')
                                     ->orWhere('subcategory', 'SNACK3')
                                     ->orWhere('subcategory', 'SNACK4');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
        
        return view('client.list.snack', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Ăn Vặt'
        ]);
    }
    public function condiment_index() {
        $products = product::where('category', 'CONDIMENT')
                           ->where(function($query) {
                               $query->where('subcategory', 'CONDIMENT1')
                                     ->orWhere('subcategory', 'CONDIMENT2')
                                     ->orWhere('subcategory', 'CONDIMENT3')
                                     ->orWhere('subcategory', 'CONDIMENT4')
                                     ->orWhere('subcategory', 'CONDIMENT5');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
        
        return view('client.list.condiment', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Gia Vị'
        ]);
    }
    public function percare_index() {
        $products = product::where('category', 'PERCARE')
                           ->where(function($query) {
                               $query->where('subcategory', 'PERCARE1')
                                    ->orWhere('subcategory', 'PERCARE2')
                                    ->orWhere('subcategory','PERCARE3')
                                    ->orWhere('subcategory','PERCARE4');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
        
        return view('client.list.person_care', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Chăm Sóc Cá Nhân'
        ]);
    }
    public function houcare_index() {
        $products = product::where('category', 'HOUCARE')
                           ->where(function($query) {
                               $query->where('subcategory', 'HOUSECARE1')
                                    ->orWhere('subcategory', 'HOUSECARE2');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
        
        return view('client.list.house_care', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Chăm Sóc Nhà Cửa'
        ]);
    }
    public function elect_index() {
        $products = product::where('category', 'ELECT')
                           ->where(function($query) {
                               $query->where('subcategory', 'ELECT1')
                                    ->orWhere('subcategory', 'ELECT2');
                           })->get();

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();
        
        return view('client.list.electric', [
            'dropcart_products' => $dropcart_products,
            'products' => $products,
            'title' => 'Đồ Điện Tử'
        ]);
    }

    
    public function show_product(Request $request){
        $products = product::find($request -> id);

        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();

        return view('client.product_detail',[
            'dropcart_products' => $dropcart_products,
            'product' => $products,
            'title' => 'Thông tin sản phẩm'
        ]);
    }
    public function add_cart(Request $request){
        $product_id = $request -> product_id;
        $product_qty = $request -> product_qty;
        if(is_null(Session::get('cart'))){
            Session::put('cart',[
                $product_id => $product_qty
            ]);
            if ($request->action == 'checkout') {
                return redirect('/client/cart');
            } else {
                return redirect('/client/list/food');
            }
        }
        else{
            $cart = Session::get('cart');
            if(Arr::exists($cart,$product_id)){
                $cart[$product_id] += $product_qty;
                Session::put('cart',$cart);
                if ($request->action == 'checkout') {
                    return redirect('/client/cart');
                } else {
                    return redirect('/client/list/food');
                }
            }
            else{
                $cart[$product_id] = $product_qty;
                Session::put('cart',$cart);
                if ($request->action == 'checkout') {
                    return redirect('/client/cart');
                } else {
                    $previousUrl = $request->input('previous_url', '/client/list/food');
                    if (preg_match('#^http://127\.0\.0\.1:8000/client/list/(food|drink|fruit|frozen|snack|condiment|person_care|house_care|electric)$#', $previousUrl)) {
                        return redirect($previousUrl);
                    } else {
                        return redirect('/client/list/food');
                    }
                }
            }
        }
    }
    public function show_cart(){
        $cart = Session::get('cart', []);
        if (is_array($cart) && !empty($cart)) {
            $product_id = array_keys($cart); 
            $products = Product::whereIn('id', $product_id)->get();
        } else {
            $products = collect();
        }
        return view('client.cart', [
            'products' => $products,
            'title' => 'Đơn hàng'
        ]);
    }
    

    public function delete_cart(Request $request){
        $cart = Session::get('cart');
        $product_id = $request -> id;
        unset($cart[$product_id]);
        Session::put('cart',$cart);
        return redirect('/client/cart');
    }
    public function update_cart(Request $request){
        $cart = $request -> product_id;
        Session::put('cart',$cart);
        return redirect('/client/cart');
    }

    public function send_cart(Request $request){
        // Initialize error array
        $errors = [];

        // Check the 'name' field
        $name = $request->input('name');
        if (empty($name)) {
            $errors['name'] = 'Tên là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (strlen($name) < 2) {
            $errors['name'] = 'Tên phải có ít nhất 2 ký tự';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'phone' field
        $phone = $request->input('phone');
        if (empty($phone)) {
            $errors['phone'] = 'Số điện thoại là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (!preg_match('/^[0-9]{10,15}$/', $phone)) {
            $errors['phone'] = 'Số điện thoại không hợp lệ (chỉ chứa 10-15 chữ số)';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Kiểm tra trường email
        $email = $request->input('email');
        if (empty($email)) {
            $errors['email'] = 'Email là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errors['email'] = 'Email không hợp lệ';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Initialize an error array if any field is empty
        $city = $request->input('city');
        $district = $request->input('district');
        $ward = $request->input('ward');

        if (empty($city) || empty($district) || empty($ward)) {
            $errors['location'] = 'Vui lòng chọn đầy đủ Tỉnh/Thành phố, Quận/Huyện và Phường/Xã';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'address' field
        $address = $request->input('address');
        if (empty($address)) {
            $errors['address'] = 'Địa chỉ là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        } elseif (strlen($address) < 5) {
            $errors['address'] = 'Địa chỉ phải có ít nhất 5 ký tự';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        // Check the 'method' field
        $method = $request->input('method');
        if (empty($method)) {
            $errors['method'] = 'Phương thức thanh toán là bắt buộc';
            return redirect()->back()->withErrors($errors)->withInput();
        }

        $token = Str::random(13);
        $order = new order;
        $order -> name = $request -> input('name');
        $order -> phone = $request -> input('phone');
        $order -> email = $request -> input('email');
        $order -> city = $request -> input('city');
        $order -> district = $request -> input('district');
        $order -> ward = $request -> input('ward');
        $order -> address = $request -> input('address');
        $order -> note = $request -> input('note');
        $order -> method = $request -> input('method');
        $order_detail = json_encode($request -> input('product_id'));
        $order -> order_detail = $order_detail;
        $order -> token = $token;
        $order -> save();
        
        Session::put('order_name', $order->name);

        $order_detail_ids = json_decode($order_detail, true);
        $order_detail_id = array_keys($order_detail_ids);
        $order_detail_info = product::whereIn('id',$order_detail_id) -> get();

        $mailInfo = [
            'name' => $order->name,
            'phone' => $order->phone,
            'email' => $order->email,
            'city' => $order->city,
            'district' => $order->district,
            'ward' => $order->ward,
            'address' => $order->address,
            'note' => $order->note,
            'method' => $order->method,
            '$order_detail_info' => $order_detail_info,
            '$order_detail_ids' => $order_detail_ids,
            'token' => $token
        ];

        // Calculate total amount
        $cartItems = $request->input('product_id');
        $total = 0;

        foreach ($cartItems as $productId => $quantity) {
            $product = Product::find($productId);
            if ($product) {
                $total += $product->price_sale * $quantity;
            }
        }

        // Store total in session
        Session::put('order_total', $total);

        Session::put('order_data', [
            'name' => $request->input('name'),
            'phone' => $request->input('phone'),
            'email' => $request->input('email'),
            'city' => $request->input('city'),
            'district' => $request->input('district'),
            'ward' => $request->input('ward'),
            'address' => $request->input('address'),
            'note' => $request->input('note'),
            'method' => $request->input('method'),
            'order_detail' => $order_detail,
        ]);

        if ($order->method === "Tiền mặt") {
            Session::forget('cart');
            // Send mail for cash method
            Mail::to('congtyecommercetutru@gmail.com')->send(new AdminMail($mailInfo));
            Mail::to($order->email)->send(new ClientMail($mailInfo));
            return redirect('/client/order_confirm');
        } elseif ($order->method === "Chuyển khoản") {
            // Redirect to VNPAY page for payment
            return redirect()->route('bkupay.payment', [
                'total' => $total
            ]);
        }
    }
    public function show_client_info(){
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();     
        return view('client.client_info',[
            'dropcart_products' => $dropcart_products,
            'title' => 'Thông tin cá nhân'
        ]);
    }
    
    public function search_list_index(Request $request){
        $keyword = $request->input('keyword');
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();  
        // Tìm sản phẩm dựa trên từ khóa trong name hoặc price_sale
        $products = Product::where('name', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('price_sale', 'LIKE', '%' . $keyword . '%')
                        ->get();
        
        // Đặt giá trị cho biến title
        $title = "Sản phẩm";
        // Trả về view cùng với kết quả tìm kiếm
        return view('client.search_list', compact('products', 'keyword', 'title','dropcart_products'));
    }

    public function show_order_confirm(){
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();

        $orderName = Session::get('order_name');
        
        return view('client.order_confirm', [
            'orderName' => $orderName,
            'dropcart_products' => $dropcart_products,
            'title' => 'Xác nhận đơn hàng'
        ]);
    }

    public function show_order_not_confirm(){
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();

        $orderName = Session::get('order_name');
        
        return view('client.order_not_confirm', [
            'orderName' => $orderName,
            'dropcart_products' => $dropcart_products,
            'title' => 'Xác nhận thất bại'
        ]);
    }
    
    public function show_custompassword(){
        $cart = Session::get('cart', []); 
        $product_id = is_array($cart) ? array_keys($cart) : []; 
        $dropcart_products = product::whereIn('id', $product_id)->get();   
        return view('client.custompassword',[
            'dropcart_products' => $dropcart_products,
            'title' => 'Thay đổi mật khẩu'
        ]);
    }

    public function show_bkupay(Request $request){
        $orderData = Session::get('order_data');
        $orderTotal = Session::get('order_total');
        $orderName = Session::get('order_name');
        return view('client.bkupay',[
            'title' => 'Thanh toán',
            'orderName' => $orderName,
            'orderTotal' => $orderTotal,
            'orderPhone' => $orderData['phone'],
            'orderMail' => $orderData['email'],
            'orderCity' => $orderData['city'],
            'orderDistrict' => $orderData['district'],
            'orderWard' => $orderData['ward'],
            'orderAddress' => $orderData['address'],
            'orderNote' => $orderData['note'],
        ]);
    }

    public function banking_cart(Request $request){
        $orderData = Session::get('order_data');
        $token = Str::random(13);
        $order = new order;
        $order -> name = $orderData['name'];
        $order -> phone = $orderData['phone'];
        $order -> email = $orderData['email'];
        $order -> city = $orderData['city'];
        $order -> district = $orderData['district'];
        $order -> ward = $orderData['ward'];
        $order -> address = $orderData['address'];
        $order -> note = $orderData['note'];
        $order -> method = $orderData['method'];
        $order -> order_detail = $orderData['order_detail'];
        $order -> token = $token;
        $order -> save();

        $order_detail_ids = json_decode($orderData['order_detail'], true);
        $order_detail_id = array_keys($order_detail_ids);
        $order_detail_info = product::whereIn('id',$order_detail_id) -> get();

        $mailInfo = [
            'name' => $order->name,
            'phone' => $order->phone,
            'email' => $order->email,
            'city' => $order->city,
            'district' => $order->district,
            'ward' => $order->ward,
            'address' => $order->address,
            'note' => $order->note,
            'method' => $order->method,
            '$order_detail_info' => $order_detail_info,
            '$order_detail_ids' => $order_detail_ids,
            'token' => $token
        ];
        Session::forget('cart');
        Mail::to('congtyecommercetutru@gmail.com')->send(new AdminMail($mailInfo));
        Mail::to($order->email)->send(new ClientMail($mailInfo));
        return redirect('/client/order_confirm');
    }

}
