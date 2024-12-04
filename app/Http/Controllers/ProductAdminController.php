<?php

namespace App\Http\Controllers;

use App\Models\product;
use Illuminate\Http\Request;

class ProductAdminController extends Controller
{
    public function index()
    {
        // Misalkan kita mengambil produk dari database
        $products = Product::all(); // Atau bisa menggunakan query lainnya sesuai kebutuhan
    
        return view('pelanggan.index', compact('products')); // Mengirimkan data ke view
    }
    
}
