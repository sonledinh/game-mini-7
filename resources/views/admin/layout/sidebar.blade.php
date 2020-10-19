<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Sidebar -->
    <?php
    $name = Route::currentRouteName();
    ?>
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
{{--        <div class="user-panel mt-3 pb-3 mb-3 d-flex">--}}
{{--            <div class="image">--}}
{{--                <img src="/fontend/images/logo.png" class="img-circle elevation-2" alt="User Image">--}}
{{--            </div>--}}
{{--            <div class="info">--}}
{{--                <a href="#" class="d-block">Bestay</a>--}}
{{--            </div>--}}
{{--        </div>--}}
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">Giải thưởng</li>
                <li class="nav-item has-treeview {{$name == 'admins.lucky.list' ? 'menu-open' : ''}}">
                    <a href="#" class="nav-link {{$name == 'admins.lucky.list' ? 'active' : ''}}">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Quà tặng
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('admins.lucky.list')}}" class="nav-link {{$name == 'admins.lucky.list' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh sách</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<style>
    .fa-circle:before {
        font-size: 11px;
        position: relative;
        top: -1px;
        left: 4px;
    }
</style>
