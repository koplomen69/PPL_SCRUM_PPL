<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;
use App\Models\transaksi;

class HistoryController extends Controller
{
    // public function __construct()
    // {
    //     // Membatasi akses hanya untuk pelanggan
    //     $this->middleware('is.pelanggan');
    // }

    // Menampilkan halaman history transaksi
    public function history()
    {
        // Ambil data transaksi berdasarkan user yang sedang login
        $transactions = transaksi::where('id', auth()->id())
            ->with('product') // Memuat relasi dengan tabel produk
            ->orderBy('created_at', 'desc') // Urutkan berdasarkan tanggal terbaru
            ->get();

        // Kirim data ke view pelanggan.history
        return view('pelanggan.page.history', compact('transactions'));
    }

    // Menambahkan item ke history (contoh untuk keseragaman struktur)
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|integer',
            'qty' => 'required|integer|min:1',
        ]);

        // Tambahkan transaksi baru (contoh sederhana)
        transaksi::create([
            'user_id' => auth()->id(),
            'product_id' => $request->product_id,
            'qty' => $request->qty,
            'total' => $request->qty * $request->product_price, // Harga dihitung
        ]);

        // Redirect ke halaman history dengan pesan sukses
        return redirect()->route('history')->with('success', 'Transaksi berhasil ditambahkan!');
    }

    // Menghapus transaksi dari history
    public function destroy(transaksi $transaksi)
    {
        $transaksi->delete();

        // Redirect ke halaman history dengan pesan sukses
        return redirect()->route('history')->with('success', 'Transaksi berhasil dihapus!');
    }
}
