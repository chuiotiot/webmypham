<?php

namespace App\Http\Controllers;
use App\BillDetail;
use Illuminate\Http\Request;

class BillDetailController extends Controller
{
    //
    public function getDanhSach(){
    	$cthoadon = BillDetail::all();
    	return view('admin.chitiethoadon.danhsach',['cthoadon'=>$cthoadon]);
    }
}
