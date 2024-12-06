<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    // public function __construct()
    // {
    //     // Membatasi akses hanya untuk pelanggan
    //     $this->middleware('is.pelanggan');
    // }
    // Menampilkan halaman favorit
    public function index()
    {
        $favorites = auth()->user()->favorites; // Ambil favorit berdasarkan user yang sedang login
        return view('favorites.index', compact('favorites'));
    }



    // Menambahkan item ke favorit
    public function store(Request $request)
{
    $request->validate([
        'item_name' => 'required|string|max:255',
    ]);

    // Menambahkan item favorit baru
    Favorite::create([
        'item_name' => $request->item_name,
    ]);

    // Redirect kembali ke halaman favorit dengan pesan sukses
    return redirect()->route('favorites.index')->with('success', 'Item added to favorites!');
}


    // Menghapus item favorit
    public function destroy(Favorite $favorite)
{
    $favorite->delete();

    // Redirect kembali ke halaman favorit dengan pesan sukses
    return redirect()->route('favorites.index')->with('success', 'Item removed from favorites!');
}

}
