CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id TEXT,
    status VARCHAR(50),
    subtotal DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER,
    quantity INTEGER,
    price DECIMAL(10,2),
    tax_rate DECIMAL(5,2)
);

CREATE TABLE delivery (
    order_id INTEGER REFERENCES orders(order_id),
    address TEXT,
    status VARCHAR(50)
);
