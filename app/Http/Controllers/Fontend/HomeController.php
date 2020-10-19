<?php

namespace App\Http\Controllers\Fontend;

use App\Http\Controllers\Controller;
use App\Modles\LogStaffTurn;
use App\Modles\Lucky;
use App\Modles\Staff;
use App\Modles\StaffNumberTurn;
use App\User;
use Illuminate\Http\Request;
use Auth,Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    public function index(Request $request) {
//                $user = new User();
//        $user->password = Hash::make('content_marketing123456');
//        $user->email = 'content_marketing@admicro.vn';
//        $user->name = 'GG'; 
//        $user->save();

        if(empty($request->staff_id)) {
            return redirect()->route('fontend.login');
        }

        $check_staff = Staff::where(['staff_id' => $request->staff_id, 'ngay_nghi_viec' => ''])->first();
        if (!$check_staff) {
            return redirect()->route('fontend.login')->with('error', 'Không tìm thấy nhân viên');
        }

        $number_turn = StaffNumberTurn::where(['staff_id' => $check_staff->staff_id, 'date' => date('Y-m-d')])->first();

        if (!$number_turn) {
            $number_turn = StaffNumberTurn::create([
                'staff_id' => $check_staff->staff_id,
                'date' => date('Y-m-d'),
                'number_turn' => 5
            ]);
        }

        $list_log = LogStaffTurn::orderBy('log_staff_turn_id', 'DESC')->limit(25)->get();
        return view('fontend.home', compact('number_turn', 'list_log'));
    }
    public function login() {
        return view('fontend.login');
    }
    public function spin(Request $request) {
        $validator = Validator::make($request->all(), [
            'staff_id' => 'required|numeric'
        ]);
        if($validator->fails()) {
            return response()->json([
                'status' => 'false',
                'message' => 'Truyền thiếu param'
            ]);
        }


        $check_staff = Staff::where(['staff_id' => $request->staff_id, 'ngay_nghi_viec' => ''])->first();
        if (!$check_staff) {
            return response()->json([
                'status' => false,
                'message' => 'Không tìm thấy nhân viên'
            ]);
        }
        $number_turn = StaffNumberTurn::where(['staff_id' => $check_staff->staff_id, 'date' => date('Y-m-d')])->where('number_turn', '>', '0')->first();
        if (!$number_turn) {
            return response()->json([
                'status' => false,
                'message' => ''
            ]);
        }

        //lấy số lượng lần đã trúng
        $lucky_count = Lucky::select('lucky_type', DB::raw('count(lucky_id) as count_lucky_id'))->groupBy('lucky_type')->get();
        $arr_lucky_type_count = [];
        if ($lucky_count) {
            foreach ($lucky_count as $k => $v) {
                $arr_lucky_type_count[$v->lucky_type] = $v->count_lucky_id;
            }
        }
        $this->_getPick($arr_lucky_type_count, $check_staff, $lucky_type, $mess, $pick1, $pick2, $pick3, $mess_f);
        LogStaffTurn::create([
            'staff_id' => $check_staff->staff_id,
            'lucky_type' => $lucky_type,
            'message' => $mess,
            'mess_f' => $mess_f,
        ]);

        if ($lucky_type > 0 && $lucky_type != 6) {
            Lucky::create([
                'staff_id' => $check_staff->id, 
                'lucky_type' => $lucky_type,
            ]);
        }

        StaffNumberTurn::where(['staff_number_turn_id' => $number_turn->staff_number_turn_id])->update([
            'number_turn' => DB::raw('number_turn-1')
        ]);

        return response()->json([
            'status' => $lucky_type == 6 ? false : true ,
            'message' => $mess,
            'pick1' => $pick1,
            'pick2' => $pick2,
            'pick3' => $pick3,
            'mess_f' => $mess_f,
        ]);
    }

    protected function _checkPick1($c , $p) {
        if (in_array($p + 1, $c)) {
            return true;
        } 
        return false;
    }

    protected function _getPick($arr_lucky_type_count, $check_staff, &$lucky_type, &$mess, &$pick1, &$pick2, &$pick3, &$mess_f) {
        for ($i = 0; $i < 10; $i++) {
            // $club     = [[1, 7, 10, 13, 16, 19, 20], [4, 7, 10, 13, 20], [7, 10, 16, 20]];

            // $star     = [[2, 5, 11, 14, 17],[2, 8, 11, 14, 16, 19],[1, 8, 11, 14, 17]];

            // $spade    = [[3, 6, 9, 12, 15, 18],[3, 6, 18],[3, 6, 9, 18]];

            // $heart    = [[4, 8],[1, 5, 9, 12, 15, 17],[2, 4, 5, 12, 13, 15, 19]];


            $club     = [[16, 20], [6, 11, 17, 20], [2, 14, 20]];

            $star     = [[3, 7, 11, 17], [2, 5, 8, 15], [6, 10, 13, 19]];

            $spade    = [[4, 8, 13, 18], [1, 9, 14, 19], [4, 5, 15, 17]];

            $heart    = [[2, 6, 9, 14], [4, 10, 13], [1, 8, 9, 12, 16]]; 

            $voucher    = [[1, 5, 10, 12, 15, 19], [3, 7, 12, 16, 18], [3, 7, 11, 18]]; 
 
            $pick1 = rand(0,19); 
            $pick2 = rand(0,19);
            $pick3 = rand(0,19); 
 

            if ($this->_checkPick1($club[0], $pick1)) {
                $pick1_f = 1;
            }
            elseif ($this->_checkPick1($star[0], $pick1)) {
                $pick1_f = 2;
            }
            elseif ($this->_checkPick1($spade[0], $pick1)) {
                $pick1_f = 3;
            }
            elseif ($this->_checkPick1($heart[0], $pick1)) {
                $pick1_f = 4;
            }
            elseif ($this->_checkPick1($voucher[0], $pick1)) {
                $pick1_f = 5;
            }

            if ($this->_checkPick1($club[1], $pick2)) {
                $pick2_f = 1;
            }
            elseif ($this->_checkPick1($star[1], $pick2)) {
                $pick2_f = 2;
            }
            elseif ($this->_checkPick1($spade[1], $pick2)) {
                $pick2_f = 3;
            }
            elseif ($this->_checkPick1($heart[1], $pick2)) {
                $pick2_f = 4;
            }
            elseif ($this->_checkPick1($voucher[1], $pick2)) {
                $pick2_f = 5;
            }

            if ($this->_checkPick1($club[2], $pick3)) {
                $pick3_f = 1;
            }
            elseif ($this->_checkPick1($star[2], $pick3)) {
                $pick3_f = 2;
            }
            elseif ($this->_checkPick1($spade[2], $pick3)) {
                $pick3_f = 3;
            }
            elseif ($this->_checkPick1($heart[2], $pick3)) {
                $pick3_f = 4;
            } 
            elseif ($this->_checkPick1($voucher[2], $pick3)) {
                $pick3_f = 5;
            } 
 
//            $pick1_f = 1;
//            $pick2_f = 1;
//            $pick3_f = 1;
            $lucky_type = 0;
            $mess = '<li>Chúc bạn <span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> may mắn lần sau</span>!!!</li>';
            $mess_f = 'Chúc bạn '.$check_staff->ho_ten.' '.$check_staff->staff_id.' may mắn lần sau';
            if ($pick1_f == 1 && $pick2_f == 1 && $pick3_f == 1) {
                if((!isset($arr_lucky_type_count[1]) || $arr_lucky_type_count[1] < 1)) {
                    $lucky_type = 1;
                    $mess = '<li><span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> vừa trúng <span>1.700,000đ</span>!!!</li>';
                    $mess_f = $check_staff->ho_ten.' '.$check_staff->staff_id.' vừa trúng 1.700.000đ';
                } else {
                    $lucky_type = 6;
                    $mess = "";
                    $mess_f = "Tiếc quá! Giải này đã có chủ :(";
                }
                break;
               
            }
            if ($pick1_f == 2 && $pick2_f == 2 && $pick3_f == 2) {
                if((!isset($arr_lucky_type_count[2]) || $arr_lucky_type_count[2] < 1)) {
                    $lucky_type = 2;
                    $mess = '<li><span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> vừa trúng <span>700,000đ</span>!!!</li>';
                    $mess_f = $check_staff->ho_ten.' '.$check_staff->staff_id.' vừa trúng 700.000đ'; 
                } else {
                    $lucky_type = 6;
                    $mess = "";
                    $mess_f = "Tiếc quá! Giải này đã có chủ :(";
                }
 
                break;
            }
            if ($pick1_f == 3 && $pick2_f == 3 && $pick3_f == 3 && (!isset($arr_lucky_type_count[3]) || $arr_lucky_type_count[3] < 5)) {
                if((!isset($arr_lucky_type_count[3]) || $arr_lucky_type_count[3] < 5)) {
                      $lucky_type = 3;
                    $mess = '<li><span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> vừa trúng <span>170,000đ</span>!!!</li>';
                    $mess_f = $check_staff->ho_ten.' '.$check_staff->staff_id.' vừa trúng 170.000đ';
                } else {
                    $lucky_type = 6;
                    $mess = "";
                    $mess_f = "Tiếc quá! Giải này đã có chủ :(";
                }
              
                break;
            }
            if ($pick1_f == 4 && $pick2_f == 4 && $pick3_f == 4 && (!isset($arr_lucky_type_count[4]) || $arr_lucky_type_count[4] < 5)) {
                if((!isset($arr_lucky_type_count[4]) || $arr_lucky_type_count[4] < 5)) {
                    $lucky_type = 4;
                    $mess = '<li><span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> vừa trúng <span>70,000đ</span>!!!</li>';
                    $mess_f = $check_staff->ho_ten.' '.$check_staff->staff_id.' vừa trúng 70.000đ';
                } else {
                    $lucky_type = 6;
                    $mess = "";
                    $mess_f = "Tiếc quá! Giải này đã có chủ :(";
                }
                
                break;
            }
            if ($pick1_f == 5 && $pick2_f == 5 && $pick3_f == 5 && (!isset($arr_lucky_type_count[5]) || $arr_lucky_type_count[5] < 10)) {
                if((!isset($arr_lucky_type_count[5]) || $arr_lucky_type_count[5] < 10)) {
                    $lucky_type = 5;
                    $mess = '<li><span>'.$check_staff->ho_ten.' '.$check_staff->staff_id.'</span> vừa trúng <span>Voucher</span>!!!</li>';
                    $mess_f = $check_staff->ho_ten.' '.$check_staff->staff_id.' vừa trúng Voucher Content Marketing';
                } else {
                    $lucky_type = 6;
                    $mess = "";
                    $mess_f = "Tiếc quá! Giải này đã có chủ :(";
                }
                break;
            } 
        }
    }
}
