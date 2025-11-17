from flask import Flask, jsonify
from flask_cors import CORS  # Import CORS
import mysql.connector

# --- Database Configuration ---
# !! IMPORTANT: Update these values for your MySQL setup !!
DB_CONFIG = {
    'user': 'root',
    'password': 'dangsql',  # <-- PUT YOUR MYSQL PASSWORD HERE
    'host': '127.0.0.1',         # Usually '127.0.0.1' or 'localhost'
    'database': 'FioriDB'
}

# --- Create the Flask App ---
app = Flask(__name__)

# --- Enable CORS ---
# This is what allows your index.html to fetch data from this server
CORS(app)

# --- Define a "route" or "API endpoint" ---
# This is the URL our frontend will fetch from
@app.route('/api/products')
def get_products():
    try:
        # Connect to the database
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Execute your query
        cursor.execute("SELECT product_id, name, description, image, stock, price FROM Products")
        
        # --- Convert the data to a list of dictionaries (JSON-friendly) ---
        # Get column names from the cursor
        column_names = [column[0] for column in cursor.description]
        
        # Fetch all rows and create a dictionary for each one
        products = []
        for row in cursor.fetchall():
            products.append(dict(zip(column_names, row)))
        # --- End of conversion ---

        # Close the connection
        cursor.close()
        conn.close()

        # Return the data as a JSON response
        return jsonify(products)

    except mysql.connector.Error as err:
        # Handle errors (e.g., database connection failed)
        print(f"Error: {err}")
        return jsonify({"error": "Database connection failed"}), 500

# --- Run the App ---
if __name__ == '__main__':
    # 'debug=True' makes the server auto-reload when you save changes
    app.run(debug=True, port=5000)