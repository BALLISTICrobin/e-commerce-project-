862 |          1 | 5048372714119100 | mastercard

          1 | Loleta    | Culligan | lculligan0@joomla.org | mX66(Nk@ | 276 854 8511  | 1998-01-28  | 5040411170
                    1 | TechImports         | 1234567890            | techimports@example.com     | tech1234
                    123456 | admin1@example.com
-- CREATE OR REPLACE FUNCTION cart_quantity_add() 
-- RETURNS TRIGGER AS $$
-- DECLARE
--     v_product_quantity INTEGER := 0;
-- BEGIN
--     -- Check if the product already exists in the cart
--     SELECT COALESCE(quantity, 0)
--     INTO v_product_quantity
--     FROM cart
--     WHERE productid = NEW.productid && CUSTOMERID = NEW.CUSTOMERID;
    
--     IF v_product_quantity > 0 THEN
--         -- If the product exists, update its quantity
--         UPDATE cart
--         SET quantity = NEW.quantity + v_product_quantity
--         WHERE productid = NEW.productid;
--     ELSE
--         -- If the product doesn't exist, insert it
--         RETURN NEW;
--     END IF;
    
--     RETURN NULL; -- Return NULL to prevent the original insertion from happening
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE OR REPLACE TRIGGER cart_quantity_add_trigger
-- BEFORE INSERT ON cart
-- FOR EACH ROW 
-- EXECUTE PROCEDURE cart_quantity_add();




-- CREATE OR REPLACE FUNCTION decrease_product_quantity()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     UPDATE product
--     SET ProductQuantity = ProductQuantity - OLD.Quantity
--     WHERE ProductId = OLD.ProductId;
    
--     RETURN OLD;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER set_product_quantity
-- AFTER DELETE ON cart
-- FOR EACH ROW
-- EXECUTE FUNCTION decrease_product_quantity();


-- //write a trigger before inserting on cart weather the product is out of stock or not
-- CREATE OR REPLACE FUNCTION check_product_quantity()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     IF NEW.quantity > (SELECT ProductQuantity FROM product WHERE ProductId = NEW.ProductId) THEN
--         RAISE EXCEPTION 'Product % is out of stock. Current stock: %, Requested quantity: %',
--             NEW.ProductId, COALESCE(current_stock, 0), NEW.Quantity;
--     END IF;
    
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER before_insert_cart
-- BEFORE INSERT or UPDATE ON cart
-- FOR EACH ROW
-- EXECUTE FUNCTION check_product_stock();



-----------------

CREATE OR REPLACE FUNCTION check_and_update_cart_quantity()
RETURNS TRIGGER AS $$
DECLARE
    v_product_quantity INTEGER := 0;
    current_stock INTEGER := 0;
BEGIN
    SELECT COALESCE(quantity, 0)
    INTO v_product_quantity
    FROM cart
    WHERE productid = NEW.productid AND customerid = NEW.customerid;
    SELECT COALESCE(ProductQuantity, 0)
    INTO current_stock
    FROM product
    WHERE ProductId = NEW.ProductId;

    -- Check if the product quantity is sufficient
    IF (NEW.quantity + v_product_quantity) > current_stock THEN
        RAISE EXCEPTION 'Product % is out of stock. Current stock: %, Requested quantity: %',
            NEW.ProductId, current_stock, (NEW.quantity + v_product_quantity);
    END IF;
IF EXISTS (SELECT * FROM cart WHERE productid = NEW.productid AND customerid = NEW.customerid) THEN
    -- If the product exists, update its quantity
    UPDATE cart
    SET quantity = NEW.quantity + v_product_quantity
    WHERE productid = NEW.productid AND customerid = NEW.customerid;

    -- Return NULL to prevent the original insertion from happening
    RETURN NULL;
ELSE
    -- Check if the product quantity is sufficient before inserting
    IF (NEW.quantity) > current_stock THEN
        RAISE EXCEPTION 'Product % is out of stock. Current stock: %, Requested quantity: %',
            NEW.ProductId, current_stock, NEW.Quantity;
    END IF;

    -- If the product doesn't exist and quantity is sufficient, insert it
    RETURN NEW;
END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_update_cart_quantity
BEFORE INSERT ON cart
FOR EACH ROW
EXECUTE FUNCTION check_and_update_cart_quantity();


--bdorrian15@wufoo.com                | tK72*Z`


---update product quantity
CREATE OR REPLACE FUNCTION update_product_quantity(product_ID IN BIGINT, CART_QUANTITY IN INT) RETURNS VOID AS
$$
DECLARE
    OLD_QUANTITY INT;
BEGIN
    SELECT ProductQuantity INTO OLD_QUANTITY FROM product WHERE ProductId = product_ID;
    OLD_QUANTITY := OLD_QUANTITY - CART_QUANTITY;
    
    IF OLD_QUANTITY < 0 THEN
        RAISE EXCEPTION 'Invalid quantity. Cannot have negative product quantity.';
    END IF;

    UPDATE product SET ProductQuantity = OLD_QUANTITY WHERE ProductId = product_ID;
END;
$$ LANGUAGE plpgsql;


-- CREATE OR REPLACE TRIGGER DELETE_ON_CART
-- BEFORE INSERT ON order_status
-- FOR EACH ROW

-- DECALARE

-- BEGIN
--     update_product_quantity(:NEW.PRODUCTID,:NEW.QUANTITY);
--     DELETE FROM CART WHERE CUSTOMERID = :NEW.CUSTOMERID AND PRODUCTID = :NEW.PRODUCTID;
-- END;


-- CREATE OR REPLACE PROCEDURE INSERT_ORDER_STATUS(USERID IN NUMBER,NAME IN VARCHAR, EMAIL IN VARCHAR,ADDRESS IN VARCHAR) IS

-- BEGIN
-- FOR R IN (SELECT * FROM CART WHERE CUSTOIMERID = USERID)
-- LOOP
--     INSERT INTO ORDER_STATUS VALUES(USERID,R.PRODUCTID,CURRENT_DATE,CURRENT_DATE+7,"PENDING",ADDRESS,NAME, EMAIL,R.QUANTITY,((R.PRODUCTQUANTITY*R.PRICE)-(R.PRODUCTQUANTITY*R.PRICE)*R.DISCOUNTOFFER/100))
-- END LOOP;

-- END;


-- --order status table
-- CREATE TABLE order_status (
--     OrderStatusId BIGSERIAL PRIMARY KEY,
--     CustomerId BIGINT NOT NULL,
--     ProductId BIGINT NOT NULL,
--     Quantity INT NOT NULL,
--     TotalPrice DECIMAL(10,2) NOT NULL,
--     OrderPlacedDate DATE NOT NULL,
--     ADDRESS VARCHAR(100) NOT NULL,
--     OrderDeliveredDate DATE NOT NULL,
--     OrderStatus VARCHAR(100) NOT NULL,
--     NAME VARCHAR(50) NOT NULL,
--     EMAIL VARCHAR(50) NOT NULL,
--     FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
--     FOREIGN KEY (ProductId) REFERENCES product(ProductId)
-- );

CREATE OR REPLACE FUNCTION update_product_quantity(product_ID IN BIGINT, CART_QUANTITY IN INT) RETURNS VOID AS
$$
DECLARE
    OLD_QUANTITY INT;
BEGIN
    SELECT ProductQuantity INTO OLD_QUANTITY FROM product WHERE ProductId = product_ID;
    OLD_QUANTITY := OLD_QUANTITY - CART_QUANTITY;
    
    IF OLD_QUANTITY < 0 THEN
        RAISE EXCEPTION 'Invalid quantity. Cannot have negative product quantity.';
    END IF;

    UPDATE product SET ProductQuantity = OLD_QUANTITY WHERE ProductId = product_ID;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION insert_order_status(USERID IN BIGINT, NAME IN VARCHAR(50), EMAIL IN VARCHAR(50), ADDRESS IN VARCHAR(100)) RETURNS VOID AS
$$
DECLARE
    cart_row RECORD;
BEGIN
    FOR cart_row IN (SELECT * FROM CART C JOIN PRODUCT P ON P.PRODUCTID=C.PRODUCTID  WHERE CUSTOMERID = USERID)
    LOOP
        INSERT INTO order_status (CustomerId, ProductId, Quantity, TOTAL_PRICE, OrderPlacedDate, ADDRESS, OrderDeliveredDate, OrderStatus, NAME, EMAIL)
        VALUES (USERID, cart_row.ProductId, cart_row.Quantity, (
        (cart_row.Quantity * cart_row.Price) - 
        COALESCE(cart_row.Quantity * cart_row.Price * COALESCE(cart_row.DiscountOffer, 0) / 100, 0)
    ),
                CURRENT_DATE, ADDRESS, CURRENT_DATE + 7, 'PENDING', NAME, EMAIL);
    END LOOP;
    
    
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION delete_on_cart() RETURNS TRIGGER AS
$$
BEGIN
    PERFORM update_product_quantity(NEW.ProductId, NEW.Quantity);
    DELETE FROM CART WHERE CUSTOMERID = NEW.CustomerId AND PRODUCTID = NEW.ProductId;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER delete_on_cart_trigger
AFTER INSERT ON order_status
FOR EACH ROW
EXECUTE FUNCTION delete_on_cart();


CREATE OR REPLACE FUNCTION CHECK_CREDIT_CARD(CREDIT_CARD_TYPE IN VARCHAR(100), CREDIT_CARD_NUMBER IN VARCHAR(100), USERID IN BIGINT) RETURNS BOOLEAN AS
$$
DECLARE
    CREDIT_CARD_COUNT INT;
BEGIN
    SELECT COUNT(*) INTO CREDIT_CARD_COUNT FROM CUSTOMER_PAYMENT WHERE UPPER(CreditCardType) = UPPER(CREDIT_CARD_TYPE) 
    AND CreditCardNumber = CREDIT_CARD_NUMBER AND CustomerId = USERID;
    
    -- Use RAISE NOTICE to print information
    RAISE NOTICE 'CREDIT_CARD_COUNT: %, CREDIT_CARD_TYPE: %, CREDIT_CARD_NUMBER: %, USERID: %', CREDIT_CARD_COUNT, CREDIT_CARD_TYPE, CREDIT_CARD_NUMBER, USERID;
    
    IF CREDIT_CARD_COUNT = 0 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION delete_review_function()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM review WHERE productid = OLD.productid;
    RETURN OLD; -- This is required for a BEFORE DELETE trigger
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER delete_review
BEFORE DELETE ON product
FOR EACH ROW
EXECUTE FUNCTION delete_review_function();



-- create or replace trigger update_order_history
-- after update on order_status
-- OF OrderStatus
-- for each row
-- BEGIN
--     IF :NEW.OrderStatus = 'Accepted' THEN
--         INSERT INTO order_history (OrderId, CustomerId)
--         VALUES (:NEW.OrderStatusId, :NEW.CustomerId);

--     END IF;
-- END;
-- end;


CREATE OR REPLACE FUNCTION update_order_history()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.OrderStatus = 'ACCEPTED' THEN
        INSERT INTO order_history (OrderId, CustomerId)
        VALUES (NEW.OrderStatusId, NEW.CustomerId);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_order_history
AFTER UPDATE ON order_status
FOR EACH ROW
EXECUTE FUNCTION update_order_history();

CREATE OR REPLACE FUNCTION delete_from_update_inventory(productid bigint) 
RETURNS VOID AS $$
BEGIN
    EXECUTE 'DELETE FROM update_inventory WHERE productid = $1' USING productid;
END;
$$ LANGUAGE plpgsql;


-- CREATE OR REPLACE FUNCTION delete_proposed_product_and_delete_price_offer() 
-- RETURNS TRIGGER AS $$
-- BEGIN
--     DELETE FROM price_offer WHERE proposed_productid = (select proposed_productid from proposed_product where productname = NEW.productname);
--     DELETE FROM proposed_product WHERE productname = NEW.productname;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE OR REPLACE TRIGGER delete_proposed_product_and_delete_price_offer_trigger
-- AFTER INSERT ON product
-- FOR EACH ROW
-- EXECUTE FUNCTION delete_proposed_product_and_delete_price_offer();


CREATE OR REPLACE FUNCTION delete_proposed_product_and_delete_price_offer() 
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM price_offer WHERE proposed_productid IN 
(SELECT proposed_productid FROM proposed_product WHERE productname = NEW.productname);
    DELETE FROM proposed_product WHERE productname = NEW.productname;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER delete_proposed_product_and_delete_price_offer_trigger
AFTER INSERT ON product
FOR EACH ROW
EXECUTE FUNCTION delete_proposed_product_and_delete_price_offer();


//populate review table
CREATE OR REPLACE PROCEDURE populate_reviews()
LANGUAGE plpgsql
AS $$
DECLARE
    customer_ids INT[];
    product_ids INT[];
    i INT;
    customer_id INT;
    product_id INT;
    comment_text TEXT;
    rating FLOAT;
BEGIN
    -- Generate an array of unique customer IDs
    SELECT ARRAY(SELECT CustomerId FROM customer ORDER BY random()) INTO customer_ids;
    
    -- Generate an array of product IDs
    SELECT ARRAY(SELECT ProductId FROM product) INTO product_ids;
    
    -- Iterate over each product
    FOR i IN 1..450 LOOP
        product_id := product_ids[i];
        
        -- Iterate over each customer
        FOREACH customer_id IN ARRAY customer_ids LOOP
            -- Generate a random comment and rating
            comment_text := CASE (random() * 5)::INT
                            WHEN 0 THEN 'Great product!'
                            WHEN 1 THEN 'Excellent service!'
                            WHEN 2 THEN 'Highly recommended!'
                            WHEN 3 THEN 'Could be better.'
                            ELSE 'Average product.'  -- Default value when no match is found
                            END;
            rating := round(cast((random() * 4 + 1) as numeric), 1);  -- Random rating between 1 and 5
            
            -- Insert the review into the database
            INSERT INTO review (CustomerId, ProductId, Review, Rating)
            VALUES (customer_id, product_id, COALESCE(comment_text, 'Average product.'), rating); -- Use COALESCE to provide a default value
        END LOOP;
    END LOOP;
END;
$$;

-- Execute the stored procedure to populate the reviews
CALL populate_reviews();

