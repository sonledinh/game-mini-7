<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function responseSuccess($mes = '', $data = []) {
        return response()->json([
            'status' => true,
            'message' => $mes,
            'data' => $data
        ]);
    }
    public function responseError($mes = '', $data = []) {
        return response()->json([
            'status' => false,
            'message' => $mes,
            'data' => $data
        ]);
    }
}
