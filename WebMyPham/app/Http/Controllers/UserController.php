<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    //
    public function getDanhSach(){
    	$user = User::all();
    	return view('admin.user.danhsach',['user'=>$user]);
    }
    public function Them(){
    	return view('admin.user.them');
    }

    public function XuLyThemUser(Request $request){
    	$this->validate($request,
    		[
    			'username' => 'required|min:3|max:100',

    			'email' => 'required|email|unique:users,email',
    			'password' => 'required|min:6|max:32',
    			'password_again' => 'required|same:password'
    		],
    		[
    			'username.required' => 'Bạn chưa nhập Họ Tên!',
    			'username.min' => 'Họ Tên tối thiểu 3 ký tự!',
    			'username.max' => 'Họ tên không được vượt quá 100 ký tự!',
    			'email.required' => 'Bạn chưa nhập địa chỉ Email!',
    			'email.email' => 'Bạn chưa nhập đúng định dạng Email!',
    			'email.unique' => 'Địa chỉ Email đã tồn tại!',
    			'password.required' => 'Bạn chưa nhập mật khẩu!',
    			'password.min' => 'Mật khẩu gồm tối thiểu 6 ký tự!',
    			'password.max' => 'Mật khẩu không được vượt quá 32 ký tự!',
    			'password_again.required' => 'Bạn chưa xác nhận mật khẩu!',
    			'password_again.same' => 'Mật khẩu xác nhận không trùng với mật khẩu đã nhập!'
    		]);

    	$user = new User;
    	$user->full_name = $request->username;
    	$user->email = $request->email;
    	$user->phone = $request->sdt;
    	$user->address = $request->address;
    	$user->password = bcrypt($request->password_again);
    	$user->quyenhan = $request->account_type;   	
    	$user->save();
    	return redirect('admin/user/them')->with('message','Thêm Tài Khoản thành công!');
    }

    public function Sua($id){
    	$user = User::find($id);
    	return view('admin.user.sua',['user' => $user]);
    }

    public function XuLySuaUser(Request $request,$id){
    	$this->validate($request,
    		[
    			'username' => 'required|min:3|max:100',
    			'email' => 'required|email',
    		],
    		[
    			'username.required' => 'Bạn chưa nhập Họ Tên!',
    			'username.min' => 'Họ Tên tối thiểu 3 ký tự!',
    			'username.max' => 'Họ Tên không được vượt quá 100 ký tự!',
    			'email.required' => 'Bạn chưa nhập địa chỉ Email!',
    			'email.email' => 'Bạn chưa nhập đúng định dạng Email!',
    		]);

    	$user = User::find($id);
    	$user->full_name = $request->username;
    	$user->email = $request->email;
    	if($request->has('password'))
    	{
    		$this->validate($request,
    		[
    			'password' => 'required|min:6|max:32',
    			'password_again' => 'required|same:password'
    		],
    		[
    			'password.required' => 'Bạn chưa nhập mật khẩu!',
    			'password.min' => 'Mật khẩu gồm tối thiểu 6 ký tự!',
    			'password.max' => 'Mật khẩu không được vượt quá 32 ký tự!',
    			'password_again.required' => 'Bạn chưa xác nhận mật khẩu!',
    			'password_again.same' => 'Mật khẩu xác nhận chưa khớp với mật khẩu đã nhập!'
    		]);
    		$user->password = bcrypt($request->password_again);
    	}
    	$user->quyenhan = $request->account_type;

    	$user->save();
    	return redirect('admin/user/sua/'.$id)->with('message','Thay Đổi thông tin Người Dùng thành công!');
    }

    public function Xoa($id){
        $user = User::find($id);
       // $user->Comment()->delete(); Tìm những Comment của User xóa trước, sau đó xóa User
    	$user->delete();
    	return redirect('admin/user/danhsach')->with('message','Xóa Người Dùng thành công!');
    }

  

 

    public function getDangnhapAdmin(){
        
        return view('admin.login');
    }

    public function postDangnhapAdmin(Request $request){
        
        $this->validate($request,
            [
                'email' => 'required',
                'password' => 'required|min:6|max:32'
            ],
            [
                'email.required' => 'Bạn chưa nhập Địa chỉ Email!',
                'password.required' => 'Bạn chưa nhập Mật khẩu!',
                'password.min' => 'Mật Khẩu gồm tối thiểu 6 ký tự!',
                'password.max' => 'Mật Khẩu gồm tối đa 32 ký tự!'
            ]);
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password]))
        {
           
                return redirect('admin/sanpham/danhsach');
            

        }  
                 
        else
            return redirect('admin/dangnhap')->with('message','Đăng Nhập không thành công!');
    }
       public function getDangXuatAdmin(){
        Auth::logout();
        return redirect('admin/dangnhap');
    }

}
