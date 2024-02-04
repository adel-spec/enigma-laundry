-- Tabel Master: Customer
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

-- Tabel Master: Service
CREATE TABLE Service (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    unit_name VARCHAR(10) NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL
);

-- Tabel Transaksi: Transaction
CREATE TABLE Transaction (
    transaction_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    transaction_date DATE NOT NULL,
    received_by VARCHAR(255) NOT NULL,
    customer_id INT REFERENCES Customer(customer_id),
    total_price DECIMAL(10, 2) NOT NULL
);

-- Tambahkan kolom pickup_date ke tabel Transaction
ALTER TABLE Transaction ADD pickup_date DATE;


-- Menampilkan semua data transaksi beserta tanggal pengambilan
SELECT
    t.store_name,
    t.transaction_date,
    t.received_by,
    c.customer_name,
    c.phone_number,
    s.service_name,
    td.quantity,
    s.unit_name,
    td.total_price AS service_total_price,
    t.pickup_date
FROM
    Transaction t
JOIN
    Customer c ON t.customer_id = c.customer_id
JOIN
    TransactionDetail td ON t.transaction_id = td.transaction_id
JOIN
    Service s ON td.service_id = s.service_id;
