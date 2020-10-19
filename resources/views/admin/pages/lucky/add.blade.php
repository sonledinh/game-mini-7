@extends('admin.layout.home')
@section('content')
<div class="row">
    <div class="col-md-8 offset-2">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Create</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="{{route('admin.lucky.create')}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Ma nhan vien</label>
                        <input type="text" class="form-control" name="staff_id" id="staff_id" >
                    </div>
                    <div class="form-group">
                        <label for="lucky_type">giaithuong</label>
                        <select class="form-control" name="lucky_type" id="lucky_type">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
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
@endsection
