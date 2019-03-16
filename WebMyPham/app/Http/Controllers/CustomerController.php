<?php

namespace App\Http\Controllers;
use App\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    //
    public function getDanhSach(){
    	$cus = Customer::all();
    	return view('admin.customer.danhsach',['cus'=>$cus]);
    }
    public function index(){
    	
    	return view('admin.layout.index');
    }
    

}
