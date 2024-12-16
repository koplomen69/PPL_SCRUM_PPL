<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\Product;
use App\Models\tblCart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class FavoriteController extends Controller
{
    public function index()
    {
        // Fetch the list of favorites for the authenticated user (assuming you use auth)
        $favorites = Favorite::where('user_id', auth()->id())->get();
        $favoritesCount = $favorites->count();

        // Return the favorites view with the data
        return view('pelanggan.page.favorites', compact('favorites', 'favoritesCount'));
    }

    /**
     * Move a favorite item to the cart
     */
    public function moveToTransaction($id)
    {
        // Retrieve the favorite item based on its ID
        $favorite = Favorite::findOrFail($id);
        $product = $favorite->product; // Assuming the favorite has a product relation

        // Prepare data to add to the cart
        $cartData = [
            'idUser'    => 'guest123',  // Adjust with logged-in user or session ID
            'id_barang' => $favorite->product_id,
            'qty'       => 1,            // Default quantity
            'price'     => $product->harga,
        ];

        // Check if the product is already in the cart, if not add it
        $existingCartItem = tblCart::where([
            'idUser'    => 'guest123',  // Adjust accordingly
            'id_barang' => $favorite->product_id,
            'status'    => 0,           // Assuming 0 means active status
        ])->first();

        if (!$existingCartItem) {
            tblCart::create($cartData); // Add item to the cart
        } else {
            // Optionally, update the quantity or handle as necessary
            $existingCartItem->update([
                'qty' => $existingCartItem->qty + 1, // Increment the quantity
            ]);
        }

        // Remove the item from favorites after moving to cart
        $favorite->delete();

        // Return with success message
        return redirect()->route('favorites.index')->with('success', 'Item moved to cart successfully.');
    }

    /**
     * Add product to favorites
     */
    public function storePelanggan($productId)
    {
        // Check if the user is logged in
        if (!auth()->check()) {
            return redirect()->route('login')->with('error', 'You need to log in first.');
        }

        // Retrieve the product by its ID
        $product = Product::findOrFail($productId);

        // Check if the product is already in the user's favorites
        if (auth()->user()->favorites()->where('product_id', $product->id)->exists()) {
            return back()->with('error', 'This product is already in your favorites.');
        }

        // Create a new favorite
        $favorite = new Favorite();
        $favorite->user_id = auth()->id(); // Assuming a `user_id` column exists in `favorites`
        $favorite->product_id = $product->id; // Set the `product_id`
        $favorite->save();

        // Return back with a success message
        return back()->with('success', 'Product added to favorites!');
    }

    /**
     * Remove a product from the favorites
     */
    public function destroy($id)
    {
        $favorite = Favorite::findOrFail($id);
        $favorite->delete();
        return redirect()->route('favorites.index')->with('success', 'Item removed from favorites!');
    }
}
