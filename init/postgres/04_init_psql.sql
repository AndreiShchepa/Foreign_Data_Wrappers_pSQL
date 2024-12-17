INSERT INTO orders (customer_id, status, subtotal, tax_amount, total_amount, created_at) VALUES 
    ('customer_1', 'completed', 1299.99, 120.25, 1420.24, '2024-03-15 10:00:00'),
    ('customer_1', 'processing', 899.99, 83.25, 983.24, '2024-03-16 11:30:00'),
    ('customer_2', 'completed', 1999.98, 177.50, 2177.48, '2024-03-14 09:15:00'),
    ('customer_2', 'cancelled', 499.99, 44.37, 544.36, '2024-03-13 16:45:00'),
    ('customer_1', 'pending', 2599.98, 240.50, 2840.48, '2024-03-17 14:20:00');

-- Sample Order Items (referencing products from MySQL)
INSERT INTO order_items (order_id, product_id, quantity, price, tax_rate) VALUES
    -- Order 1: Laptop Pro
    (1, 1, 1, 1299.99, 9.25),
    
    -- Order 2: Smartphone X
    (2, 2, 1, 899.99, 9.25),
    
    -- Order 3: Laptop Pro + Smartphone X
    (3, 1, 1, 1299.99, 8.875),
    (3, 2, 1, 699.99, 8.875),
    
    -- Order 4: Tablet Mini
    (4, 3, 1, 499.99, 8.875),
    
    -- Order 5: Two Laptop Pros
    (5, 1, 2, 1299.99, 9.25);

-- Sample Delivery Information
INSERT INTO delivery (order_id, address, status) VALUES
    (1, '123 Palm Street, Los Angeles, CA 90001', 'delivered'),
    (2, '123 Palm Street, Los Angeles, CA 90001', 'in_transit'),
    (3, '456 Broadway Ave, New York, NY 10013', 'delivered'),
    (4, '456 Broadway Ave, New York, NY 10013', 'cancelled'),
    (5, '123 Palm Street, Los Angeles, CA 90001', 'processing');
