@extends('admin.layout.home');
@section('content')
<div class="row">
    <div class="col-md-8 offset-2">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Edit Menu</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="{{route('admins.menu.saveEdit')}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$post->id}}">
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" class="form-control" name="name" value="{{$post->name}}" id="exampleInputEmail1" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Link</label>
                        <input type="text" class="form-control" name="link" value="{{$post->link}}" id="exampleInputEmail1" placeholder="Link">
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
@section('js')
    <script>
        $('#reservationtime').daterangepicker({
            defaultDate: '{{date('m/d/Y h:i A', strtotime($post->date_start))}} - {{date('m/d/Y h:i A', strtotime($post->date_end))}}',
            timePicker: true,
            locale: {
                format: 'MM/DD/YYYY hh:mm A'
            }
        })
    </script>
@endsection
