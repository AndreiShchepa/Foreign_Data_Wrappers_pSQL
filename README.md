## Foreign Data Wrappers in PostgreSQL

To avoid different local errors and incompatibilities, I have prepared Docker containers with a complete setup of necessary databases and foreign data wrappers for them.

### Usage

```bash
export COMPOSE_PROJECT_NAME=demo-fdw
docker-compose up -d
docker exec -it pdb_postgres psql -U postgres -d demo
```
After this, you will be connected to the PostgreSQL database as the postgres user. You can run `\d` to list all tables and test some queries.


### Test queries
```sql
SELECT
	c.name,
	p.name as product_name,
	p.price,
	tr.rate as tax_rate,
	(p.price * tr.rate / 100) as tax_amount
FROM customers c
JOIN tax_rates tr ON c.tax_region = tr.region
CROSS JOIN products p
WHERE p.category = tr.category;
```
---
```sql
SELECT * FROM products p
JOIN customers c ON p.category = ’Electronics’
WHERE c.tax_region = ’US-CA’;
```

### Clean up resources
```bash
docker rm -f pdb_mysql pdb_postgres pdb_mongo && docker rmi mysql:8.0 demo-fdw_postgres mongo:7.0
```
