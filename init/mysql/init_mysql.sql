CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    stock INTEGER
);

INSERT INTO products (name, price, category, stock) VALUES
    ('Laptop Pro', 1299.99, 'Electronics', 50),
    ('Smartphone X', 899.99, 'Electronics', 100),
    ('Tablet Mini', 499.99, 'Electronics', 75);
