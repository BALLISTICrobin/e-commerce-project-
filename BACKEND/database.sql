CREATE TABLE product (
    ProductId BIGSERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    BrandName VARCHAR(50) NOT NULL,
    ProductQuantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Specification TEXT NOT NULL,
    Rating FLOAT NOT NULL,
    DiscountOffer DECIMAL(5, 2),
    SubCategoryId BIGINT NOT NULL,
    ImporterId BIGINT NOT NULL,
    
);



--admin table
-- Create the admin table
CREATE TABLE admin (
    AdminId BIGSERIAL PRIMARY KEY,
    Pin VARCHAR(100) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL
);

-- customer table
CREATE TABLE customer (
    CustomerId BIGSERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Pin VARCHAR(100) NOT NULL UNIQUE,
    ContactNumber varchar NOT NULL,
    DateOfBirth DATE NOT NULL,
    NID varchar NOT NULL
);

-- address table
CREATE TABLE address (
    AddressId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId)
);

--product category table
CREATE TABLE product_category (
    CategoryId BIGSERIAL PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);
--subcategories table
CREATE TABLE product_subcategory(
    SubCategoryId BIGSERIAL PRIMARY KEY,
    SubCategoryName VARCHAR(50) UNIQUE NOT NULL,
    CategoryId BIGINT NOT NULL,
    productlink VARCHAR(255),
    FOREIGN KEY (CategoryId) REFERENCES product_category(CategoryId)
);

--importer table
CREATE TABLE importer (
    ImporterId BIGSERIAL PRIMARY KEY,
    --ImporterName VARCHAR(100) NOT NULL,
    ImporterAgencyName VARCHAR(100) NOT NULL,
    ImporterContactNumber VARCHAR(20) NOT NULL UNIQUE,
    ImporterEmail VARCHAR(100) NOT NULL UNIQUE,
    ImporterPin VARCHAR(100) NOT NULL UNIQUE
);

--PRODUCT TABLE
CREATE TABLE product (
    ProductId BIGSERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    BrandName VARCHAR(50) NOT NULL,
    ProductQuantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Specification TEXT NOT NULL,
    Rating FLOAT NOT NULL,
    DiscountOffer DECIMAL(5, 2),
    SubCategoryId BIGINT NOT NULL,
    ImporterId BIGINT NOT NULL,
    FOREIGN KEY (SubCategoryId) REFERENCES product_subcategory(SubCategoryId),
    FOREIGN KEY (ImporterId) REFERENCES importer(ImporterId)
);

--review table
CREATE TABLE review (
    ReviewId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    Review TEXT NOT NULL,
    Rating FLOAT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
    FOREIGN KEY (ProductId) REFERENCES product(ProductId)
);

--cart table
CREATE TABLE cart (
    CartId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
    FOREIGN KEY (ProductId) REFERENCES product(ProductId)
);

--customer payment
CREATE TABLE customer_payment (
    PaymentId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    CreditCardNumber VARCHAR(100) NOT NULL,
    CreditCardType VARCHAR(100) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId)

     );

--order status table
CREATE TABLE order_status (
    OrderStatusId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    QUANTITY INT NOT NULL,
    TOTAL_PRICE DECIMAL(10,2) NOT NULL;
    OrderPlacedDate DATE NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    OrderDeliveredDate DATE NOT NULL,
    OrderStatus VARCHAR(100) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
     EMAIL VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
    FOREIGN KEY (ProductId) REFERENCES product(ProductId)
);

--order history table
CREATE TABLE order_history (
    OrderHistoryId BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    OrderId BIGINT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
    FOREIGN KEY (OrderId) REFERENCES order_status(OrderStatusId)
);

CREATE TABLE UPDATE_INVENTORY(
    UpdateInventoryId BIGSERIAL PRIMARY KEY,
    ProductId BIGINT NOT NULL,
    AskedProductQuantity BIGINT NOT NULL,
    ImporterId BIGINT NOT NULL,
    FOREIGN KEY (ImporterId) REFERENCES importer(ImporterId),
    FOREIGN KEY (ProductId) REFERENCES product(ProductId)
);

CREATE TABLE PROPOSED_PRODUCT(
    PROPOSED_PRODUCTID BIGSERIAL PRIMARY KEY,
    categoryname varchar(100) NOT NULL,
    subcategoryname varchar(50) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    BrandName VARCHAR(50) NOT NULL,
    ProductQuantity INT NOT NULL,
    Specification TEXT NOT NULL,
    proposedprice bigint not null
    FOREIGN KEY (subcategoryname) REFERENCES product_subcategory(SubCategoryName)
);

CREATE TABLE PRICE_OFFER(
    PRICE_OFFERID BIGSERIAL PRIMARY KEY,
    proposed_ProductId BIGINT NOT NULL,
    OfferedPrice DECIMAL(10, 2) NOT NULL,
    ImporterId BIGINT NOT NULL,
    Rating FLOAT NOT NULL,
    DiscountOffer DECIMAL(5, 2),
    FOREIGN KEY (ImporterId) REFERENCES importer(ImporterId),
    FOREIGN KEY (proposed_ProductId) REFERENCES PROPOSED_PRODUCT(PROPOSED_PRODUCTID)
);

create table customer_request(
    requestid serial primary key,
    productid bigint not null,
    quantity int not null,
    FOREIGN KEY (productid) REFERENCES product(productid),

);
--alter the datatype contact number and nid of customer table and make them integer type
-- ALTER TABLE customer
-- ALTER COLUMN ContactNumber TYPE INTEGER USING ContactNumber::integer;

-- --
-- ALTER TABLE customer
-- ALTER COLUMN NID TYPE VARCHAR(20),
-- COLUMN ContactNumber TYPE VARCHAR(20);

-- --
-- ALTER TABLE address
-- DROP COLUMN Address;


INSERT INTO admin (Pin, Email)
VALUES
  ('123456', 'admin1@example.com'),
  ('567890', 'admin2@example.com'),
  ('987654', 'admin3@example.com');



  




SELECT p.productname,p.importerid,p.categoryname,p.subcategoryname,p.brandname,p.productquantity,p.specification
FROM 
    proposed_Product p
JOIN 
    (
        SELECT proposed_productid, MIN(offered_price) AS min_price
        FROM  offer_price 
        GROUP BY proposed_productid
    ) 
    AS min_prices
ON 
    p.proposed_productid = min_prices.proposed_productid;