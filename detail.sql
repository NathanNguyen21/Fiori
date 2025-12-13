--- detail.sql
#Customer----------
#INSERT INTO Customer (customer_id, password, address, phone, name, email) VALUES
#('Q5U4EX7YY2E9N', 'Pass87678', '387 Posey Street', '563-392-3648', 'Teri Cru', 'euro45@aol.com'),
#('345RED', 'avgONE45!', '294 Rosett Lane', '384-294-4759', 'Laros Reed', 'sandman87@gmail.com'),
#('36485gReen23', 'randomPass##', '38 Tree Stump Rd', '(1)924-626-7439', 'Lancel Tyl', 'lantern0@hotmail.com');

#Shopping Cart----------
#INSERT INTO Shopping_Cart (cart_id, customer_id, total_price) VALUES
#('2783GHS', 'Q5U4EX7YY2E9N', 43.56),
#('2383KS93', '345RED', 82.02),
#('0283SUI', '36485gReen23', 34.56);

#Products----------
INSERT INTO Products (product_id, name, description, image, stock, price) VALUES
('PRM01', 'Dark Fuchsia Bouquet', 'Our Dark Fuchsia Bouquet features a stunning arrangement of deep magenta blooms that bring elegance and sophistication to any space. Hand-selected flowers are expertly arranged to create a perfect balance of color and texture.', 'https://fioriSI.com/images/PRM01.jpg', 20, 55.00),
('PRM02', 'Autumn Sunflower Bouquet', 'Bright and cheerful sunflowers combined with seasonal autumn blooms create a warm and inviting arrangement. Perfect for bringing sunshine into any room.', 'https://fioriSI.com/images/PRM02.jpg', 20, 65.00),
('PRM03', 'Red Assorted Bouquet', 'A passionate mix of red blooms featuring roses, carnations, and seasonal flowers. Perfect for expressing love and admiration.', 'https://fioriSI.com/images/PRM03.jpg', 20, 45.00),
('PRM04', 'Spring Garden Mix', 'A delightful collection of spring blooms including tulips, daffodils, and hyacinths that capture the essence of the season.', 'https://fioriSI.com/images/PRM04.jpg', 20, 50.00),
('PRM05', 'White Rose Elegance', 'Timeless and elegant, this arrangement features premium white roses accented with delicate greenery. Perfect for weddings and special occasions.', 'https://fioriSI.com/images/PRM05.jpg', 20, 70.00),
('PRM06', 'Tropical Paradise', 'Exotic tropical flowers including birds of paradise, orchids, and anthuriums create a stunning, bold arrangement.', 'https://fioriSI.com/images/PRM06.jpg', 20, 85.00),
('PRM07', 'Lavender Dreams', 'Soothing lavender blooms combined with purple and white flowers create a calming and aromatic arrangement.', 'https://fioriSI.com/images/PRM07.jpg', 20, 60.00),
('PRM08', 'Pink Peony Collection', 'Luxurious peonies in soft pink shades create a romantic and elegant display. A customer favorite for its beauty and fragrance.', 'https://fioriSI.com/images/PRM08.jpg', 20, 75.00),
('PRM09', 'Wildflower Medley', 'A charming mix of wildflowers and meadow blooms that bring a rustic, natural beauty to any space.', 'https://fioriSI.com/images/PRM09.jpg', 20, 40.00),
('PRM10', 'Classic Red Roses', 'A timeless arrangement of premium long-stem red roses. The perfect way to express love and romance.', 'https://fioriSI.com/images/PRM10.jpg', 20, 80.00),
('PRM11', 'Sunset Bouquet', 'Warm orange and yellow blooms reminiscent of a beautiful sunset. Features roses, gerberas, and lilies.', 'https://fioriSI.com/images/PRM11.jpg', 20, 55.00),
('PRM12', 'Garden Romance', 'A romantic garden-style arrangement with roses, ranunculus, and lisianthus in soft pastel shades.', 'https://fioriSI.com/images/PRM12.jpg', 20, 65.00);


#Cart_Product----------
-- INSERT INTO Cart_Product (cart_id, product_id) VALUES
-- ('2783GHS', 'P0934'), ('2783GHS', '34TR09'), ('2383KS93', '34TR09'), ('0283SUI', '374GSHS'); 

