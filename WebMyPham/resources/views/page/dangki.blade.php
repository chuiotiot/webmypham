@extends('master')
@section('content')
	
	
	<div class="container">
		<div id="content">
			
			<form action="{{route('signin')}}" method="post" class="beta-form-checkout">
			<input type="hidden" name="_token" value="{{csrf_token()}}">
				<div class="row">
					<div class="col-sm-3"></div>
					@if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $err)
							<h6>{{$err}}</h6>
							@endforeach
						</div>
					@endif
					@if(Session::has('thanhcong'))
						<div class="alert alert-success"><h6>{{Session::get('thanhcong')}}</h6></div>
					@endif
					<div class="col-sm-6">
						<h4>Đăng kí</h4>
						<div class="space20">&nbsp;</div>

						
						<div class="form-block">
							<label for="email">Email*</label>
							<input type="email" name="email" placeholder="Nhập Email" required>
						</div>

						<div class="form-block">
							<label for="your_last_name">Họ Tên*</label>
							<input type="text" name="fullname" required placeholder="Nhập họ tên">
						</div>

						<div class="form-block">
							<label for="adress">Địa Chỉ*</label>
							<input type="text" name="address" value="" required placeholder="Nhập địa chỉ">
						</div>


						<div class="form-block">
							<label for="phone">SĐT*</label>
							<input type="text" name="phone" required placeholder="Nhập số điện thoại">
						</div>
						<div class="form-block">
							<label for="password">Mật Khẩu*</label>
							<input type="password" name="password" required placeholder="Nhập mật khẩu">
						</div>
						<div class="form-block">
							<label for="password">Xác Nhận Mật Khẩu*</label>
							<input type="password" name="re_password" required placeholder="Nhập lại mật khẩu">
						</div>
						<div class="form-block">
							<button type="submit" class="btn btn-primary">Đăng Ký</button>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection