<?php

use App\Http\Controllers\Admin\LogController;
use App\Http\Controllers\Admin\orderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\UploadController;
use App\Http\Controllers\FrontendController;
use Illuminate\Support\Facades\Route;


//Admin_Login---------------------------------------------------------------------------------------------------
Route::get('/authentic/login', [LogController::class, 'show_login'])->name('login');
Route::post('/check_login', [LogController::class,'check_login']);
Route::get('/authentic/register',[LogController::class,'show_register'])->name('register');
Route::post('/check_register',[LogController::class,'check_register']);
Route::get('/authentic/forgetpw',[LogController::class,'show_forgetpw']);
Route::post('/edit_pass',[LogController::class,'edit_pass']);
Route::post('/change-admin-password',[LogController::class,'changeadminpassword']);
//End_Admin_Login------------------------------------------------------------------------------------------------


//Product_IDP------------------------------------------------------------------------------------------------------
Route::post('/admin/product/add', [ProductController::class,'insert_product']);
Route::get('/admin/product/delete',[ProductController::class,'delete_product']);
Route::post('/admin/product/edit/{id}',[ProductController::class,'update_product']);
//End_Product_IDP--------------------------------------------------------------------------------------------------


//Delete_Order-----------------------------------------------------------------------------------------------------
Route::get('/admin/order/delete_detail',[ProductController::class,'delete_order_detail']);
Route::get('/admin/order/delete_order',[ProductController::class,'delete_order']);
//End_Delete_Order-------------------------------------------------------------------------------------------------


//Product_Image----------------------------------------------------------------------------------------------------
Route::post('/upload',[UploadController::class,'uploadImage']);
//End_Product_Image------------------------------------------------------------------------------------------------


//Client_Login-----------------------------------------------------------------------------------------------------
Route::get('/authentic/cli_login',[LogController::class,'show_cli_login']);
Route::post('/check_cli_login',[LogController::class,'check_cli_login']);
Route::get('/authentic/cli_register',[LogController::class,'show_cli_register']);
Route::post('/check_cli_register',[LogController::class,'check_cli_register']);
Route::get('/authentic/cli_forgetpw',[LogController::class,'show_cli_forgetpw']);
Route::post('/edit_cli_pass',[LogController::class,'edit_cli_pass']);
Route::post('/change-password', [LogController::class, 'changePassword']);
//End_Client_Login-------------------------------------------------------------------------------------------------


//Cart----------------------------------------------------------------------------------------------------
Route::post('/cart/add',[FrontendController::class,'add_cart']);
Route::get('/cart/delete/{id}',[FrontendController::class,'delete_cart']);
Route::post('/cart/update',[FrontendController::class,'update_cart']);
Route::post('/cart/send',[FrontendController::class,'send_cart']);
//End_Cart------------------------------------------------------------------------------------------------


//Banking-------------------------------------------------------------------------------------------------
Route::post('/cart/banking',[FrontendController::class,'banking_cart']);
//End_Banking---------------------------------------------------------------------------------------------


//ChooseToLogin-------------------------------------------------------------------------------------------
Route::get('/', [LogController::class,"show_choose_ad_cli"]);
Route::get('authentic/choose_ad_cli', [LogController::class,"show_choose_ad_cli"])->name('logout');
//EndChooseToLogin----------------------------------------------------------------------------------------


//Admin_Page---------------------------------------------------------------------------------------------------------
Route::prefix('admin') -> group(function(){
    Route::get('adminpage',[ProductController::class,'show_main']);
    Route::get('product/list', [ProductController::class,'list_product'])->name('product.search');
    Route::get('product/create', [ProductController::class,'add_product']);
    Route::get('product/edit/{id}',[ProductController::class,'edit_product']);
    Route::get('admin_info',[ProductController::class,'show_admin_info']);
    Route::get('admin_custompass',[ProductController::class,'show_admin_custompass']);
    Route::get('order/list', [orderController::class,'list_order'])->name('order.search');
    Route::get('order/detail/{order_detail}', [orderController::class,'detail_order']);
});
//End_Admin_Page------------------------------------------------------------------------------------------------------


//Client_Page------------------------------------------------------------------------------------------------------
Route::prefix('client')-> group(function(){
    Route::get('list/food', [FrontendController::class,'index']);
    Route::get('list/condiment', [FrontendController::class,'condiment_index']);
    Route::get('list/drink', [FrontendController::class,'drink_index']);
    Route::get('list/electric', [FrontendController::class,'elect_index']);
    Route::get('list/frozen', [FrontendController::class,'frozen_index']);
    Route::get('list/fruit', [FrontendController::class,'vefr_index']);
    Route::get('list/house_care', [FrontendController::class,'houcare_index']);
    Route::get('list/person_care', [FrontendController::class,'percare_index']);
    Route::get('list/snack', [FrontendController::class,'snack_index']);
    Route::get('search_list', [FrontendController::class,'search_list_index'])->name('client.search');
    Route::get('cart', [FrontendController::class,'show_cart']);
    Route::get('product_detail/{id}', [FrontendController::class,'show_product']);
    Route::get('order_confirm',[FrontendController::class,'show_order_confirm']);
    Route::get('order_not_confirm', [FrontendController::class,'show_order_not_confirm']);
    Route::get('client_info',[FrontendController::class,'show_client_info']);
    Route::get('custompassword',[FrontendController::class,'show_custompassword']);
    Route::get('bkupay',[FrontendController::class,'show_bkupay'])->name('bkupay.payment');
});
//End_Client_Page--------------------------------------------------------------------------------------------------