#Flower----------
INSERT INTO Flower (flower_id, type, color, price, stock) VALUES
('373BG', 'Carnation', 'Orange', 2.44, 126),
('373HSU', 'Chrysanthemum', 'Red', 3.20, 250),
('7RE393', 'Rose', 'Red', 3.80, 300);

#Product_Flower----------
#INSERT INTO Product_Flower (product_id, flower_id) VALUES
#('P0934', '373HSU'),
#('P0934', '373BG'),
#('34TR09', '7RE393');

#Predesigned_Bouquet----------
INSERT INTO Predesigned_Bouquet (bouquet_id, product_id, is_predesigned, image, description) VALUES
('BPR01', 'PRM01', TRUE, 'https://fioriSI.com/images/PRM01.jpg', 'Our Dark Fuchsia Bouquet features a stunning arrangement of deep magenta blooms that bring elegance and sophistication to any space...'),
('BPR02', 'PRM02', TRUE, 'https://fioriSI.com/images/PRM02.jpg', 'Bright and cheerful sunflowers combined with seasonal autumn blooms create a warm and inviting arrangement...'),
('BPR03', 'PRM03', TRUE, 'https://fioriSI.com/images/PRM03.jpg', 'A passionate mix of red blooms featuring roses, carnations, and seasonal flowers. Perfect for expressing love and admiration.'),
('BPR04', 'PRM04', TRUE, 'https://fioriSI.com/images/PRM04.jpg', 'A delightful collection of spring blooms including tulips, daffodils, and hyacinths that capture the essence of the season.'),
('BPR05', 'PRM05', TRUE, 'https://fioriSI.com/images/PRM05.jpg', 'Timeless and elegant, this arrangement features premium white roses accented with delicate greenery...'),
('BPR06', 'PRM06', TRUE, 'https://fioriSI.com/images/PRM06.jpg', 'Exotic tropical flowers including birds of paradise, orchids, and anthuriums create a stunning, bold arrangement.'),
('BPR07', 'PRM07', TRUE, 'https://fioriSI.com/images/PRM07.jpg', 'Soothing lavender blooms combined with purple and white flowers create a calming and aromatic arrangement.'),
('BPR08', 'PRM08', TRUE, 'https://fioriSI.com/images/PRM08.jpg', 'Luxurious peonies in soft pink shades create a romantic and elegant display. A customer favorite for its beauty and fragrance.'),
('BPR09', 'PRM09', TRUE, 'https://fioriSI.com/images/PRM09.jpg', 'A charming mix of wildflowers and meadow blooms that bring a rustic, natural beauty to any space.'),
('BPR10', 'PRM10', TRUE, 'https://fioriSI.com/images/PRM10.jpg', 'A timeless arrangement of premium long-stem red roses. The perfect way to express love and romance.'),
('BPR11', 'PRM11', TRUE, 'https://fioriSI.com/images/PRM11.jpg', 'Warm orange and yellow blooms reminiscent of a beautiful sunset. Features roses, gerberas, and lilies.'),
('BPR12', 'PRM12', TRUE, 'https://fioriSI.com/images/PRM12.jpg', 'A romantic garden-style arrangement with roses, ranunculus, and lisianthus in soft pastel shades.');

#Orders----------
#INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status) VALUES
#('00001', 'Q5U4EX7YY2E9N', '2025-11-01', 66.23, 'pending'),
#('00002', '345RED', '2025-09-23', 44.29, 'complete'),
#('00003', '36485gReen23', '2025-08-04', 11.29, 'complete');

#Order_Product----------
#INSERT INTO Order_Product (order_id, product_id) VALUES
#('00001', 'P0934'),
#('00001', '34TR09'),
#('00002', '34TR09'),
#('00003', '374GSHS');

#Payment----------
#INSERT INTO Payment (payment_id, order_id, status, method, amount) VALUES
#('Payment001', '00001', 'completed', 'credit', 66.23),
#('Payment002', '00002', 'completed', 'debit', 44.29),
#('Payment003', '00003', 'completed', 'PayPal', 11.29);