<?php include('header.php');
include('db_connection.php');
?>

<body class="skin-blue">
    <div class="wrapper">

        <?php include('menu.php'); ?>

        <div class="content-wrapper" style="min-height: 1024px;">
            <section class="content-header">
                <h1> Ordered Product List <small>it all starts here</small> </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Admin</a></li>
                    <li class="active">Order List</li>
                </ol>
            </section>
            <section class="content">
                <div class="box">
                    <div class="box-header with-border">
                        <!--  <h3 class="box-title">Title</h3> -->
                        <!--  <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove"><i class="fa fa-times"></i></button>
                      </div>--><?php

                                $sql = "SELECT orders.order_id as id,users.fname as cname,orders.order_date as date,orders.invoice_id as invoice_id ,orders.total_price as price,orders.trxid as trxid,orders.order_type as type FROM orders,users WHERE 
   orders.customer_id=users.user_id";
                                //  mysql_select_db('fitness');
                                $retval = $con->query($sql);



                                //echo "Fetched data successfully\n";

                                ?>
                    </div>
                    <?php while ($row = mysqli_fetch_array($retval)) {
                        $invoice_id = $row['invoice_id'];
                        $sql = "SELECT ordered_products.product_name as pname,ordered_products.quantity as quantity,ordered_products.product_price as price FROM ordered_products
                    WHERE ordered_products.invoice_id=$invoice_id";
                        $product_info = $con->query($sql);
                    ?>
                        <div class="box-body">

                            <h3>
                                Order Id: <?php echo $row['invoice_id'] ?>

                            </h3>

                            <h3>
                                Order By: <?php echo $row['cname'] ?>
                            </h3>

                            <table id="example" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Per Pice Price</th>
                                        <th>Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($row_product = mysqli_fetch_array($product_info)) { ?>

                                        <tr>

                                            <td><?php echo $row_product['pname'] ?></td>
                                            <td><?php echo $row_product['quantity'] ?></td>
                                            <td><?php echo $row_product['price'] ?></td>
                                            <td><?php echo $row_product['quantity'] * $row_product['price'] ?></td>
                                        </tr>
                                    <?php } ?>


                                </tbody>
                            </table>

                        </div>
                        <hr>
                    <?php } ?>

                    <div class="box-footer"> </div>
                </div>
            </section>
        </div>
        <?php include('footer.php'); ?>

        <script>
            function ConfirmDelete() {
                if (confirm("Delete Account?"))
                    location.href = 'linktoaccountdeletion';
            }
        </script>