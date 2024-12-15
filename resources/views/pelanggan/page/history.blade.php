@extends('pelanggan.layout.index')

@section('content')
    <h3 class="mt-5 mb-5">History Transaksi</h3>

    @if ($transactions->isEmpty())
        <div class="alert alert-info">
            <p>Belum ada transaksi yang dilakukan.</p>
        </div>
    @else
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Produk</th>
                    <th>Harga</th>
                    <th>Jumlah</th>
                    <th>Total</th>
                    <th>Tanggal Transaksi</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($transactions as $key => $transaction)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $transaction->product->nama_product }}</td>
                        <td>Rp {{ number_format($transaction->product->harga, 0, ',', '.') }}</td>
                        <td>{{ $transaction->qty }}</td>
                        <td>Rp {{ number_format($transaction->total, 0, ',', '.') }}</td>
                        <td>{{ $transaction->created_at->format('d M Y, H:i') }}</td>
                        <td>
                            <form action="{{ route('history.destroy', $transaction->id) }}" method="POST" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif

    <form action="{{ route('history.store') }}" method="POST" class="mt-4">
        @csrf
        <div class="mb-3">
            <label for="product_id" class="form-label">ID Produk</label>
            <input type="number" class="form-control" id="product_id" name="product_id" required>
        </div>
        <div class="mb-3">
            <label for="qty" class="form-label">Jumlah</label>
            <input type="number" class="form-control" id="qty" name="qty" min="1" required>
        </div>
        <button type="submit" class="btn btn-primary">Tambah Transaksi</button>
    </form>
@endsection
