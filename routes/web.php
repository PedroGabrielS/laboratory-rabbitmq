<?php


use App\Models\User;
use Illuminate\Support\Facades\Route;

use App\Jobs\SendWelcomeEmail;
use App\Mail\WelcomeEmail;
use Illuminate\Support\Facades\Mail;

Route::get('/send-welcome-email', function () {
    App\Models\User::where('name', 'Usuário Teste')->delete();
    $user = User::create([
        'name' => 'Usuário Teste',
        'email' => 'pedrog_silva@outlook.commmmm',
        'password' => bcrypt('senha123'),
    ]);

    //Mail::to($user->email)->send(new WelcomeEmail($this->user));
    dispatch(new SendWelcomeEmail($user));
    

    return response()->json(['message' => 'E-mail de boas-vindas colocado na fila']);
});
