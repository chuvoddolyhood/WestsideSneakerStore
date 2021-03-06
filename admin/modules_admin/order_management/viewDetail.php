<?php
    include './modules_admin/config.php';  
    if(isset($_GET['id'])){
        $id = $_GET['id'];

        //Lay trang thai don hang
        $sql_get_statusOrder="SELECT `TrangThaiDH` FROM `dathang` WHERE SoDonDH = $id";
        $query_get_statusOrder = mysqli_query($conn, $sql_get_statusOrder);
        $rows_get_statusOrder = mysqli_fetch_array($query_get_statusOrder);
        // $status = $rows_get_statusOrder["TrangThaiDH"];


        //Neu trang thai don hang la Da duyet, Da giao, Da huy
        $sql_get_infoOrder="SELECT k.HoTenKH, k.SoDienThoai, k.SoFax, k.TenCongTy, d.NgayDH, d.NgayGH, d.TrangThaiDH, dia.DiaChi, n.HoTenNV
                            FROM  khachhang k JOIN dathang d ON d.MSKH=k.MSKH
                                            JOIN diachikh dia ON d.MaDC=dia.MaDC
                                            JOIN nhanvien n ON d.MSNV=n.MSNV
                            WHERE d.SoDonDH=$id";

        //Neu trang thai don hang la Chua duyet
        $sql_get_infoOrder_temp="SELECT k.HoTenKH, k.SoDienThoai, k.SoFax, k.TenCongTy, d.NgayDH, d.NgayGH, d.TrangThaiDH, dia.DiaChi
                        FROM  khachhang k JOIN dathang d ON d.MSKH=k.MSKH
                                        JOIN diachikh dia ON d.MaDC=dia.MaDC
                        WHERE d.SoDonDH=$id";
    }
?>

