<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductType;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    //
    public function getDanhSach(){
    	$tintuc = Product::all();
    	return view('admin.sanpham.danhsach',['tintuc'=>$tintuc]);
    }

    public function Them(){
    	$theloai = ProductType::all();
    	return view('admin.sanpham.them',['theloai'=>$theloai]);
    }

    public function XuLyThemTT(Request $request){
    	$this->validate($request,
    		[
    			
    			'article_title' => 'required|unique:products,name|min:6',
    			'article_desc' => 'required',
    			'article_img' => 'required',
    			'article_content'=> 'required|min:4',
    		],
    		[
    			'article_title.required'=>'Bạn chưa nhập Tên Sản Phẩm!',
    			'article_title.unique'=>'Tên Sản Phẩm đã tồn tại!',
    			'article_title.min'=>'Tên Sản Phẩm gồm ít nhất 6 ký tự!',
    			'article_desc.required'=>'Bạn chưa nhập Mô Tả cho Sản Phẩm!',
    			'article_img.required'=>'Bạn chưa chọn hình ảnh cho Sản Phẩm!',
    			'article_content.required'=>'Bạn chưa nhập giá Gốc cho Sản Phẩm!',
    			'article_content.min'=>'Giá quá rẻ, yêu cầu tối thiểu 1000 vnd trở lên!',
    		]);
    	$tintuc = new Product;
    	$tintuc->id_type = $request->cate;
    	$tintuc->name = $request->article_title;
    	$tintuc->description = $request->article_desc;
    	$tintuc->unit_price = $request->article_content;
    	$tintuc->promotion_price = $request->article_content1;
    	if($request->hasFile('article_img')) // Kiểm tra xem người dùng có upload hình hay không
    	{
    		$img_file = $request->file('article_img'); // Nhận file hình ảnh người dùng upload lên server
    		
    		$img_file_extension = $img_file->getClientOriginalExtension(); // Lấy đuôi của file hình ảnh

    		if($img_file_extension != 'png' && $img_file_extension != 'jpg' && $img_file_extension != 'jpeg')
    		{
    			return redirect('admin/sanpham/them')->with('error','Định dạng hình ảnh không hợp lệ (chỉ hỗ trợ các định dạng: png, jpg, jpeg)!');
    		}

    		$img_file_name = $img_file->getClientOriginalName(); // Lấy tên của file hình ảnh

    		$random_file_name = str_random(4).'_'.$img_file_name; // Random tên file để tránh trường hợp trùng với tên hình ảnh khác trong CSDL
    		while(file_exists('source/image/product/'.$random_file_name)) // Trường hợp trên gán với 4 ký tự random nhưng vẫn có thể xảy ra trường hợp bị trùng, nên bỏ vào vòng lặp while để kiểm tra với tên tất cả các file hình trong CSDL, nếu bị trùng thì sẽ random 1 tên khác đến khi nào ko trùng nữa thì thoát vòng lặp
    		{
    			$random_file_name = str_random(4).'_'.$img_file_name;
    		}
    		echo $random_file_name;

    		$img_file->move('source/image/product',$random_file_name); // file hình được upload sẽ chuyển vào thư mục có đường dẫn như trên
    		$tintuc->image = $random_file_name;
    	}
    	else
    		$tintuc->image = ''; // Nếu người dùng không upload hình thì sẽ gán đường dẫn là rỗng

    	
    	
    	$tintuc->save();

    	return redirect('admin/sanpham/them')->with('message','Thêm Sản Phẩm mới thành công!');
    }

    public function Sua($id){
    	$tintuc = Product::find($id);
    	$theloai = ProductType::all();
    	return view('admin.sanpham.sua',['tintuc'=>$tintuc,'theloai'=>$theloai]);
    }

    public function XuLySuaTT(Request $request,$id){
    	$tintuc = Product::find($id);
    	$theloai = ProductType::all();
    	$this->validate($request,
    		[
    			
    			'article_title' => 'required|unique:products,name|min:6',
    			'article_desc' => 'required',
    			'article_content'=> 'required|min:4',
    		],
    		[
    			'article_title.required'=>'Bạn chưa nhập Tên Sản Phẩm!',
    			'article_title.unique'=>'Tên Sản Phẩm đã tồn tại!',
    			'article_title.min'=>'Tên Sản Phẩm gồm ít nhất 6 ký tự!',
    			'article_desc.required'=>'Bạn chưa nhập Tóm tắt cho Sản Phẩm!',
    			'article_content.required'=>'Bạn chưa nhập Giá cho Sản Phẩm!',
    			'article_content.min'=>'Giá quá rẻ, yêu cầu tối thiểu 1000 vnd trở lên!',
    		]);

    	$tintuc->id_type = $request->cate;
    	$tintuc->name = $request->article_title;
    	$tintuc->description = $request->article_desc;
    	$tintuc->unit_price = $request->article_content;
    	$tintuc->promotion_price = $request->article_content1;

    	if($request->hasFile('article_img'))
    	{
    		$img_file = $request->file('article_img');
    		
    		$img_file_extension = $img_file->getClientOriginalExtension();

    		if($img_file_extension != 'png' && $img_file_extension != 'jpg' && $img_file_extension != 'jpeg')
    		{
    			return redirect('admin/sanpham/them')->with('error','Định dạng hình ảnh không hợp lệ (chỉ hỗ trợ các định dạng: png, jpg, jpeg)!');
    		}

    		$img_file_name = $img_file->getClientOriginalName();

    		$random_file_name = str_random(4).'_'.$img_file_name;
    		while(file_exists('source/image/product/'.$random_file_name))
    		{
    			$random_file_name = str_random(4).'_'.$img_file_name;
    		}
    		echo $random_file_name;

    		$img_file->move('source/image/product',$random_file_name);

    		unlink('source/image/product/'.$tintuc->image); // Xóa hình cũ
    		$tintuc->image = $random_file_name; // Lưu lại hình mới
    	}
    	// Không có else vì nếu người dùng không muốn thay đổi lại hình khác thì vẫn giữ lại đường dẫn hình cũ, gán mặc định như trên sẽ làm mất đường dẫn hình

    	
    	$tintuc->save();

    	return redirect('admin/sanpham/sua/'.$id)->with('message','Sửa Bài viết thành công!');
    }

    public function Xoa($id){
    	//Product::find($id)->delete();
    	$tintuc = Product::find($id);
        $tintuc->Delete();
    	return redirect('admin/sanpham/danhsach')->with('message','Xóa Sản Phẩm thành công!');
    }
}
