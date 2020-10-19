<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Modles\Contact;
use App\Modles\EmailSubcribe;
use App\Modles\Lucky;
use App\Modles\Menu;
use App\Modles\Post;
use Illuminate\Http\Request;
use Auth, Validator;
class LuckyController extends Controller
{
    public function list() {
        $list = Lucky::with('getStaff')->get();
       // dd($list->toArray());
        return view('admin.pages.lucky.list', compact('list'));
    }

    public function add() {
        // $list = Menu::get();

        return view('admin.pages.lucky.add');
    }

    public function create(Request $request) {
        $validator = Validator::make($request->all(), [
            'staff_id' => 'required',
            'lucky_type' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->responseError($validator->errors()->first());
        }


        $create = Lucky::create($request->all());
        if ($create) {
            return redirect()->route('admins.lucky.list')->with('success', 'Create post success');
        }
        return redirect()->route('admins.lucky.list')->with('error', 'Create post fail');

    }

    public function edit(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->route('admins.menu.list')->with('error', $validator->errors()->first());
        }

        $post = Menu::where('id', $request->id)->first();
        if (!$post) {
            return redirect()->route('admins.menu.list')->with('error', 'Post not found');
        }
        return view('admin.pages.menu.edit', compact('post'));
    }

    public function saveEdit(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
            'link' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->route('admins.menu.list')->with('error', $validator->errors()->first());
        }
        $data_insert = [
            'name' => $request->name,
            'link' => $request->link,
        ];

        $create = Menu::where('id', $request->id)->update($data_insert);
        if ($create) {
            return redirect()->route('admins.menu.list')->with('success', 'Update success');
        }
        return redirect()->route('admins.menu.list')->with('error', 'Update fail');
    }
    
    public function del($id) {
        // $validator = Validator::make($request->all(), [
        //     'id' => 'required',
        // ]);

        // if ($validator->fails()) {
        //     return $this->responseError($validator->errors()->first());
        // }
        $create = Lucky::where('lucky_id', $id)->delete();
        if ($create) {
            return redirect()->route('admins.lucky.list')->with('success', 'Delete success');
        }
        return redirect()->route('admins.lucky.list')->with('error', 'Delete fail');
    }
}
