<?php

namespace App\Modles;

use Illuminate\Database\Eloquent\Model;

class StaffNumberTurn extends Model
{
    protected $table = 'staff_number_turn';

    protected $fillable = [
        'staff_number_turn_id', 'staff_id', 'date', 'number_turn'
    ];

    public $timestamps = true;
}
