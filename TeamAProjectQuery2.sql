SELECT customer_order.cus_order_id, reciept.reciept_id, product.product_id, reciept.quantity, product.price, product.prod_name
FROM reciept
INNER JOIN customer_order
ON reciept.reciept_id = customer_order.reciept_id
INNER JOIN product
ON reciept.product_id = product.product_id

/* Query to the reciept for the customer order and quantity of each order*/