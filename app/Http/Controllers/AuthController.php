<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\client;
use App\Models\address;
use App\Models\ville;
use App\Http\Controllers\save;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends BaseController
{
    //
    // app/Http/Controllers/AuthController.php
    public function __construct()
    {
        $this->middleware('auth.apikey');
    }

    public function register(Request $request)
    {
        $validator =  Validator::make($request->all(), [
            // 'name' => 'required',
            // 'BirthDate' => 'required|date',
            // 'Phone' => 'required|unique:client',
            // 'email' => 'required|email|unique:users',
            // 'password' => 'required|min:8',
            // 'address' => 'required',
            // 'city' => 'required',
        ]);
        if (!$validator->fails()) {
            $user = new User([
                'name' => $request['name'],
                'email' => $request['email'],
                'password' => Hash::make($request['password']),
            ]);

            $client = new client([
                'FirstName' =>  explode(' ', $request['name'])[0],
                'Lastname' => explode(' ', $request['name'])[1],
                'BirthDate' => $request['BirthDate'],
                'email' => $request['email'],
                'Phone' => $request['Phone'],
            ]);

            $address = new address([
                'Address' => $request['address'],
                'City' => ville::where('CityName', $request['city'])->firstOrFail()->ID_city,
                'IsDefault' => true,
            ]);
            $user->save();
            $client->id_user = $user->id;
            $client->save();
            $address->Client = $client->id;
            $address->save();
            $token = $user->createToken('auth_token')->plainTextToken;
            return  $this->sendResponse(explode('|', $token), "valid email");
        } else {
            return $this->sendError('error');
        }
    }
    public function login(Request $request)
    {
        if (!Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);
        } else {
            $user = User::where('email', $request['email'])->firstOrFail();
            $user->tokens->each->delete();
            $token = $user->createToken('auth_token')->plainTextToken;
            return $this->sendResponse(explode('|', $token)[1], 'User signed in');
        }
    }
    public function check(Request $request)
    {
        return User::where('email', $request['email'])->first() ? $this->sendError("not a valid email") : $this->sendResponse(true, "valid email");
    }
    public function villes()
    {
        return $this->sendResponse(ville::select('CityName')->get(), "Villes");
    }
}
