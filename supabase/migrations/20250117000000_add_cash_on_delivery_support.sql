/*
  # Add Cash on Delivery Support
  
  Make payment method fields nullable to support cash on delivery
  which doesn't require account number, account name, or QR code
*/

-- Make account_number nullable
ALTER TABLE payment_methods 
  ALTER COLUMN account_number DROP NOT NULL;

-- Make account_name nullable
ALTER TABLE payment_methods 
  ALTER COLUMN account_name DROP NOT NULL;

-- Make qr_code_url nullable
ALTER TABLE payment_methods 
  ALTER COLUMN qr_code_url DROP NOT NULL;

-- Insert cash on delivery payment method if it doesn't exist
INSERT INTO payment_methods (id, name, account_number, account_name, qr_code_url, sort_order, active) VALUES
  ('cash-on-delivery', 'Cash on Delivery', NULL, NULL, NULL, 0, true)
ON CONFLICT (id) DO NOTHING;

