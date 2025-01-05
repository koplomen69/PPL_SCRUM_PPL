<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Http\Controllers\TransaksiController;

class Transaction extends Model
{
    use HasFactory;

    // Specify the table name if it doesn't follow Laravel's naming convention
    protected $table = 'transactions';

    // Mass assignable attributes
    protected $fillable = [
        'product_id',
        'user_id',
        'qty',
        'harga',
    ];

    /**
     * Define the relationship with the Product model
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    /**
     * Define the relationship with the User model (optional, if needed)
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
