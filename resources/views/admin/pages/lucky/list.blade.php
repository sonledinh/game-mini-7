@extends('admin.layout.home')
@section('pages', 'List data')
@section('content')
    <div class="row">
{{--        <div class="col-md-2" style="margin: 20px 0px">--}}
{{--            <a href="{{route('admins.menu.add')}}">--}}
{{--                <button type="button" class="btn btn-block btn-success btn-lg">Add Menu</button>--}}
{{--            </a>--}}
{{--        </div>--}}
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">List</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Mã nhân sự</th>
                            <th>Họ tên</th>
                            <th>Giải</th>
                            <th style="display: none;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($list as $key => $v)
                            <tr>
                                <td>
                                    {{@$v->getStaff->staff_id}}
                                </td>
                                <td>
                                    {{@$v->getStaff->ho_ten}}
                                </td>
                                <td>
                                    Giải {{$v->lucky_type}}
                                </td>
                                <td style="display: none;"><a href="{{route('admin.lucky.delete', $v->lucky_id)}}">x</a></td>
                            </tr>
                        @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>Mã nhân sự</th>
                            <th>Họ tên</th>
                            <th>Giải</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.col -->
    </div>
@endsection
@section('js')
    <script>
        @if (\Session::has('success'))
        swal('Alert', "{!! \Session::get('success') !!}", 'success');
        @endif
        @if (\Session::has('error'))
        swal('Alert', "{!! \Session::get('error') !!}", 'error');
        @endif
        $(function () {
            $("#example1").DataTable({
                "responsive": true,
                "autoWidth": false,
            });
        });
    </script>
@endsection
