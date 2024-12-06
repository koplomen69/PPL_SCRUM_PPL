@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Your Favorite Items</h1>

    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('favorites.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="item_name" class="form-label">Add Item</label>
            <input type="text" name="item_name" class="form-control" id="item_name" required>
        </div>
        <button type="submit" class="btn btn-primary">Add to Favorites</button>
    </form>

    @if($favorites->isNotEmpty())
        <ul class="list-group mt-4">
            @foreach ($favorites as $favorite)
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    {{ $favorite->name }}
                    <form action="{{ route('favorites.destroy', $favorite) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-danger btn-sm">Remove</button>
                    </form>
                </li>
            @endforeach
        </ul>
    @else
        <p>No favorite items found.</p>
    @endif
</div>
@endsection
