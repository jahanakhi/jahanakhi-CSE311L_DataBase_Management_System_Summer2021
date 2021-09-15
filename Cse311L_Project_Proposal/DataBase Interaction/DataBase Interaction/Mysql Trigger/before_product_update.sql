CREATE TRIGGER `before_product_update` BEFORE UPDATE ON `products`
 FOR EACH ROW BEGIN
INSERT INTO products_log (`product_id`, `product_name`, `product_des`, `product_pic`, `exported_from`, `num_avl_product`, `price`) VALUES
(old.product_id, old.product_name, old.product_des, old.product_pic, old.exported_from, old.num_avl_product, old.price);

       END