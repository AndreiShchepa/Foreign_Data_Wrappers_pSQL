-- MySQL FDW
CREATE SERVER mysql_server
    FOREIGN DATA WRAPPER mysql_fdw
    OPTIONS (host 'pdb_mysql', port '3306');

CREATE USER MAPPING FOR postgres
    SERVER mysql_server
    OPTIONS (username 'mysql', password 'mysql');

CREATE FOREIGN TABLE products (
    product_id INTEGER,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    stock INTEGER
) SERVER mysql_server
OPTIONS (dbname 'product_db', table_name 'products');

-- MongoDB FDW
CREATE SERVER mongo_server
    FOREIGN DATA WRAPPER mongo_fdw
    OPTIONS (address 'pdb_mongo', port '27017', authentication_database 'admin');

CREATE USER MAPPING FOR postgres
    SERVER mongo_server
    OPTIONS (username 'root', password 'mongodb');

CREATE FOREIGN TABLE customers (
    name VARCHAR(100),
    email VARCHAR(100),
    addresses TEXT[],
    tax_region VARCHAR(50)
) SERVER mongo_server
OPTIONS (database 'demo', collection 'customers');

-- CSV FDW
CREATE SERVER csv_server FOREIGN DATA WRAPPER file_fdw;

CREATE FOREIGN TABLE tax_rates (
    region VARCHAR(50),
    category VARCHAR(50),
    rate DECIMAL(5,2),
    rules TEXT
) SERVER csv_server
OPTIONS (filename '/data/tax_rates.csv', format 'csv', header 'true');
