<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    // Halaman Login (GET)
    public function login()
    {
        return view('auth.login');
    }

    // Proses Login (POST)
    public function auth(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (Auth::attempt($credentials)) {
            return redirect()->intended('/home');
        }

        return back()->withErrors(['email' => 'Email atau password salah!']);
    }

    // Halaman Registrasi (GET)
    public function registration()
    {
        return view('auth.registration');
    }

    // Proses Registrasi (POST)
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        return redirect('/registration')->with('success', 'Registrasi berhasil!');
    }

    // Halaman Home (GET)
    public function home()
    {
        if (!Auth::check()) {
            return redirect('/login');
        }
        return view('home', ['user' => Auth::user()]);
    }

    // Logout (GET)
    public function logout()
    {
        Auth::logout();
        return redirect('/login');
    }
}