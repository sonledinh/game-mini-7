<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Modles\Contact;
use App\Modles\EmailSubcribe;
use App\Modles\Post;
use Illuminate\Http\Request;
use Auth, Validator;
class AppController extends Controller
{
    public function index() {
        return view('admin.pages.index');
    }
    public function listEmailSubcribe() {
        $list = EmailSubcribe::get();
        return view('admin.pages.listEmailSubcribe', compact('list'));
    }
    public function listContact() {
        $list = Contact::get();
        return view('admin.pages.listContact', compact('list'));
    }
    public function listPost() {
        $list = Post::get();
        return view('admin.pages.listPost', compact('list'));
    }
    public function addPost() {
        $list = Post::get();
        return view('admin.pages.addPost', compact('list'));
    }
    public function createPost(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'description' => 'required',
            'image' => 'required|mimes:jpeg,bmp,png,gif,svg',
            'date' => 'required',
            'cate' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->responseError($validator->errors()->first());
        }
        $date = explode(' - ', $request->date);
        if (count($date) < 2) {
            return $this->responseError('Date invalid');
        }

        if (strtotime($date[0]) > strtotime($date[1])) {
            return $this->responseError('Date start must be less than date end');
        }

        $image = $request->file('image');
        $name = time().'-'.$request->image->getClientOriginalName();
        $destinationPath = public_path('upload/images');
        $image->move($destinationPath, $name);

//        $image = $request->image->getClientOriginalName();
        $data_insert = [
            'title' => $request->title,
            'description' => $request->description,
            'cate' => $request->cate,
            'image' => '/upload/images/'.$name,
            'date_start' => date('Y-m-d H:i:s', strtotime($date[0])),
            'date_end' => date('Y-m-d H:i:s', strtotime($date[1])),
        ];

        $create = Post::create($data_insert);
        if ($create) {
            return redirect()->route('admins.listPost')->with('success', 'Create post success');
        }
        return redirect()->route('admins.listPost')->with('error', 'Create post fail');

    }
    public function editPost(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->route('admins.listPost')->with('error', $validator->errors()->first());
        }

        $post = Post::where('id', $request->id)->first();
        if (!$post) {
            return redirect()->route('admins.listPost')->with('error', 'Post not found');
        }
        return view('admin.pages.editPost', compact('post'));
    }
    public function saveEditPost(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'title' => 'required',
            'description' => 'required',
            'date' => 'required',
            'cate' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->responseError($validator->errors()->first());
        }
        $date = explode(' - ', $request->date);
        if (count($date) < 2) {
            return $this->responseError('Date invalid');
        }

        if (strtotime($date[0]) > strtotime($date[1])) {
            return $this->responseError('Date start must be less than date end');
        }

//        $image = $request->image->getClientOriginalName();
        $data_insert = [
            'title' => $request->title,
            'description' => $request->description,
            'cate' => $request->cate,
            'date_start' => date('Y-m-d H:i:s', strtotime($date[0])),
            'date_end' => date('Y-m-d H:i:s', strtotime($date[1])),
        ];

        if (!empty($request->image)) {
            $validator = Validator::make($request->all(), [
                'image' => 'required|mimes:jpeg,bmp,png,gif,svg',
            ]);

            if ($validator->fails()) {
                return $this->responseError($validator->errors()->first());
            }

            $image = $request->file('image');
            $name = time().'-'.$request->image->getClientOriginalName();
            $destinationPath = public_path('upload/images');
            $image->move($destinationPath, $name);

            $data_insert['image'] = '/upload/images/'.$name;

        }

        $create = Post::where('id', $request->id)->update($data_insert);
        if ($create) {
            return redirect()->route('admins.listPost')->with('success', 'Update post success');
        }
        return redirect()->route('admins.listPost')->with('error', 'Update post fail');
    }
    public function delPost(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->responseError($validator->errors()->first());
        }
        $create = Post::where('id', $request->id)->delete();
        if ($create) {
            return redirect()->route('admins.listPost')->with('success', 'Delete post success');
        }
        return redirect()->route('admins.listPost')->with('error', 'Delete post fail');
    }
    public function login() {
        if (Auth::check()) {
            return redirect('admins');
        } else {
            return view('admin.layout.login');
        }
    }
    public function loginPost(LoginRequest  $request) {
        $login = [
            'email' => $request->txtEmail,
            'password' => $request->txtPassword,
            'level' => 1,
            'status' => 1
        ];
        if (Auth::attempt($login)) {
            return redirect('admins');
        } else {
            return redirect()->back()->with('status', 'Email hoặc Password không chính xác');
        }
    }

    public function logout() {
        Auth::logout();
        return redirect()->route('admins.index');
    }
}