<main>
    <div class="container-fluid">
        <div class="jumbotron">
            <div class="link-nav-pages">
                <a href="./index.php?page_layout=order_management">Quản Lý Đơn Hàng</a> /
                <a href="">Chi Tiết Đơn Hàng</a>
            </div>
            <!-- Neu trang thai don hang la Chua Duyet se ko co ten nhan vien trong CSDL. Nguoc lai se co  -->
            <?php $status = $rows_get_statusOrder["TrangThaiDH"]; if($status == 'Chưa duyệt'){ ?>
                <div>
                    <div class="card-container">
                        <?php
                            $query_get_infoOrder_temp = mysqli_query($conn, $sql_get_infoOrder_temp);
                            $rows_get_infoOrder_temp = mysqli_fetch_array($query_get_infoOrder_temp);
                        ?>
                        <h2><?php echo $rows_get_infoOrder_temp["HoTenKH"] ?></h2>
                        <p>Số điện thoại: <?php echo $rows_get_infoOrder_temp["SoDienThoai"] ?></p>
                        <p>Fax: <?php echo $rows_get_infoOrder_temp["SoFax"] ?></p>
                        <p>Tên công ty: <?php echo $rows_get_infoOrder_temp["TenCongTy"] ?></p>
                    </div>
                    
                    <div class="card-container">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                    <tr>
                                        <th scope="row">Mã đơn hàng</th>
                                        <td><?php echo $id ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Địa chỉ giao hàng</th>
                                        <td><?php echo $rows_get_infoOrder_temp["DiaChi"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ngày đặt</th>
                                        <td><?php echo $rows_get_infoOrder_temp["NgayDH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ngày giao</th>
                                        <td><?php echo $rows_get_infoOrder_temp["NgayGH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Trạng thái</th>
                                        <td><?php echo $rows_get_infoOrder_temp["TrangThaiDH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Nhân viên phụ trách</th>
                                        <td></td>
                                    </tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            <?php } else { ?>
                <div>
                    <div class="card-container">
                        <?php
                            $query_get_infoOrder = mysqli_query($conn, $sql_get_infoOrder);
                            $rows_get_infoOrder = mysqli_fetch_array($query_get_infoOrder);
                        ?>
                        <h2><?php echo $rows_get_infoOrder["HoTenKH"] ?></h2>
                        <p>Số điện thoại: <?php echo $rows_get_infoOrder["SoDienThoai"] ?></p>
                        <p>Fax: <?php echo $rows_get_infoOrder["SoFax"] ?></p>
                        <p>Tên công ty: <?php echo $rows_get_infoOrder["TenCongTy"] ?></p>
                    </div>
                    
                    <div class="card-container">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                    <tr>
                                        <th scope="row">Mã đơn hàng</th>
                                        <td><?php echo $id ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Địa chỉ giao hàng</th>
                                        <td><?php echo $rows_get_infoOrder["DiaChi"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ngày đặt</th>
                                        <td><?php echo $rows_get_infoOrder["NgayDH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ngày giao</th>
                                        <td><?php echo $rows_get_infoOrder["NgayGH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Trạng thái</th>
                                        <td><?php echo $rows_get_infoOrder["TrangThaiDH"] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Nhân viên phụ trách</th>
                                        <td><?php echo $rows_get_infoOrder["HoTenNV"] ?></td>
                                    </tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            <?php } ?>



            <div class="card-container">
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                            <th scope="col">STT</th>
                            <th scope="col">MSHH</th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Size</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Giảm giá</th>
                            <th scope="col">Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <?php
                                    $sql="SELECT h.TenHH, img.TenHinh, c.SoLuong, c.GiaDatHang, c.GiamGia, c.TongTien, c.Size, c.MSHH
                                            FROM hanghoa h JOIN hinhhanghoa img ON img.MSHH=h.MSHH
                                                        JOIN chitietdathang c   ON c.MSHH=h.MSHH
                                            WHERE c.SoDonDH=$id";
                    
                                    $query_info_order = mysqli_query($conn, $sql);
                                    $STT=0;
                                    while($rows = mysqli_fetch_array($query_info_order)){ ?>
                                    <tr>
                                        <th scope="row"><?php echo ++$STT ?></th>
                                        <td><?php echo $rows["MSHH"] ?></td>
                                        <td><?php echo $rows["TenHH"] ?></td>
                                        <td><img src="./photo/<?php echo $rows["TenHinh"] ?>" alt="<?php echo $rows["TenHinh"] ?>" style="width: 20%"></td>
                                        <td><?php echo $rows["Size"] ?></td>
                                        <td><?php echo $rows["SoLuong"] ?></td>
                                        <td><?php echo $rows["GiaDatHang"] ?></td>
                                        <td><?php echo $rows["GiamGia"] ?></td>
                                        <td><?php echo $rows["TongTien"] ?></td>
                                    </tr>
                                <?php } ?>
                            </tr>
                        </tbody>
                    </table>
                    <h5 style="text-align: right">Tổng tiền: 
                        <?php
                            $sql_sumPrice="SELECT SUM(TongTien) AS sum FROM chitietdathang WHERE SoDonDH=$id";
                            $query_sumPrice = mysqli_query($conn, $sql_sumPrice);
                            $rows_sumPrice = mysqli_fetch_array($query_sumPrice);
                            echo $rows_sumPrice["sum"];
                            ?>₫
                    </h5>
                </div>      
            </div>
            <br/>
            <div class="card-container">
                <?php
                    $sql = "SELECT TrangThaiDH FROM dathang WHERE SoDonDH=$id";
                    $query = mysqli_query($conn, $sql);
                    $rows = mysqli_fetch_array($query);
                    $options = $rows['TrangThaiDH'];
                    $option_status = 0;
                    $status_update = "";
                ?>

                <h4>Cập nhật tình trạng đơn hàng</h4>
                <div class="form-group">
                    <form name="myForm" method="post" action="">
                        <select name="status_update" class="form-control" onchange="myForm.submit();">
                            <option 
                                <?php
                                    if (isset($_POST['status_update']) && $_POST['status_update'] == "Chưa duyệt") {
                                        $option_status = 1;
                                        echo 'selected="selected"';
                                    } else if (!$option_status && $options=="Chưa duyệt"){
                                        echo 'selected="selected"';
                                    }   
                                ?> 
                                value="Chưa duyệt" 
                            >
                                Chưa duyệt
                            </option>
                            <option 
                                <?php
                                    if (isset($_POST['status_update']) && $_POST['status_update'] == "Đã duyệt") {
                                        $option_status = 1;
                                        echo 'selected="selected"';
                                    } else if (!$option_status && $options=="Đã duyệt"){
                                        echo 'selected="selected"';
                                    }   
                                ?> 
                                value="Đã duyệt" 
                            >
                                Đã duyệt
                            <option 
                                <?php
                                    if (isset($_POST['status_update']) && $_POST['status_update'] == "Đã giao") {
                                        $option_status = 1;
                                        echo 'selected="selected"';
                                    } else if (!$option_status && $options=="Đã giao"){
                                        echo 'selected="selected"';
                                    }   
                                ?> 
                                value="Đã giao" 
                            >
                                Đã giao
                            </option>
                            <option 
                                <?php
                                    if (isset($_POST['status_update']) && $_POST['status_update'] == "Đã hủy") {
                                        $option_status = 1;
                                        echo 'selected="selected"';
                                    } else if (!$option_status && $options=="Đã hủy"){
                                        echo 'selected="selected"';
                                    }   
                                ?> 
                                value="Đã hủy" 
                            >
                                Đã hủy
                            </option>
                        </select>
                    </form>
                </div>
                <br/>
                <a name="btn_submit"
                    href="./modules_admin/order_management/confirmOrder.php?id= <?php echo $id ?>&status_update=<?php echo $_POST['status_update']?>&id_admin=<?php echo $_SESSION['login_admin'] ?>"
                    style="background-color: green;color: white;padding: 8px 15px;text-align: center;text-decoration: none;display: inline-block;border-radius: 5px;">
                            Xác nhận
                </a>
                
            </div>
        </div>
    </div>
</main>
