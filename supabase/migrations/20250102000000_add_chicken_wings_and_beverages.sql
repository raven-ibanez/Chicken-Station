/*
  # Add Chicken Wings and Beverages Menu Items

  1. New Categories
    - Add chicken-wings category for chicken and wings items
    - Update beverages category to include new drink types

  2. New Menu Items
    - Unlimited Wings: Main unlimited wings package with flavor options
    - Chicken Bucket: Various sizes of chicken wings and boneless chicken
    - Solo Meals: Individual chicken meals and other solo options
    - Milk Tea: Various flavors with size options
    - Fruit Soda: Various flavors with size options and Yakult add-on
    - Other Drinks: Pitcher, lemon drinks, sodas, and water

  3. Features
    - Auto-generated UUIDs for all items
    - Detailed descriptions with serving sizes and piece counts
    - Appropriate pricing for each item
    - Variations for flavors, sizes, and add-ons
    - Proper categorization for easy browsing
*/

-- First, ensure all required categories exist
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('chicken-wings', 'Chicken & Wings', '🍗', 5, true),
  ('beverages', 'Beverages', '🍵', 4, true)
ON CONFLICT (id) DO NOTHING;

-- Insert Unlimited Wings
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Unlimited Wings', 'Includes Unlimited Wings, Unlimited Rice, Unlimited Drinks, and Unlimited Fries. Left-over wings cost 20 ₱ each. Left-over rice costs 10 ₱ each.', 320, 'chicken-wings', true, true, NULL);

-- Add wing flavor variations for Unlimited Wings
INSERT INTO variations (menu_item_id, name, price) VALUES
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'OG Flavor', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Korean Barbecue', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Spicy Garlic Butter', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Yangyeom', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Tropical Mango', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Fiery Buffalo', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Spicy Honey Glaze', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Salted Egg', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Garlic Parmesan', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Sweet Chili', 0),
  ((SELECT id FROM menu_items WHERE name = 'Unlimited Wings'), 'Snow Cheese', 0)
ON CONFLICT DO NOTHING;

-- Insert Chicken Bucket Items (Consolidated)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chicken Wings', 'Crispy chicken wings with your choice of flavors. Choose 1 flavor for 3 PCS, 2 flavors for 6 PCS, 3 flavors for 9-12 PCS.', 135, 'chicken-wings', true, true, NULL),
  ('Boneless Chicken', 'Tender boneless chicken pieces with your choice of flavors. Choose 1 flavor for 3 PCS, 2 flavors for 6 PCS, 3 flavors for 9-12 PCS.', 310, 'chicken-wings', false, true, NULL),
  ('Chix Tenders', 'Crispy chicken tenders with your choice of flavors.', 160, 'chicken-wings', false, true, NULL);

-- Add size variations for chicken items
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Chicken Wings size variations
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), '6 PCS', 0),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), '9 PCS', 40),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), '12 PCS', 100),
  
  -- Boneless Chicken size variations
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), '6 PCS', 0),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), '9 PCS', 150),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), '12 PCS', 310),
  
  -- Chix Tenders size variations
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), '3 PCS', 0),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), '6 PCS', 139),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), '9 PCS', 285)
ON CONFLICT DO NOTHING;

-- Add flavor add-ons for chicken items
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  -- Chicken Wings flavors
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Snow Cheese', 0, 'flavor'),
  
  -- Boneless Chicken flavors
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Snow Cheese', 0, 'flavor'),
  
  -- Chix Tenders flavors
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Snow Cheese', 0, 'flavor')
ON CONFLICT DO NOTHING;

-- Add sides and add-ons for all chicken items
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  -- Fries add-ons for all chicken items
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Fries Solo', 60, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Fries Sharing', 140, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Fries Solo', 60, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Fries Sharing', 140, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Fries Solo', 60, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Fries Sharing', 140, 'sides'),
  
  -- Plain Rice add-ons for all chicken items
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Plain Rice', 20, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Plain Rice', 20, 'sides'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Plain Rice', 20, 'sides'),
  
  -- Dipping Sauce add-ons for all chicken items
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Gravy', 25, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Garlic Mayo', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Cheesy Dip', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Wings'), 'Extra Sauce', 30, 'dipping-sauce'),
  
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Gravy', 25, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Garlic Mayo', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Cheesy Dip', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chicken'), 'Extra Sauce', 30, 'dipping-sauce'),
  
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Gravy', 25, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Garlic Mayo', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Cheesy Dip', 40, 'dipping-sauce'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders'), 'Extra Sauce', 30, 'dipping-sauce')
ON CONFLICT DO NOTHING;

-- Insert Solo Meals
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('3 PCS Chicken Wings w/ Rice or Fries', '3 pieces chicken wings with rice or fries. Choose 1 flavor.', 90, 'chicken-wings', true, true, NULL),
  ('Boneless Chix Solo', 'Boneless chicken pieces with rice. Choose 1 flavor.', 85, 'chicken-wings', false, true, NULL),
  ('CS Porkchop w/ Rice', 'Crispy porkchop with rice.', 100, 'chicken-wings', false, true, NULL),
  ('Crispy Liempo w/ Rice', 'Crispy liempo with rice.', 100, 'chicken-wings', false, true, NULL),
  ('Chix Tenders Solo', 'Chicken tenders with rice. Choose 1 flavor.', 150, 'chicken-wings', false, true, NULL),
  ('Chessy Mac N'' Chix', 'Mac & Cheese topped with fries, chicken tender & OG sauce. Add 15 ₱ for extra drizzle sauce.', 189, 'chicken-wings', false, true, NULL),
  ('Chicken Poppers w/ Rice', 'Chicken poppers with rice and OG sauce. Add 15 ₱ for extra drizzle sauce.', 69, 'chicken-wings', false, true, NULL);

