@extends('admin.layout.index')

@section('content')
<script src="admin_asset/dist/js/extra.js"></script>
<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sản Phẩm
                            <small>> {{ $tintuc->name }}</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-7" style="padding-bottom:120px">
                        @if(count($errors) > 0)
                            <div class="alert alert-danger">
                                @foreach($errors->all() as $err)
                                    <strong>{{$err}}</strong><br>
                                @endforeach
                            </div>
                        @endif
                        
                        @if(session('error'))
                            <div class="alert alert-danger">
                                <strong>{{session('error')}}</strong>
                            </div>
                        @endif

                        @if(session('message'))
                            <div class="alert alert-success">
                                <strong>{{session('message')}}</strong>
                            </div>
                        @endif
                        <form action="admin/sanpham/sua/{{ $tintuc->id }}" method="POST" enctype="multipart/form-data"> <!-- Form bắt buộc phải có thuộc tính enctype thì mới up được file lên -->
                            {{ csrf_field() }}
                            <div class="form-group">
                                <p><label>Chọn Thể Loại</label></p>
                                <select class="form-control input-width catefield" name="cate">
                                    @foreach($theloai as $chitietTL)
                                        <option
                                        @if($tintuc->product_type->id == $chitietTL->id)
                                            {{ 'selected' }}
                                        @endif
                                         value="{{ $chitietTL->id }}">{{ $chitietTL->name }}</option>
                                    @endforeach
                                </select>
                            </div>


                            <div class="form-group">
                                <p><label>Tên SP</label></p>
                                <input type="text" class="form-control input-width" name="article_title" placeholder="Nhập Tên Sản Phẩm" value="{{$tintuc->name}}" />
                            </div>

                            <div class="form-group">
                                <p><label>Mô Tả SP</label></p>
                                <textarea name="article_desc" id="demo" class="form-control ckeditor" rows="3">
                                    {{$tintuc->description}}
                                </textarea>
                            </div>

                            
                            <div class="form-group">
                                <p><label>Giá Gốc</label></p>
                                <input type="text" class="form-control input-width" name="article_content" placeholder="Nhập giá gốc vd: 200000" value="{{$tintuc->unit_price}}" />
                            </div>

                            <div class="form-group">
                                <p><label>Giá Sale</label></p>
                                
                                <input type="text" class="form-control input-width" name="article_content1" placeholder="Ko Sale thì không cần nhập" value="{{$tintuc->promotion_price }}" />
                            </div>

                            <div class="form-group">
                                <p><label>Hình Ảnh</label></p>
                                <img width="250px" src="source/image/product/{{$tintuc->image}}">
                                <input type="file" class="form-control" name="article_img">
                            </div>

                            <button type="submit" class="btn btn-default">Thực hiện</button>
                            <button type="reset" class="btn btn-default btn-mleft">Nhập Lại</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->


                
                <!-- end row -->
            </div>
            <!-- /.container-fluid -->
</div>
@endsection