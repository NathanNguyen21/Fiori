const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',          // Change to your MySQL username
  password: 'your_password',  // Change to your MySQL password
  database: 'FioriDB'
});

db.connect((err) => {
  if (err) {
    console.error('❌ Database connection failed:', err);
    return;
  }
  console.log('✅ Connected to MySQL database!');
});

// ============= API ENDPOINTS =============

// GET all products
app.get('/api/products', (req, res) => {
  const query = 'SELECT * FROM Products ORDER BY product_id';
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching products:', err);
      res.status(500).json({ error: err.message });
      return;
    }
    console.log(`✅ Fetched ${results.length} products`);
    res.json(results);
  });
});

// GET single product by ID
app.get('/api/products/:id', (req, res) => {
  const query = 'SELECT * FROM Products WHERE product_id = ?';
  
  db.query(query, [req.params.id], (err, results) => {
    if (err) {
      console.error('Error fetching product:', err);
      res.status(500).json({ error: err.message });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Product not found' });
      return;
    }
    console.log(`✅ Fetched product: ${results[0].name}`);
    res.json(results[0]);
  });
});

// GET predesigned bouquet with product details
app.get('/api/bouquets/:productId', (req, res) => {
  const query = `
    SELECT b.*, p.name, p.price, p.stock, p.image, p.description
    FROM Predesigned_Bouquet b
    JOIN Products p ON b.product_id = p.product_id
    WHERE p.product_id = ?
  `;
  
  db.query(query, [req.params.productId], (err, results) => {
    if (err) {
      console.error('Error fetching bouquet:', err);
      res.status(500).json({ error: err.message });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Bouquet not found' });
      return;
    }
    console.log(`✅ Fetched bouquet: ${results[0].name}`);
    res.json(results[0]);
  });
});

// UPDATE product stock (when item is purchased)
app.patch('/api/products/:id/stock', (req, res) => {
  const { quantity } = req.body;
  
  if (!quantity || quantity < 1) {
    res.status(400).json({ error: 'Invalid quantity' });
    return;
  }
  
  // First check if enough stock
  const checkQuery = 'SELECT stock FROM Products WHERE product_id = ?';
  db.query(checkQuery, [req.params.id], (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    
    if (results.length === 0) {
      res.status(404).json({ error: 'Product not found' });
      return;
    }
    
    if (results[0].stock < quantity) {
      res.status(400).json({ error: 'Not enough stock' });
      return;
    }
    
    // Update stock
    const updateQuery = 'UPDATE Products SET stock = stock - ? WHERE product_id = ?';
    db.query(updateQuery, [quantity, req.params.id], (err, results) => {
      if (err) {
        res.status(500).json({ error: err.message });
        return;
      }
      console.log(`✅ Updated stock for product ${req.params.id}`);
      res.json({ message: 'Stock updated successfully' });
    });
  });
});

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'Server is running' });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
  console.log(`📡 API available at http://localhost:${PORT}/api/products`);
});

// Handle shutdown gracefully
process.on('SIGINT', () => {
  db.end();
  console.log('\n👋 Database connection closed');
  process.exit();
});