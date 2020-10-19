<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Content Marketing</title>
    <!--link css-->
    <link rel="stylesheet" type="text/css" title="" href="{{ url('css/bootstrap.min.css') }}">
    <link rel="stylesheet" type="text/css" title="" href="{{ url('css/style.css') }}">

    <script type="text/javascript" src="{{ url('js/jquery.min.js') }}"></script>
    <script src="{{ url('js/sweetalert.js') }}"></script>
    <link rel="stylesheet" type="text/css" href="{{ url('css/sweetalert.css') }}">
</head>
<body>
<main>


    <section id="content-pin"> 
        <div class="bg-pin"></div>
        <div class="bn-line"><img src="{{ url('images/bn-line.png') }}" class="img-fluid w-100" alt=""></div>
        <div class="img-sun text-center"><img src="{{ url('images/sun.png') }}" class="img-fluid" alt=""></div>
        <div class="container text-center">
            <div class="btn-popup">
                <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal"><img src="{{ url('images/btn-popup.png') }}" class="img-fluid" alt=""></a>
            </div>
            <div class="logo"><a href="javascript:void(0)"><img src="{{ url('images/logo-light.png') }}" class="img-fluid" alt=""></a></div>
            <div class="bn-birthday"><img src="{{ url('images/bd.png') }}" class="img-fluid" alt=""></div>
            <div class="number-spin text-uppercase">Bạn còn <span id="bank"></span> lượt quay hôm nay</div>
            <div class="row clearfix">
                <div class="icon-icon a-abs-1"><img src="{{ url('images/icon-4.png') }}" class="img-fluid" alt=""></div>
                <div class="icon-icon a-abs-2"><img src="{{ url('images/icon1-1.png') }}" class="img-fluid" alt=""></div>
                <div id="reel-wrap">
                    <div class="img-abs"><img src="{{ url('images/bn-slot.png') }}" class="img-fluid" alt=""></div>
                    <div id="reel-col-1" class="reel-col"> 
                        <div id="reel-1-0" class="reel-container"> 
                            <div id="frame-1-1" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-2" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-3" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-4" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-5" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-6" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div> 
                            <div id="frame-1-7" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-8" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-9" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-10" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-11" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-12" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-13" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-14" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-15" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-16" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-17" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-18" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-19" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-1-20" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                        </div>
                    </div>
                    <div id="reel-col-2" class="reel-col">
                        <div id="reel-2-0" class="reel-container">
                            <div id="frame-2-1" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-2" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-3" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-4" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-5" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div> 
                            <div id="frame-2-6" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-7" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-8" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-9" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-10" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-11" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-12" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-13" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-14" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-15" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-16" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-17" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-18" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-19" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-2-20" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                        </div>
                    </div>
                    <div id="reel-col-3" class="reel-col">
                        <div id="reel-3-0" class="reel-container">
                            <div id="frame-3-1" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-2" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-3" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-4" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-5" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-6" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-7" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-8" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-9" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-10" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-11" class="slot-frame text-center"><img src="{{ url('images/spin-5.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-12" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-13" class="slot-frame text-center"><img src="{{ url('images/spin-2.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-14" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-15" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-16" class="slot-frame text-center"><img src="{{ url('images/spin-4.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-17" class="slot-frame text-center"><img src="{{ url('images/spin-3.png') }}" class="img-fluid" alt=""></div>
                            <div id="frame-3-18" class="slot-frame text-center"><img src="{{ url('images/spin-5.png')}}" class="img-fluid" alt=""></div>
                            <div id="frame-3-19" class="slot-frame text-center"><img src="{{ url('images/spin-2.png')}}" class="img-fluid" alt=""></div>
                            <div id="frame-3-20" class="slot-frame text-center"><img src="{{ url('images/spin-1.png') }}" class="img-fluid" alt=""></div>
                        </div>
                    </div>
                </div>
                <span id="score-float" style="bottom: 10%">+&sect;100</span>
            </div>
            <div class="btn-machine text-center">
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="javascript:void(0)" id="spin">Quay ngay</a></li>
                    <!-- <li class="list-inline-item"><button type="submit">Lưu kết quả</button></li>  -->
                </ul>
            </div>
            <div class="prize text-uppercase">
                <div class="list-prize">
                    <ul>
                        @foreach($list_log as $k => $v)
                            {!! $v -> message !!}
                        @endforeach
                    </ul>
                </div> 
            </div>
        </div>
        <div class="modal fade modal-prize" id="myModal">
            <div class="btn-close">
                <div class="inf-close">
                    <button type="button" class="close" data-dismiss="modal"><img src="{{ url('images/btn-popup.png') }}" class="img-fluid" alt=""></button>
                </div>
            </div>
            <div class="modal-dialog">
                <div class="modal-content" style="background: transparent;">
                    <div class="modal-body">
                        <div class="content-popup text-center">
                            <img src="{{ url('images/popup.png') }}" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!--Link js-->
<script>
    @if (\Session::has('success'))
    swal('Alert', "{!! \Session::get('success') !!}", 'success');
    @endif
    @if (\Session::has('error'))
    swal('Alert', "{!! \Session::get('error') !!}", 'error');
        @endif
    var sScore    = {{$number_turn->number_turn}}00;
    var score    = {{$number_turn->number_turn}}00;
    var staff_id    = {{request()->staff_id}};

    $('#spin').click(function(event) {
        $(this).addClass('active');
        setTimeout(function(){
            $('#spin').removeClass('active');
        }, 2000);
    });
</script>
<script type="text/javascript" src="{{ url('js/bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ url('js/private.js') }}"></script>
</body>
</html>
