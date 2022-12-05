<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class client extends Model
{
    use HasFactory;
    protected $table = 'client';
    protected $fillable = [
        'FirstName',
        'Lastname',
        'BirthDate',
        'email',
        'Phone',
        'id_user',
    ];
}