-- Add size variations for solo meals
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Boneless Chix Solo size variations
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), '1 PC', 0),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), '2 PCS', 64),
  
  -- Chix Tenders Solo size variations
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), '2 PCS', 0),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), '3 PCS', 50)
ON CONFLICT DO NOTHING;

-- Add side options for 3 PCS Chicken Wings
INSERT INTO variations (menu_item_id, name, price) VALUES
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Rice', 0),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Fries', 0)
ON CONFLICT DO NOTHING;

-- Add flavor add-ons for solo meals that need them
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  -- 3 PCS Chicken Wings w/ Rice or Fries flavors
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Snow Cheese', 0, 'flavor'),
  
  -- Boneless Chix Solo flavors
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Snow Cheese', 0, 'flavor'),
  
  -- Chix Tenders Solo flavors
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'OG Flavor', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Korean Barbecue', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Spicy Garlic Butter', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Yangyeom', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Tropical Mango', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Fiery Buffalo', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Spicy Honey Glaze', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Salted Egg', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Garlic Parmesan', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Sweet Chili', 0, 'flavor'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Snow Cheese', 0, 'flavor')
ON CONFLICT DO NOTHING;

-- Add drink add-on for solo meals
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  ((SELECT id FROM menu_items WHERE name = '3 PCS Chicken Wings w/ Rice or Fries'), 'Add Drink', 20, 'drinks'),
  ((SELECT id FROM menu_items WHERE name = 'Boneless Chix Solo'), 'Add Drink', 20, 'drinks'),
  ((SELECT id FROM menu_items WHERE name = 'Chix Tenders Solo'), 'Add Drink', 20, 'drinks')
ON CONFLICT DO NOTHING;

-- Insert Milk Tea Items
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Matcha Milk Tea', 'Creamy matcha milk tea. Available in 16 OZ or 22 OZ.', 65, 'beverages', true, true, NULL),
  ('Cookies and Cream Milk Tea', 'Rich cookies and cream milk tea. Available in 16 OZ or 22 OZ.', 60, 'beverages', true, true, NULL),
  ('Wintermelon Milk Tea', 'Refreshing wintermelon milk tea. Available in 16 OZ or 22 OZ.', 55, 'beverages', false, true, NULL),
  ('Chocolate Milk Tea', 'Decadent chocolate milk tea. Available in 16 OZ or 22 OZ.', 55, 'beverages', false, true, NULL);

-- Add size variations for milk tea
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Matcha Milk Tea
  ((SELECT id FROM menu_items WHERE name = 'Matcha Milk Tea'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Milk Tea'), '22 OZ', 10),
  
  -- Cookies and Cream Milk Tea
  ((SELECT id FROM menu_items WHERE name = 'Cookies and Cream Milk Tea'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Cookies and Cream Milk Tea'), '22 OZ', 10),
  
  -- Wintermelon Milk Tea
  ((SELECT id FROM menu_items WHERE name = 'Wintermelon Milk Tea'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Wintermelon Milk Tea'), '22 OZ', 10),
  
  -- Chocolate Milk Tea
  ((SELECT id FROM menu_items WHERE name = 'Chocolate Milk Tea'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Chocolate Milk Tea'), '22 OZ', 10)
ON CONFLICT DO NOTHING;

-- Insert Fruit Soda Items
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Green Apple Fruit Soda', 'Refreshing green apple soda. Available in 16 OZ or 22 OZ. Add Yakult for +15 ₱.', 55, 'beverages', false, true, NULL),
  ('Passion Fruit Soda', 'Tropical passion fruit soda. Available in 16 OZ or 22 OZ. Add Yakult for +15 ₱.', 55, 'beverages', false, true, NULL),
  ('Lychee Fruit Soda', 'Sweet lychee soda. Available in 16 OZ or 22 OZ. Add Yakult for +15 ₱.', 55, 'beverages', false, true, NULL);

-- Add size and Yakult variations for fruit soda
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Green Apple Fruit Soda
  ((SELECT id FROM menu_items WHERE name = 'Green Apple Fruit Soda'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Green Apple Fruit Soda'), '22 OZ', 15),
  ((SELECT id FROM menu_items WHERE name = 'Green Apple Fruit Soda'), 'With Yakult', 15),
  
  -- Passion Fruit Soda
  ((SELECT id FROM menu_items WHERE name = 'Passion Fruit Soda'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Passion Fruit Soda'), '22 OZ', 15),
  ((SELECT id FROM menu_items WHERE name = 'Passion Fruit Soda'), 'With Yakult', 15),
  
  -- Lychee Fruit Soda
  ((SELECT id FROM menu_items WHERE name = 'Lychee Fruit Soda'), '16 OZ', 0),
  ((SELECT id FROM menu_items WHERE name = 'Lychee Fruit Soda'), '22 OZ', 15),
  ((SELECT id FROM menu_items WHERE name = 'Lychee Fruit Soda'), 'With Yakult', 15)
ON CONFLICT DO NOTHING;

-- Insert Other Drinks
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Pitcher', 'Refreshing pitcher drink.', 65, 'beverages', false, true, NULL),
  ('Lemon Cucumber', 'Fresh lemon cucumber drink.', 65, 'beverages', false, true, NULL),
  ('Lemon Iced Tea', 'Classic lemon iced tea.', 55, 'beverages', false, true, NULL),
  ('Bottled Soda', 'Various bottled soda options.', 35, 'beverages', false, true, NULL),
  ('Soda 1.5', 'Large 1.5L soda bottle.', 120, 'beverages', false, true, NULL),
  ('Bottled Water', 'Pure bottled water.', 30, 'beverages', false, true, NULL);
