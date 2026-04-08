-- BASE DE DATOS FRANCISCO RIVAS MORALES

CREATE DATABASE BaseDatos;
USE BaseDatos;

-- Creando tablas
CREATE TABLE usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    saldo DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(5) NOT NULL
);

CREATE TABLE transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    currency_id INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES moneda(currency_id)
);

-- Internando datos
INSERT INTO moneda (currency_name, currency_symbol) VALUES
('Peso Chileno', 'CLP'),
('Dólar Americano', 'USD'),
('Euro', 'EUR');

SELECT * FROM moneda;

INSERT INTO usuario (nombre, email, saldo) VALUES
('Ana Pérez', 'ana@email.com', 150000.00),
('Luis Gómez', 'luis@email.com', 80000.00),
('Carlos López', 'carlos@email.com', 200000.00);

SELECT * FROM usuario;

INSERT INTO transaccion (sender_user_id, receiver_user_id, currency_id, importe) VALUES
(1, 2, 1, 25000.00),
(2, 3, 1, 15000.00);

INSERT INTO transaccion (sender_user_id, receiver_user_id, currency_id, importe) VALUES
(3, 1, 1, 40000.00),
(1, 3, 1, 12000.00);

SELECT * FROM transaccion;

-- CONSULTA
SELECT * FROM usuario WHERE user_id = 2;

