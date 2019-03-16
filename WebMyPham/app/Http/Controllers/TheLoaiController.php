<?php

namespace App\Http\Controllers;
use App\Slide;
use App\Product;
use App\ProductType;

use Illuminate\Http\Request;
class TheLoaiController extends Controller
{
    //
    public function getDanhSach(){
    	$theloai = ProductType::all();
    	return view('admin.theloai.danhsach',compact('theloai'));
    }
    public function Them(){

    	    	return view('admin.theloai.them');

    }
    //POST: Them the loai
    public function XuLyThemTL(Request $request){
    

    	// Kiểm tra dữ liệu đầu vào (không được rỗng, giới hạn của dữ liệu được nhập)
    	$this->validate($request,
    		[
    			'cate_name'=>'required|min:3|max:100'
    			// Unique: Dữ liệu nhập vào không được trùng với dữ liệu hiện tại. 
    			// Cú pháp của unique:tên_bảng,tên_cột
    		],
    		[
    			'cate_name.required'=>'Bạn chưa nhập tên Thể Loại!',
    			'cate_name.min'=>'Tên Thể Loại gồm ít nhất 3 ký tự!',
    			'cate_name.max'=>'Tên Thể Loại gồm tối đa 100 ký tự!',
    		]);

    	// Thêm dữ liệu vào CSDL, ở đây 1 record dữ liệu được xem như một đối tượng (object), vì ta sử dụng Eloquent nên tất cả các bảng trong CSDL đã được ánh xạ thành Model trong Laravel. Do đó dữ liệu mới được thêm vào bằng cách tạo 1 đối tượng mới.

    	$theloai = new ProductType;
    	$theloai->name = $request->cate_name;
    	$theloai->save();

    	return redirect('admin/theloai/them')->with('message','Đã thêm Thể Loại Thành Công!');
    }
    // Sửa Thể Loại
    public function Sua($id){
    	// Khi người dùng gửi request lên server như form chẳng hạn thì mới dùng request để nhận dữ liệu, bình thường ta dùng biến bình thường.

    	$theloai = ProductType::find($id);
    	return view('admin.theloai.sua',compact('theloai'));
    }

    public function XuLySuaTL(Request $request,$id){
    	$theloai = ProductType::find($id);
    	$this->validate($request,
    		[
    			'cate_changed' => 'required|min:3|max:100'
    		],
    		[
    			'cate_changed.required' => 'Bạn chưa nhập tên Thể Loại!',
    			'cate_changed.min' => 'Tên Thể Loại gồm ít nhất 3 ký tự!',
    			'cate_changed.max' => 'Tên Thể Loại gồm tối đa 100 ký tự!'
    		]);
    	$theloai->name = $request->cate_changed;
    	$theloai->save();

    	return redirect('admin/theloai/sua/'.$id)->with('message','Cập nhật tên Thể Loại thành công');
    }

    public function Xoa($id){
    	$theloai = ProductType::find($id); 
        $product = Product::where('id_type',$id); //Tìm các SP của Loai SP
        $product->delete(); //Xóa các SP theo Loai SP
        $theloai->Delete(); // Xóa Loại SP

    	return redirect('admin/theloai/danhsach')->with('message','Xóa Thể Loại thành công!');
    }

    
}
