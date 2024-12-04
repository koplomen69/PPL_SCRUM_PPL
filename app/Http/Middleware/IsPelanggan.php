<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsPelanggan
{
    public function handle(Request $request, Closure $next)
    {
        // Your logic to check if the user is a "pelanggan" (customer)
        // For example:
        if (!$request->user() || !$request->user()->is_pelanggan) {
            return redirect('somewhere');
        }

        return $next($request);
    }
}
