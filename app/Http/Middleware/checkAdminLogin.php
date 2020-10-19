<?php

namespace App\Http\Middleware;

use App\User;
use Closure;
use Auth;
use Illuminate\Support\Facades\Hash;
use phpDocumentor\Reflection\DocBlock\Tags\Uses;

class checkAdminLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
//        $user = new User();
//        $user->password = Hash::make('bestay');
//        $user->email = 'bestay@mail.com';
//        $user->name = 'Bestay';
//        $user->save();
        // nếu user đã đăng nhập
        if (Auth::check())
        {
            $user = Auth::user();
            // nếu level =1 (admin), status = 1 (actived) thì cho qua.
            if ($user->level == 1 && $user->status == 1 )
            {
                return $next($request);
            }
            else
            {
                Auth::logout();
                return redirect()->route('admins.login');
            }
        } else
            return redirect('admins/login');

    }
}
