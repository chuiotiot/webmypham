@extends('admin.layout.index')

@section('content')
<script src="admin_asset/dist/js/extra.js"></script>
<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sản Phẩm
                            <small>> Danh Sách</small>
                        </h1>
                    </div>
                    <div class="clearfix"></div>
                    <!-- /.col-lg-12 -->
                    <div>
                        @if(session('message'))
                        <div class="alert alert-success">
                            <strong>{{session('message')}}</strong>
                        </div>
                        @endif
                    </div>
                    <div class="clearfix"></div>
                    <div class="modal-footer" style="float: left;">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><a href="admin/sanpham/them">Thêm Sản Phẩm</a></button>
                    </div>

                    
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th class="text-center">ID</th>
                                <th class="text-center">Hình Ảnh</th>
                                <th class="text-center">Tên Sản Phẩm</th>
                                <th class="text-center">Loại Sản Phẩm</th>
                                <th class="text-center">Mô Tả</th>
                                <th class="text-center">Giá Gốc</th>
                                <th class="text-center">Giá Khuyến Mãi</th>
                                <th class="text-center">Sửa</th>
                                <th class="text-center">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($tintuc as $chitiet)
                            <tr class="odd gradeX" align="center">
                                <td>{{ $chitiet->id }}</td>
                                <td>
                                    <img width="100px" src="source/image/product/{{ $chitiet->image }}">
                                </td>
                                <td>{{ $chitiet->name }}</td>
                                <td>{{ $chitiet->product_type->name }}</td>
                                <td>{{ $chitiet->description }}</td>
                                <td>{{ $chitiet->unit_price }}</td>
                                <td>{{ $chitiet->promotion_price }}</td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/sanpham/sua/{{ $chitiet->id }}">Sửa</a></td>
                                <td class="center">

                                       
                                        <i class="fa fa-trash-o fa-fw"></i> <a href="admin/sanpham/xoa/{{ $chitiet->id }}">Xóa</a>
                                        <!--<input type="hidden" class="hiddenID" value="{{ $chitiet->id }}">

                                        <a href="#" class="btnDel" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#myModal{{$chitiet->id}}">Xóa</a>
                                        
                                        <div style="text-align: left;" id="myModal{{$chitiet->id}}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Xác Nhận</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        
                                                        <p>Bạn có chắc chắn muốn xóa Sản Phẩm: "{{$chitiet->name}}" không?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default btnConf">Có</button>
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
                                                    </div>
                                                </div>

                                            </div> -->
                                        </div>
                                    </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection