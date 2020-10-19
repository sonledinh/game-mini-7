<?php

namespace App\Modles;

use Illuminate\Database\Eloquent\Model;

class LogStaffTurn extends Model
{
    protected $table = 'log_staff_turn';

    protected $fillable = [
        'log_staff_turn_id', 'staff_id', 'lucky_type', 'message'
    ];

    public $timestamps = true;
}
