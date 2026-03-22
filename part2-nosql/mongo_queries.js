// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: 1,
    product_name: "Laptop",
    category: "Electronics",
    price: 55000,
    brand: "Dell",
    specifications: {
      ram: "16GB",
      storage: "512GB SSD",
      processor: "Intel i7"
    },
    warranty_years: 2
  },
  {
    _id: 2,
    product_name: "T-Shirt",
    category: "Clothing",
    price: 800,
    brand: "Nike",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    gender: "Unisex"
  },
  {
    _id: 3,
    product_name: "Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      calories: 42,
      fat: "1g",
      protein: "3.4g"
    }
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent field
db.products.updateOne(
  { product_name: "Laptop" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering products by category
