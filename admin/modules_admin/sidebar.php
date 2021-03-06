<div id="sidebar">
  <div class="sidebar__title">
    <div class="sidebar__img">
      <img src="./photo/logo.jpg" alt="logo"/>
      <h1>Westside Sneaker Store</h1>
    </div>
    <i
      onclick="closeSidebar()"
      class="fa fa-times"
      id="sidebarIcon"
      aria-hidden="true"
    ></i>
  </div>

  <div class="sidebar__menu">
    <div class="sidebar__link active_menu_link">
      <i class="fa fa-home"></i>
      <a href="./index.php?page_layout=dashboard">Dashboard</a>
    </div>
    <h2>QUẢN LÝ</h2>
    <div class="sidebar__link">
      <i class="fa fa-user-secret" aria-hidden="true"></i>
      <a href="./index.php?page_layout=admin_management">Quản Lý Admin</a>
    </div>
    <div class="sidebar__link">
      <i class="fa fa-building-o"></i>
      <a href="./index.php?page_layout=client_management">Quản Lý Khách Hàng</a>
    </div>
    <div class="sidebar__link">
      <!-- <i class="fas fa-user-alt"></i> -->
      <!-- <i class="fa fa-wrench"></i> -->
      <i class="fa fa-briefcase"></i>
      <a href="./index.php?page_layout=staff_management">Quản Lý Nhân Viên</a>
    </div>
    <div class="sidebar__link">
      <i class="fa fa-archive"></i>
      <a href="./index.php?page_layout=product_management">Quản Lý Hàng Hóa</a>
    </div>
    <div class="sidebar__link">
      <!-- <i class="fa fa-handshake-o"></i> -->
      <i class="fa fa-money"></i>
      <a href="./index.php?page_layout=order_management">Quản Lý Đơn Hàng</a>
    </div>
    <!-- <h2>LEAVE</h2>
    <div class="sidebar__link">
      <i class="fa fa-question"></i>
      <a href="#">Requests</a>
    </div>
    <div class="sidebar__link">
      <i class="fa fa-sign-out"></i>
      <a href="#">Leave Policy</a>
    </div>
    <div class="sidebar__link">
      <i class="fa fa-calendar-check-o"></i>
      <a href="#">Special Days</a>
    </div>
          <div class="sidebar__link">
            <i class="fa fa-files-o"></i>
            <a href="#">Apply for leave</a>
          </div>
          <h2>PAYROLL</h2>
          <div class="sidebar__link">
            <i class="fa fa-money"></i>
            <a href="#">Payroll</a>
          </div>
          <div class="sidebar__link">
            <i class="fa fa-briefcase"></i>
            <a href="#">Paygrade</a>
          </div> -->
    </div>
  </div>
</div>

<!-- <script type="text/javascript">
    //Choose size
    const options = document.querySelectorAll('.sidebar__link');
    function changeOption(){
      options.forEach(option => option.classList.remove('active_menu_link'));
        this.classList.add('active_menu_link');
    }   
    options.forEach(option => option.addEventListener('click', changeOption));
    window.addEventListener('resize', changeHeight);
</script> -->