<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['prefix' => 'admins'], function () {
    Route::post('/login', 'Admin\AppController@loginPost')->name('admins.login.post');
    Route::get('/login', 'Admin\AppController@login')->name('admins.login');
    Route::get('/logout', 'Admin\AppController@logout')->name('admins.logout');
});

Route::group(['middleware' => 'checkAdminLogin', 'prefix' => 'admins'], function() {
    Route::get('/', 'Admin\AppController@index')->name('admins.index');
    Route::group(['prefix' => 'lucky'], function () {
        Route::get('/list', 'Admin\LuckyController@list')->name('admins.lucky.list');
        Route::get('/add', 'Admin\LuckyController@add')->name('admin.lucky.add');
        Route::post('/store', 'Admin\LuckyController@create')->name('admin.lucky.create');
        Route::get('/delete/{id}', 'Admin\LuckyController@del')->name('admin.lucky.delete');
    });
});
Route::get('/', 'Fontend\HomeController@index')->name('fontend.home');
Route::get('/login', 'Fontend\HomeController@login')->name('fontend.login');
