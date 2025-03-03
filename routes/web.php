<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;

Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');

Route::resource('tasks', TaskController::class)->middleware('auth');

Route::post('tasks/{task}/archive', [TaskController::class, 'archive'])->name('tasks.archive')->middleware('auth');
Route::post('tasks/{task}/restore', [TaskController::class, 'restore'])->name('tasks.restore')->middleware('auth');
Route::delete('tasks/{task}', [TaskController::class, 'destroy'])->name('tasks.destroy')->middleware('auth');
Route::get('/tasks-dashboard', [TaskController::class, 'dashboard'])->name('tasks.dashboard')->middleware('auth');

require __DIR__.'/auth.php';

