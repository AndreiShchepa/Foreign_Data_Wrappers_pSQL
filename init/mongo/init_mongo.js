db.auth('root', 'mongodb');
db = db.getSiblingDB('demo');
db.createCollection('customers');
db.customers.insertMany([
    {
        name: "John Doe",
        email: "john@example.com",
        addresses: ["123 Main St, CA"],
        tax_region: "US-CA"
    },
    {
        name: "Jane Smith",
        email: "jane@example.com",
        addresses: ["456 Oak Rd, NY"],
        tax_region: "US-NY"
    }
]);
