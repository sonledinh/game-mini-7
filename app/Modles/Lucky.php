<?php

namespace App\Modles;

use Illuminate\Database\Eloquent\Model;

class Lucky extends Model
{
    protected $table = 'luckys';

    protected $fillable = [
        'lucky_id', 'staff_id', 'lucky_type', 'created_at', 'updated_at'
    ];

    public $timestamps = true;

    public function getStaff() {
        return $this->hasOne(Staff::class, 'id', 'staff_id');
    }
}
