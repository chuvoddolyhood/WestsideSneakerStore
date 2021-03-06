<?php
	if(!isset($_SESSION['login'])){
		header('location: ./modules_client/header/loginForm.php');
	}
?>

<?php
    include './admin/modules_admin/config.php';
    if(isset($_GET['username'])){
        $username = $_GET['username'];
    } else {
        $username = $_SESSION['login'];
    }
    $sql_cart = "SELECT h.MSHH, h.TenHH, img.TenHinh, g.Size, g.GiaDatHang, g.SoLuong, g.GiamGia, g.TongTien
        FROM giohang g JOIN khachhang k ON g.MSKH=k.MSKH
                        JOIN hanghoa h ON g.MSHH=h.MSHH
                        JOIN hinhhanghoa img ON h.MSHH=img.MSHH
        WHERE k.UserName='$username'";
    $query_cart = mysqli_query($conn, $sql_cart);
?>

<div class="background-cart">
    <?php if(mysqli_num_rows($query_cart)>0){?>
        <div class="container-cart">
            <div class="content-cart">
                <h1>Giỏ hàng</h1>
                <table>
                    <tr>
                        <th>STT</th>
                        <th colspan="2" class="colspan_titleProduct">Sản phẩm</th>
                        <th>Size</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Giảm giá</th>
                        <th>Số tiền</th>
                        <th>Xóa</th>
                    </tr>
                    <?php
                        $STT = 0;
                        while($row_order = mysqli_fetch_array($query_cart)){
                    ?>
                    <tr>
                        <td> <?php echo ++$STT ?> </td>
                        <input type="hidden" name="" id="" value="<?php echo $row_order['MSHH'] ?>">
                        <td class="image"><img src="./admin/photo/<?php echo $row_order['TenHinh'] ?>"></td>
                        <td class="titleProduct" style="text-align: left;"><?php echo $row_order['TenHH'] ?></td>
                        <td><?php echo $row_order['Size'] ?></td>
                        <td><?php echo $row_order['GiaDatHang'] ?></td>
                        <td class="bg-counter">
                        <?php echo $row_order['SoLuong'] ?>
                            <!-- <div class="count-content">
                                <span onmousedown="mouseDown_dec()" onmouseup="mouseUp()" onmouseleave="mouseLeave()" class="btn-adjust-amount">-</span>
                                <input id="input-amount" value="<?php echo $row_order['SoLuong'] ?>" class="input-amount" readonly>	
                                <span onmousedown="mouseDown_inc()" onmouseup="mouseUp()" onmouseleave="mouseLeave()" class="btn-adjust-amount">+</span>
                            </div> -->
                        </td>
                        <td><?php echo $row_order['GiamGia']*100 ?>%</td>
                        <td><?php echo $row_order['TongTien'] ?></td>
                        <td>
                            <a class="btn_delete_product" href="./modules_client/cart/delete_product.php?MSHH=<?php echo $row_order['MSHH']?>&username=<?php echo $username ?>"> Xóa</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
            </div>

            <div class="cash">
                <?php 
                    $sql_get_TongSoTien = "SELECT SUM(g.TongTien) AS TongSoTien
                            FROM giohang g JOIN khachhang k ON g.MSKH=k.MSKH    		
                            WHERE k.UserName='$username'";
                    $query_get_TongSoTien = mysqli_query($conn, $sql_get_TongSoTien);
                    $row_get_TongSoTien = mysqli_fetch_array($query_get_TongSoTien);
                ?>
                <a href="./modules_client/cart/cancel.php?username=<?php echo $username ?>" class="cancel_order">Hủy đơn hàng</a>
                <div class="address-list">
                    <?php
                        $sql_get_address = "SELECT d.MaDC, d.DiaChi FROM diachikh d JOIN khachhang k ON d.MSKH=k.MSKH WHERE k.UserName = '$username'";
                        $query_get_address = mysqli_query($conn, $sql_get_address);
                    ?>
                    <form class="address_cart" method="GET">
                        <label>Địa chỉ giao hàng</label>
                        <select name="MaDiaChi" id="MaDiaChi">
                            <option value="0">---Chọn địa chỉ---</option>
                            <?php while($row_get_address = mysqli_fetch_array($query_get_address)){ ?>
                            <option value="<?php echo $row_get_address['MaDC'] ?>"><?php echo $row_get_address['DiaChi'] ?></option>
                            <?php } ?>
                        </select>
                    </form>
                </div>
                <div class="money_order">
                    <div>
                        <p class="title">Tổng thanh toán</p>
                        <p>(<?php echo $STT ?> sản phẩm)</p>
                    </div>
                    <p class="money"><?php echo $row_get_TongSoTien['TongSoTien']  ?>₫</p>
                </div>
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                <a href="#" id="myHref" class="buy">Mua Hàng</a>
            </div>
        </div>
        <?php } else {?>
            <div><b>Giỏ hàng của bạn hiện đang trống</b></div>
        <?php } ?>
    </div>
</div>


<script type="text/javascript">
    //add product's amount:
    var timeout;
    function mouseDown_inc(){
        max = 10; //Gia tri so luong lon nhat trong counter = so luong hang hoa theo size
        value = isNaN(parseInt(document.getElementById('input-amount').value)) ? 0 : parseInt(document.getElementById('input-amount').value);
        if(value + 1 >= max){
            document.getElementById('input-amount').value = max;
        }else{
            document.getElementById('input-amount').value = value + 1;  
        }
        timeout = setTimeout(function() { mouseDown_inc(); }, 150);
    }

    function mouseDown_dec(){
        value = isNaN(parseInt(document.getElementById('input-amount').value)) ? 0 : parseInt(document.getElementById('input-amount').value);
        if(value - 1 <=0){
            document.getElementById('input-amount').value = '1';
        }else{
            document.getElementById('input-amount').value = value - 1;
        }
        timeout = setTimeout(function() { mouseDown_dec(); }, 150);
    }

    function mouseUp() { clearTimeout(timeout); }

    function mouseLeave() { clearTimeout(timeout); } 


    //Chuc nang nut Mua Hang
    $("#myHref").on('click', function() {
        let e = document.getElementById('MaDiaChi');
        let giaTri = e.value;
        // let giaTri = e.options[e.selectedIndex].text;
        if(giaTri == 0){
            alert('Vui lòng chọn địa chỉ trước khi đặt hàng.');
        } else {
            window.location = "./modules_client/cart/purchase.php?username=<?php echo $username ?>&MaDiaChi="+giaTri; 
        }

    });
</script>