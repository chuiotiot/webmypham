<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex'
]);
Route::get('trang-chu',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex'
]);
Route::get('loai-san-pham/{type}',[
	'as'=>'loaisanpham',
	'uses'=>'PageController@getLoaiSp'
]);
Route::get('chi-tiet-san-pham/{id}',[
	'as'=>'chitietsanpham',
	'uses'=>'PageController@getChitiet'
]);
Route::get('lien-he',[
	'as'=>'lienhe',
	'uses'=>'PageController@getLienHe'
]);
Route::get('gioi-thieu',[
	'as'=>'gioithieu',
	'uses'=>'PageController@getGioiThieu'
]);
Route::get('add-to-cart/{id}',[
	'as'=>'themgiohang',
	'uses'=>'PageController@getAddtoCart'
]);
Route::get('del-cart/{id}',[
	'as'=>'xoagiohang',
	'uses'=>'PageController@getDelItemCart'
]);
Route::get('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@getCheckout'
]);

Route::post('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@postCheckout'
]);
Route::get('dang-nhap',[
	'as'=>'login',
	'uses'=>'PageController@getLogin'
]);
Route::post('dang-nhap',[
	'as'=>'login',
	'uses'=>'PageController@postLogin'
]);
Route::get('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@getSignin'
]);
Route::post('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@postSignin'
]);

Route::get('dang-xuat',[
	'as'=>'logout',
	'uses'=>'PageController@postLogout'
]);
Route::get('tim-kiem',[
	'as'=>'search',
	'uses'=>'PageController@getSearch'
]);

//Route Đăng nhập Admin

Route::get('admin/dangnhap','UserController@getDangnhapAdmin');
Route::post('admin/dangnhap','UserController@postDangnhapAdmin');
Route::get('admin/logout','UserController@getDangXuatAdmin');

//Route Admin
// 'prefix' => 'admin' : trỏ tới folder
// get('danhsach',..) : Route{{'danhsach'}}
Route::group(['prefix' => 'admin','middleware'=>'adminLogin'],function(){

	Route::get('','CustomerController@index');

	// Route group The Loai
	Route::group(['prefix' => 'theloai'],function(){
		// Route URL: admin/theloai/danhsach
		Route::get('danhsach','TheLoaiController@getDanhSach');

		// Route URL: admin/theloai/them
		Route::get('them','TheLoaiController@Them');

		Route::post('them','TheLoaiController@XuLyThemTL');

		// Route URL: admin/theloai/sua
		Route::get('sua/{id}','TheLoaiController@Sua');

		Route::post('sua/{id}','TheLoaiController@XuLySuaTL');

		Route::get('xoa/{id}','TheLoaiController@Xoa');
	});

	// Route group Hoa Don
	Route::group(['prefix' => 'hoadon'],function(){
		Route::get('danhsach','BillController@getDanhSach');

		Route::get('them','BillController@Them');

		Route::post('them','BillController@XuLyThemLT');

		Route::get('sua/{id}','BillController@Sua');

		Route::post('sua/{id}','BillController@XuLySuaLT');

		Route::get('xoa/{id}','BillController@Xoa');
	});
	// Route group Chi Tiet Hoa Don
	Route::group(['prefix' => 'chitiethoadon'],function(){
		Route::get('danhsach','BillDetailController@getDanhSach');

		Route::get('them','BillDetailController@Them');

		Route::post('them','BillDetailController@XuLyThemLT');

		Route::get('sua/{id}','BillDetailController@Sua');

		Route::post('sua/{id}','BillDetailController@XuLySuaLT');

		Route::get('xoa/{id}','BillDetailController@Xoa');
	});

	// Route group San Pham
	Route::group(['prefix' => 'sanpham'],function(){
		Route::get('danhsach','ProductController@getDanhSach');

		Route::get('them','ProductController@Them');

		Route::post('them','ProductController@XuLyThemTT');

		Route::get('sua/{id}','ProductController@Sua');

		Route::post('sua/{id}','ProductController@XuLySuaTT');

		Route::get('xoa/{id}','ProductController@Xoa');
	});

	Route::group(['prefix' => 'slide'],function(){
		Route::get('danhsach','ProductController@getDanhSach');

		Route::get('them','ProductController@Them');

		Route::post('them','ProductController@XuLyThemTT');

		Route::get('sua/{id}','ProductController@Sua');

		Route::post('sua/{id}','ProductController@XuLySuaTT');

		Route::get('xoa/{id}','ProductController@Xoa');
	});
	// Route Customer
	Route::group(['prefix' => 'customer'],function(){
		Route::get('danhsach','CustomerController@getDanhSach');

		Route::get('them','CustomerController@Them');

		Route::post('them','CustomerController@XuLyThemUser');

		Route::get('sua/{id}','CustomerController@Sua');

		Route::post('sua/{id}','CustomerController@XuLySuaUser');

		Route::get('xoa/{id}','CustomerController@Xoa');
	});

	// Route group User
	Route::group(['prefix' => 'user'],function(){
		Route::get('danhsach','UserController@getDanhSach');

		Route::get('them','UserController@Them');

		Route::post('them','UserController@XuLyThemUser');

		Route::get('sua/{id}','UserController@Sua');

		Route::post('sua/{id}','UserController@XuLySuaUser');

		Route::get('xoa/{id}','UserController@Xoa');
	});

	
	// Route group Slide
	Route::group(['prefix' => 'slide'],function(){
		Route::get('danhsach','SlideController@getDanhSach');

		Route::get('them','SlideController@Them');

		Route::post('them','SlideController@XuLyThemSlide');

		Route::get('sua/{id}','SlideController@Sua');

		Route::post('sua/{id}','SlideController@XuLySuaSlide');

		Route::get('xoa/{id}','SlideController@Xoa');
	});

	// Route group Ajax
	Route::group(['prefix'=>'ajax'],function(){
		Route::get('layloaitin/{idTheLoai}','AjaxController@getLoaiTin');

		Route::get('timestamp','AjaxController@timestamp');
	});
});
