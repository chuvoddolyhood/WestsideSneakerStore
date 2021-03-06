<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="./../style/login.css" />
  <title>Log in</title>
</head>

<body>
  <div class="container">
    <div class="forms-container">
      <div class="signin-signup">
        <!-- Đăng nhập -->
        <form action="./login.php" class="sign-in-form" method="POST">
          <h2 class="title">Đăng nhập</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="text" name="username_client" placeholder="Tên đăng nhập" required/>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" name="password_client" placeholder="Mật khẩu" required/>
          </div>
          <input type="submit" value="Đăng nhập" class="btn solid" name="btn_login" />
          <p class="social-text">Đăng nhập bằng phương thức khác</p>
          <div class="social-media">
            <a href="#" class="social-icon">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-apple"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-google"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
        </form>

        <!-- Đăng ký -->
        <form class="sign-up-form">
          <h2 class="title">Đăng ký</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="text" id="name_client" placeholder="Họ và tên" required/>
          </div>
          <div class="input-field">
            <i class="fas fa-phone"></i>
            <input type="text" id="phoneNumber_client" placeholder="Số điện thoại" required/>
          </div>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="text" id="username_client" placeholder="Tên đăng nhập" required/>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" id="password_client" placeholder="Mật khẩu" required/>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" id="passwordAgain_client" placeholder="Nhập lại mật khẩu" required/>
          </div>
          <input type="button" class="btn" value="Đăng ký" onclick="check()"/>
          <p class="social-text">Đăng ký bằng phương thức khác</p>
          <div class="social-media">
            <a href="#" class="social-icon">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-apple"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-google"></i>
            </a>
            <a href="#" class="social-icon">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
        </form>
      </div>
    </div>

    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>Nếu bạn chưa có tài khoản ?</h3>
          <p>
            Hãy đăng ký để chúng tôi có thể mang đến cho bạn nhiều trải nghiệm thú vị khi mua sắm.
          </p>
          <button class="btn transparent" id="sign-up-btn" style="margin-right: 1vw">
            Đăng ký
          </button>
          <button class="btn transparent homepage" id="back-homepage-btn">
            <a href="./../.." style="text-decoration: none; color:#fff">Về Trang chủ</a>
          </button>
        </div>
        <img src="./../photo/purchase.svg" class="image" alt="" />
      </div>
      <div class="panel right-panel">
        <div class="content">
          <h3>Bạn muốn đặt hàng ?</h3>
          <p>
            Hãy click vào nút đăng nhập để chúng tôi có thể tiến hành thu nhập những góp ý và xác nhận đơn hàng của bạn.
          </p>
          <button class="btn transparent" id="sign-in-btn" style="margin-right: 1vw">
            Đăng nhập
          </button>
          <button class="btn transparent" id="back-homepage-btn">
            <a href="./../.."style="text-decoration: none; color:#fff">Về Trang chủ</a>
          </button>
        </div>
        <img src="./../photo/cart.svg" class="image" alt="" />
      </div>
    </div>
  </div>

  <script src="loginForm.js"></script>
</body>

</html>