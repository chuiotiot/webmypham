<?php

namespace App\Http\Controllers;
use App\Bill;
use Illuminate\Http\Request;

class BillController extends Controller
{
    //
	public function getDanhSach(){
    	$hoadon = Bill::all();
    	return view('admin.hoadon.danhsach',['hoadon'=>$hoadon]);
    }
}
