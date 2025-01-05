@extends('pelanggan.layout.index')

@section('content')
<div class="container">
    <h1 class="text-center">{{ $title }}</h1>
    <div class="table-responsive mt-4">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Kode Transaksi</th>
                    <th>Nama Customer</th>
                    <th>Total Harga</th>
                    <th>Status</th>
                    <th>Tanggal</th>
                </tr>
            </thead>
            <tbody>
                @forelse($data as $key => $transaksi)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $transaksi->code_transaksi }}</td>
                        <td>{{ $transaksi->nama_customer }}</td>
                        <td>Rp {{ number_format($transaksi->total_harga, 0, ',', '.') }}</td>
                        <td>
                            <span class="badge bg-success">Berhasil</span>
                        </td>
                        <td>{{ $transaksi->created_at->format('d-m-Y H:i') }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6" class="text-center">Tidak ada transaksi berhasil.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
