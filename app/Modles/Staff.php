<?php

namespace App\Modles;

use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    protected $table = 'staffs';

//    protected $fillable = [
//        'id', 'tab', 'title', 'description', 'title2', 'link', 'image', 'created_at', 'updated_at'
//    ];

    public $timestamps = false;
}
