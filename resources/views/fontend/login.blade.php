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
    <section class="box-login">
        <div class="container text-center">
            <div class="logo"><a href=""><img src="{{ url('images/logo-light.png') }}" class="img-fluid" alt=""></a></div>
            <div class="bn-birthday"><img src="{{ url('images/birthday.png') }}" class="img-fluid" alt=""></div>
            <div class="slogan"></div>
            <div class="login">
                    <input type="text" placeholder="" class="inp_login" maxlength="6" required placeholder="Vui lòng nhập mã nhân sự">
                    <input type="submit" value="ĐĂNG NHẬP" class="btn_login">
            </div>
            <div class="seven"><img src="{{ url('images/seven.png') }}" class="img-fluid" alt=""></div>
        </div> 
    </section>
</main>  
<!--Link js-->
<script type="text/javascript" src="{{ url('js/bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ url('js/private.js') }}"></script>

<script>
    $('.btn_login').click(function () {
        var staff_if = $('.inp_login').val();
        if(staff_if != '') {
            window.location.href = '/?staff_id=' + staff_if;
        }
    });
    @if (\Session::has('success'))
    swal('Thông báo', "{!! \Session::get('success') !!}", 'success');
    @endif
    @if (\Session::has('error'))
    swal('Thông báo', "{!! \Session::get('error') !!}", 'error');
    @endif


    $(function(){
       $(".inp_login").keypress(function (e) {
         if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
          $("#errmsg").html("Number Only").stop().show().fadeOut("slow");
          return false;
        }
       });
    });
</script>
</body>
</html>
  