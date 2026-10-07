BEGIN;

CREATE DOMAIN order_id_type AS numeric(9);
CREATE DOMAIN customer_id_type AS int;
CREATE DOMAIN restuarant_id_type AS int;
CREATE DOMAIN cuisine_code_type AS int;
CREATE DOMAIN district_code_type AS int;
CREATE DOMAIN courier_id_type AS int;
CREATE DOMAIN payment_code_type AS numeric(2);

CREATE DOMAIN phone_number_type AS varchar(20);

CREATE TABLE customers (
    customer_id customer_id_type,
    PRIMARY KEY (customer_id),
    customer_name varchar(20) NOT NULL,
    customer_phone phone_number_type
);

CREATE TABLE cuisines (
    cuisine_code cuisine_code_type,
    PRIMARY KEY (cuisine_code),
    cuisine_name varchar(20) NOT NULL
);

CREATE TABLE restuarants (
    restuarant_id restuarant_id_type,
    PRIMARY KEY (restuarant_id),
    restuarant_name varchar(100) NOT NULL,
    -- cuisine
    cuisine_code cuisine_code_type,
    FOREIGN KEY
    (cuisine_code)
    REFERENCES cuisines (cuisine_code)
);

CREATE TABLE districts (
    district_code district_code_type,
    PRIMARY KEY (district_code),
    district_name varchar(20) NOT NULL
);

CREATE TABLE couriers (
    courier_id courier_id_type,
    PRIMARY KEY (courier_id),
    courier_name varchar(20) NOT NULL,
    courier_phone phone_number_type
);

CREATE TABLE payments (
    payment_code payment_code_type,
    PRIMARY KEY (payment_code),
    payment_name varchar(20) NOT NULL
);

CREATE TABLE orders (
    order_id numeric(9),
    PRIMARY KEY (order_id),
    order_time timestamp NOT NULL,
    -- customer
    customer_id customer_id_type,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    delivery_addr varchar(100),
    -- restuarant
    restuarant_id restuarant_id_type,
    FOREIGN KEY(restuarant_id) REFERENCES restuarants(restuarant_id),
    -- district
    district_code district_code_type,
    FOREIGN KEY(district_code) REFERENCES districts(district_code),
    -- courier
    courier_id courier_id_type,
    FOREIGN KEY(courier_id) REFERENCES couriers(courier_id),
    -- payment
    payment_code payment_code_type,
    FOREIGN KEY(payment_code) REFERENCES payments(payment_code),
    -- other
    delivery_fee numeric(3,2) NOT NULL,
    items varchar(500) NOT NULL
);

COMMIT;
