const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
// import express, { json } from "express";
// const app = express();
// import cors from "cors";
// import { connect, query,pool } from "./db";
//middleware
app.use(cors());
app.use(express.json());



app.post('/', async (req, res) => {
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        const { firstName, lastName, contactNumber, dob, nid, city, state, zipCode, country, creditCardNumber, creditCardType, email, password } = req.body;

        // Insert into the customer table
        const registerQuery = `INSERT INTO customer (FirstName, LastName, ContactNumber, DateOfBirth, NID, Email, Pin) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING CustomerId`;
        const register = await client.query(registerQuery, [
            firstName,
            lastName,
            contactNumber,
            dob,
            nid,
            email,
            password
        ]);

        // Retrieve the last inserted CustomerId
        const customerId = register.rows[0].customerid;

        // Insert into the address table using the retrieved CustomerId
        const registerQueryAddress = `INSERT INTO address (CustomerId, City, State, ZipCode, Country) VALUES ($1, $2, $3, $4, $5)`;
        await client.query(registerQueryAddress, [customerId, city, state, zipCode, country]);

        // Insert into the customer_payment table using the retrieved CustomerId
        const registerQueryPayment = `INSERT INTO customer_payment (CustomerId, CreditCardNumber, CreditCardType) VALUES ($1, $2, $3)`;
        await client.query(registerQueryPayment, [customerId, creditCardNumber, creditCardType]);

        await client.query('COMMIT');

        res.status(200).json({ message: "Registered successfully" });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error(err.message);
        res.status(500).json({ error: "Internal Server Error" });
    } finally {
        client.release();
    }
});

app.post('/login', async (req, res) => {
    const connection = await pool.connect();
    try {
        const { email, password } = req.body;
        const getInfoQuery = `SELECT * FROM customer C 
                                LEFT JOIN ADDRESS A ON c.customerid = a.customerid
                              LEFT JOIN CUSTOMER_PAYMENT P ON c.customerid = p.customerid
                              WHERE c.email = $1 AND c.pin = $2`;

        const getInfoQueryAdmin = `SELECT * FROM admin WHERE email = $1 AND pin = $2`;
        const getInfoQueryImporter = `SELECT * FROM importer WHERE importeremail = $1 AND importerpin = $2`;
        const resultAdmin = await connection.query(getInfoQueryAdmin, [email, password]);
        const resultImporter = await connection.query(getInfoQueryImporter, [email, password]);
        const result = await connection.query(getInfoQuery, [email, password]);
        if (resultAdmin.rows.length > 0) {
            const admin = resultAdmin.rows[0];
            res.status(200).json({
                stat: 'admin',
                message: 'Login successful',
                user:
                {
                    'id': admin.adminid,
                    'email': admin.email
                }
            });
            return;
        }

        else if (resultImporter.rows.length > 0) {
            const importer = resultImporter.rows[0];
            res.status(200).json({
                stat: 'importer',
                message: 'Login successful',
                user:
                {
                    'id': importer.importerid,
                    'agencyName': importer.importeragencyname,
                    'email': importer.email
                }
            });
            return;
        }
        else if (result.rows.length > 0) {
            //console.log(result.rows);
            const user = result.rows[0];
            // console.log(user);

            res.status(200).json({
                stat: 'customer',
                message: 'Login successful',
                user:
                {
                    'id': user.customerid,
                    'firstName': user.firstname,
                    'lastName': user.lastname,
                    'contactNumber': user.contactnumber,
                    'dob': user.dateofbirth,
                    'nid': user.nid,
                    'city': user.city,
                    'state': user.state,
                    'zipCode': user.zipcode,
                    'country': user.country,
                    'creditCardNumber': user.creditcardnumber,
                    'creditCardType': user.creditcardtype,
                    'email': user.email
                }
            });
            return;
        }
        else {
            // No user found
            res.status(401).json({ message: 'Invalid email or password' });
            return;
        }

    } catch (error) {
        console.error(error.message);
        res.status(500).json({ message: 'Internal server error' });
    } finally {
        connection.release();
    }
});


//post-->>add something in database
// app.post('/addProduct', async (req, res) => {
//     try {
//         const { description } = req.body;
//         const info = description.split(",");

//         // Destructure the array values 
//         const [
//             productName,
//             brandName,
//             productQuantity,
//             price,
//             specification,
//             rating,
//             discountOffer
//         ] = info;

//         const addProductQuery = `
//             INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer)
//             VALUES ($1, $2, $3, $4, $5, $6, $7)
//         `;

//         // Execute the query with parameterized values
//         const add = await pool.query(addProductQuery, [
//             productName,
//             brandName,
//             parseInt(productQuantity),
//             parseFloat(price),
//             specification,
//             parseFloat(rating),
//             parseFloat(discountOffer)
//         ]);

//         res.status(200).json({ message: "Product added successfully" });
//     } catch (err) {
//         console.error(err.message);
//         res.status(500).json({ error: "Internal Server Error" });
//     }
// });

app.post('/getProduct', async (req, res) => {
    const { productCat, productSubCat, minprice, maxprice, minrating, maxrating } = req.body;
    let getProductQuery;
    if (productCat === '' || productSubCat === '') {
        // res.status(400).json({message: "Please fill all the fields"});
        getProductQuery = `SELECT *
        FROM PRODUCT_CATEGORY C
        LEFT JOIN PRODUCT_SUBCATEGORY S ON C.CATEGORYID = S.CATEGORYID
        LEFT JOIN PRODUCT P ON P.SUBCATEGORYID = S.SUBCATEGORYID
                    WHERE P.PRICE BETWEEN $1 AND $2
                    AND P.RATING BETWEEN $3 AND $4`;
        try {
            const seeAllGadgets = await pool.query(getProductQuery, [minprice, maxprice, minrating, maxrating]);
            res.status(200).json(seeAllGadgets.rows);
        } catch (error) {
            console.error(error.message);
        }
    }
    else {
        getProductQuery = `SELECT *
    FROM PRODUCT_CATEGORY C
    LEFT JOIN PRODUCT_SUBCATEGORY S ON C.CATEGORYID = S.CATEGORYID
    LEFT JOIN PRODUCT P ON P.SUBCATEGORYID = S.SUBCATEGORYID
    WHERE C.CATEGORYNAME = $1
      AND S.SUBCATEGORYNAME = $2
      AND P.PRICE BETWEEN $3 AND $4
      AND P.RATING BETWEEN $5 AND $6;
    `;
        try {
            const seeAllGadgets = await pool.query(getProductQuery, [productCat, productSubCat, minprice, maxprice, minrating, maxrating]);
            res.status(200).json(seeAllGadgets.rows);
        } catch (error) {
            console.error(error.message);
        }

    }


})

app.post('/getReview', async (req, res) => {
    const { id } = req.body;
    const getReviewQuery = `SELECT C.CUSTOMERID, C.FIRSTNAME, R.REVIEW,R.RATING,P.PRODUCTID FROM REVIEW R
    LEFT JOIN CUSTOMER C ON R.CUSTOMERID = C.CUSTOMERID
    LEFT JOIN PRODUCT P ON P.PRODUCTID = R.PRODUCTID
    WHERE P.PRODUCTNAME = $1`;
    try {
        const review = await pool.query(getReviewQuery, [id]);
        res.status(200).json(review.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/getProductInfo', async (req, res) => {
    const { id } = req.body;
    const getProductInfoQuery = `SELECT * FROM PRODUCT_CATEGORY C
    LEFT JOIN PRODUCT_SUBCATEGORY S ON C.CATEGORYID = S.CATEGORYID
    LEFT JOIN PRODUCT P ON P.SUBCATEGORYID = S.SUBCATEGORYID WHERE P.PRODUCTNAME = $1`;
    try {
        const productInfo = await pool.query(getProductInfoQuery, [id]);
        res.status(200).json(productInfo.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);


app.post('/submitReview', async (req, res) => {
    const { userId, productid, review, Rating } = req.body;
    const submitReviewQuery = `INSERT INTO REVIEW (CUSTOMERID, PRODUCTID, REVIEW, RATING) VALUES ($1, $2, $3, $4)`;
    const getProductRatingQuery = `SELECT Rating FROM product WHERE ProductId = $1`;
    const updateRatingQuery = `UPDATE PRODUCT SET RATING = $1 WHERE PRODUCTID = $2`;

    try {
        // Insert the review into the review table
        await pool.query(submitReviewQuery, [userId, productid, review, Rating]);

        // Fetch the current rating of the product
        const { rows } = await pool.query(getProductRatingQuery, [productid]);
        const currentRating = parseFloat(rows[0].rating);

        // Check if both Rating and currentRating are valid numbers
        if (!isNaN(Rating) && !isNaN(currentRating)) {
            // Parse Rating to float
            const parsedRating = parseFloat(Rating);

            // Calculate the new rating based on the submitted review
            const newRating = (currentRating + parsedRating) / 2;

            // Update the product rating
            await pool.query(updateRatingQuery, [newRating, productid]);

            res.status(200).json({ message: "Review submitted successfully" });
        } else {
            res.status(400).json({ error: "Invalid Rating or currentRating value" });
        }
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: "An error occurred while submitting the review" });
    }
});


// app.post('/editReview', async (req, res) => {
//     const { userId, productid, review, Rating } = req.body;
//     const editReviewQuery = `UPDATE REVIEW SET REVIEW = $3, RATING = $4 WHERE CUSTOMERID = $1 AND PRODUCTID = $2`;
//     try {
//         const edit = await pool.query(editReviewQuery, [userId, productid, review, Rating]);
//         res.status(200).json({ message: "Review edited successfully" });
//     } catch (error) {
//         console.error(error.message);
//     }
// }
// );

app.post('/addToCart', async (req, res) => {
    const { userId, productid, quantity } = req.body;
    console.log(req.body);
    const addToCartQuery = `
    INSERT INTO cart (customerid, productid, quantity)
    VALUES ($1, $2, $3)`;
    try {
        const add = await pool.query(addToCartQuery, [userId, productid, quantity]);
        res.status(200).json({ message: "Added to cart successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
        console.error(error.message);
    }
}
);

app.post('/getCart', async (req, res) => {
    const { userId } = req.body;
    const getCartQuery = `SELECT P.PRODUCTID, P.PRODUCTNAME, P.PRICE, C.QUANTITY, COALESCE(P.DiscountOffer,0) as discountoffer FROM CART C
    LEFT JOIN PRODUCT P ON C.PRODUCTID = P.PRODUCTID
    WHERE C.CUSTOMERID = $1`;
    try {
        const cart = await pool.query(getCartQuery, [userId]);
        res.status(200).json(cart.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);


app.post('/updateCart', async (req, res) => {
    const { userId, productid, quantity } = req.body;
    const updateCartQuery = `UPDATE CART SET QUANTITY = $3 WHERE CUSTOMERID = $1 AND PRODUCTID = $2`;
    try {
        const update = await pool.query(updateCartQuery, [userId, productid, quantity]);
        res.status(200).json({ message: "Cart updated successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/rmvFromCart', async (req, res) => {
    const { userId, productid } = req.body;
    const rmvFromCartQuery = `DELETE FROM CART WHERE CUSTOMERID = $1 AND PRODUCTID = $2`;
    try {
        const remove = await pool.query(rmvFromCartQuery, [userId, productid]);
        res.status(200).json({ message: "Removed from cart successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/getTotalItem', async (req, res) => {
    const getTotalItemQuery = `SELECT COUNT(*) as count FROM CART
    WHERE CUSTOMERID = $1`;
    try {
        const totalItem = await pool.query(getTotalItemQuery, [req.body.customerid]);
        console.log(totalItem.rows);
        res.status(200).json(totalItem.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/getSuggestions', async (req, res) => {

    const { subcategoryid } = req.body;
    const getSuggestionsQuery = `SELECT * FROM PRODUCT_CATEGORY C
    LEFT JOIN PRODUCT_SUBCATEGORY S ON C.CATEGORYID = S.CATEGORYID
    LEFT JOIN PRODUCT P ON P.SUBCATEGORYID = S.SUBCATEGORYID WHERE P.SUBCATEGORYID = $1`;
    try {
        const suggestions = await pool.query(getSuggestionsQuery, [subcategoryid]);
        console.log(suggestions.rows);
        res.status(200).json(suggestions.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/checkValidity', async (req, res) => {
    const { customerid, creditCardType, CreditCardNumber } = req.body;
    console.log(req.body);
    // Use a parameterized query to call the function with explicit casting
    const checkQuery = {
        text: 'SELECT CHECK_CREDIT_CARD($1::varchar, $2::varchar, $3::bigint) as validity',
        values: [creditCardType, CreditCardNumber, BigInt(customerid)]
    };
    let isValid = true;
    try {
        // Execute the parameterized query
        const result = await pool.query(checkQuery);

        // Retrieve the result of the function call
        isValid = result.rows[0].validity;

        // Return the result as JSON
        res.status(200).json({ isValid });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});



app.post('/placeOrder', async (req, res) => {
    const { customerid, RecipientName, Email, Address } = req.body;
    console.log(req.body);
    const placeOrderQuery = {
        text: 'SELECT insert_order_status($1::bigint, $2::varchar, $3::varchar, $4::varchar)',
        values: [BigInt(customerid), RecipientName, Email, Address]

    };
    try {
        const result = await pool.query(placeOrderQuery);
        // const message = result.rows[0].message;
        res.status(200).json({ message: "Order placed successfully" });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

);
app.get('/getOrderStatusAdmin', async (req, res) => {
    const getOrderStatusAdminQuery = `SELECT * FROM ORDER_STATUS JOIN PRODUCT ON ORDER_STATUS.PRODUCTID = PRODUCT.PRODUCTID where orderstatus = 'PENDING'`;
    try {
        const orderStatusAdmin = await pool.query(getOrderStatusAdminQuery);
        res.status(200).json(orderStatusAdmin.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);
app.post('/acceptOrder', async (req, res) => {
    const { orderstatusid } = req.body;
    console.log(orderstatusid);
    const acceptOrderQuery = `UPDATE order_status SET OrderStatus = 'ACCEPTED' WHERE OrderStatusId = $1`;
    try {
        const acceptOrder = await pool.query(acceptOrderQuery, [orderstatusid]);
        res.status(200).json({ message: "Order accepted successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);


app.post('/getOrderStatus', async (req, res) => {
    const { customerid } = req.body;
    //   console.log(orderstatusid);
    const getOrderStatusQuery = `SELECT * FROM ORDER_STATUS JOIN PRODUCT ON ORDER_STATUS.PRODUCTID = PRODUCT.PRODUCTID
     WHERE CUSTOMERID = $1 AND ORDERSTATUS = 'PENDING'`;
    try {
        const orderStatus = await pool.query(getOrderStatusQuery, [customerid]);
        res.status(200).json(orderStatus.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);


app.post('/getOrderHistoryCustomer', async (req, res) => {
    const { customerid } = req.body;
    const getOrderHistoryQuery = `SELECT * FROM ORDER_HISTORY JOIN order_status 
    ON ORDER_HISTORY.orderid = order_status.orderstatusid 
    join product on product.productid=order_status.productid where order_status.orderstatus='ACCEPTED' 
    and order_history.customerid=$1`;
    try {
        const orderHistory = await pool.query(getOrderHistoryQuery, [customerid]);
        res.status(200).json(orderHistory.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/search', async (req, res) => {
    let { search } = req.body;
    console.log(search);
    let x = '%';
    for (let i = 0; i < search.length; i++) {
        x += search[i];
        x += '%';
    }
    const searchProductQuery = `(SELECT * FROM PRODUCT join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid WHERE Productname ILIKE $1) 
    union (select * from product join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid where specification ILIKE $1)`;
    try {
        const searchProduct = await pool.query(searchProductQuery, [x]);
        res.status(200).json(searchProduct.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/deleteProduct', async (req, res) => {
    const { productid } = req.body;
    console.log(req.body);
    const deleteProductQuery = `DELETE FROM PRODUCT WHERE PRODUCTID = $1`;
    try {
        const deleteProduct = await pool.query(deleteProductQuery, [productid]);
        res.status(200).json({ message: "Product deleted successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);


app.get('/getOrderHistory', async (req, res) => {
    const getOrderHistoryQuery = `SELECT * FROM ORDER_HISTORY JOIN order_status 
    ON ORDER_HISTORY.orderid = order_status.orderstatusid 
    join product on product.productid=order_status.productid where order_status.orderstatus='ACCEPTED'`;
    try {
        const orderHistory = await pool.query(getOrderHistoryQuery);
        res.status(200).json(orderHistory.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.get('/getInventory', async (req, res) => {
    const getInventoryQuery = `SELECT * FROM product join importer on product.importerid=importer.importerid 
    join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid order by productid asc`;
    try {
        const inventory = await pool.query(getInventoryQuery);
        res.status(200).json(inventory.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/updateInventory', async (req, res) => {
    const { productid, quantity, importerid } = req.body;
    const updateInventoryQuery = `insert into UPDATE_INVENTORY (PRODUCTID, ASKEDPRODUCTQUANTITY, IMPORTERID) VALUES ($1, $2, $3)`;
    try {
        const updateInventory = await pool.query(updateInventoryQuery, [productid, quantity, importerid]);
        res.status(200).json({ message: "request sent successfully successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/filterInventory', async (req, res) => {
    const { minStock, maxStock } = req.body;
    const filterInventoryQuery = `SELECT * FROM product join importer on product.importerid=importer.importerid 
join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid 
where product.productquantity between $1 and $2
order by productid asc`;
    try {
        const inventory = await pool.query(filterInventoryQuery, [minStock, maxStock]);
        res.status(200).json(inventory.rows);
    }
    catch (error) {
        console.error(error.message);
    }
}
);

app.post('/launchNewProduct', async (req, res) => {
    const { productName, brandName, specification, selectedCategory, selectedSubcategory, productQuantity, proposedPrice } = req.body;
    const insertProposedProductQuery = `INSERT INTO proposed_product ( productname, brandname, productquantity, proposedprice, specification, categoryname, subcategoryname) VALUES ($1, $2, $3, $4, $5, $6, $7)`;
    try {
        const insertProposedProduct = await pool.query(insertProposedProductQuery, [productName, brandName, productQuantity, proposedPrice, specification, selectedCategory, selectedSubcategory]);
        res.status(200).json({ message: "Product requested successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/getUpdateInventory', async (req, res) => {
    const { importerid } = req.body;
    const getUpdateInventoryQuery = `SELECT * FROM update_inventory join product on update_inventory.productid=product.productid where update_inventory.importerid=$1`;
    try {
        const updateInventory = await pool.query(getUpdateInventoryQuery, [importerid]);
        res.status(200).json(updateInventory.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/acceptUpdateInventory', async (req, res) => {
    const { productid, quantity } = req.body;
    const acceptUpdateInventoryQuery = `UPDATE PRODUCT SET PRODUCTQUANTITY = PRODUCTQUANTITY + $2 WHERE PRODUCTID = $1`;

    try {
        // Update product quantity
        const acceptUpdateInventory = await pool.query(acceptUpdateInventoryQuery, [productid, quantity]);

        // Delete from update_inventory
        const deleteUpdateInventoryQuery = 'SELECT delete_from_update_inventory($1)';
        await pool.query(deleteUpdateInventoryQuery, [productid]);

        res.status(200).json({ message: "Inventory updated successfully" });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/getProposedProducts', async (req, res) => {
    const getProposedProductQuery = `SELECT * FROM proposed_product`;
    try {
        const proposedProduct = await pool.query(getProposedProductQuery);
        res.status(200).json(proposedProduct.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

// app.post('/offerPrice', async (req, res) => {
//     const { proposedproductid,offers,discounts,ratings,importerid } = req.body;
//     const offerPriceQuery = `insert into price_offer (proposed_productid, offered_price,importerid,rating,discountoffer) VALUES ($1, $2, $3)`;
//     try {
//         const offerPrice = await pool.query(offerPriceQuery, [proposedproductid,offers ,importerid,ratings,discounts]);
//         res.status(200).json({ message: "Price offered successfully" });
//     } catch (error) {
//         console.error(error.message);
//     }
// }
// );

app.post('/offerPrice', async (req, res) => {
    const { proposedproductid, offers, discounts, ratings, importerid } = req.body;
    const checkofferQuery = `SELECT * FROM price_offer WHERE proposed_productid = $1 AND importerid = $2 AND discountoffer = $3 AND rating = $4 AND offeredprice = $5`;
    const offerPriceQuery = `INSERT INTO price_offer (proposed_productid, offeredprice, importerid, rating, discountoffer) VALUES ($1, $2, $3, $4, $5)`;

    try {
        const checkoffer = await pool.query(checkofferQuery, [proposedproductid, importerid, discounts, ratings, offers]);
        if (checkoffer.rows.length > 0) {
            res.status(200).json({ message: "You have already offered this price" });
            return;
        } else {
            const offerPrice = await pool.query(offerPriceQuery, [proposedproductid, offers, importerid, ratings, discounts]);
            res.status(200).json({ message: "Price offered successfully" });
        }

    } catch (error) {
        console.error(error.message);
    }
});


//this is for admin to see the highest price offered by the importers
app.get('/priceOffers', async (req, res) => {
    const getPriceOfferQuery = `SELECT  PP.PROPOSED_PRODUCTID,CATEGORYNAME, SUBCATEGORYNAME, PRODUCTNAME, BRANDNAME, PRODUCTQUANTITY, SPECIFICATION, PROPOSEDPRICE,
    MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100) AS MINIMUMPRICE,(
      SELECT I.ImporterAgencyName
      FROM IMPORTER I
      WHERE I.ImporterId = (
          SELECT ImporterId
          FROM PRICE_OFFER PO
          WHERE (PO.OFFEREDPRICE-PO.OFFEREDPRICE*PO.DISCOUNTOFFER/100) = MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100)
      )
    ),
    (
      SELECT I.ImporterId
      FROM IMPORTER I
      WHERE I.ImporterId = (
          SELECT ImporterId
          FROM PRICE_OFFER PO
          WHERE (PO.OFFEREDPRICE-PO.OFFEREDPRICE*PO.DISCOUNTOFFER/100) = MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100)
      )
    ),
    (
        SELECT PO.DISCOUNTOFFER
        FROM PRICE_OFFER PO
        WHERE (PO.OFFEREDPRICE-PO.OFFEREDPRICE*PO.DISCOUNTOFFER/100) = MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100)
    ),
    (
        SELECT PO.RATING
        FROM PRICE_OFFER PO
        WHERE (PO.OFFEREDPRICE-PO.OFFEREDPRICE*PO.DISCOUNTOFFER/100) = MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100)
    ),
    (
      
            SELECT PO.OFFEREDPRICE
            FROM PRICE_OFFER PO
            WHERE (PO.OFFEREDPRICE-PO.OFFEREDPRICE*PO.DISCOUNTOFFER/100) = MIN(PF.OFFEREDPRICE-PF.OFFEREDPRICE*PF.DISCOUNTOFFER/100)

    )
  
  
    FROM PRICE_OFFER PF LEFT JOIN PROPOSED_PRODUCT PP ON PF.proposed_ProductId = PP.PROPOSED_PRODUCTID
    LEFT JOIN IMPORTER ON PF.ImporterId = IMPORTER.ImporterId
  
    GROUP BY PP.PROPOSED_PRODUCTID, CATEGORYNAME, SUBCATEGORYNAME, PRODUCTNAME, BRANDNAME, PRODUCTQUANTITY, SPECIFICATION, PROPOSEDPRICE`;
    try {
        const priceOffer = await pool.query(getPriceOfferQuery);
        res.status(200).json(priceOffer.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/addProduct', async (req, res) => {
    try {
        const { productname, brandname, productquantity, price, specification, rating, discountoffer, subcategoryname, importerid } = req.body;
        
        // Get the subcategoryid from the database
        const subcategoryResult = await pool.query(`SELECT subcategoryid FROM product_subcategory WHERE subcategoryname=$1`, [subcategoryname]);
        const subcategoryid = subcategoryResult.rows[0].subcategoryid;

        const addProductQuery = `
            INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`;

        // Execute the query with parameterized values
        const add = await pool.query(addProductQuery, [
            productname,
            brandname,
            parseInt(productquantity),
            parseFloat(price),
            specification,
            parseFloat(rating),
            parseFloat(discountoffer),
            parseInt(subcategoryid),
            parseInt(importerid)
        ]);

        res.status(200).json({ message: "Product added successfully" });
    } catch (err) {
        console.error(err.message);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.post('/editReview', async (req, res) => {
    const {userid, productid, editedReview, editedRating} = req.body;
    const editReviewQuery = `UPDATE REVIEW SET REVIEW = $3, RATING = $4 WHERE CUSTOMERID = $1 AND PRODUCTID = $2`;
    const getProductRatingQuery = `SELECT Rating FROM product WHERE ProductId = $1`;
    const updateRatingQuery = `UPDATE PRODUCT SET RATING = $1 WHERE PRODUCTID = $2`;
    
    try {
        const edit = await pool.query(editReviewQuery, [userid, productid, editedReview, editedRating]);

        const { rows } = await pool.query(getProductRatingQuery, [productid]);
        const currentRating = parseFloat(rows[0].rating);

        // Check if both Rating and currentRating are valid numbers
        if (!isNaN(editedRating) && !isNaN(currentRating)) {
            // Parse Rating to float
            const parsedRating = parseFloat(editedRating);

            // Calculate the new rating based on the submitted review
            const newRating = (currentRating + parsedRating) / 2;

            // Update the product rating
            await pool.query(updateRatingQuery, [newRating, productid]);

            res.status(200).json({ message: "Review submitted successfully" });
        } else {
            res.status(400).json({ error: "Invalid Rating or currentRating value" });
        }
}
catch (error) {
    console.error(error.message);
    res.status(500).json({ error: "An error occurred while submitting the review" });
}
});


app.get('/getTop3ExpensiveGamingLaptops', async (req, res) => {
    const getTop3ExpensiveLaptopsQuery = `SELECT * 
    FROM PRODUCT join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid
    WHERE productid IN (
        SELECT productid 
        FROM product 
        WHERE subcategoryid = 19 
        GROUP BY productid 
        ORDER BY COUNT(productid) 
    ) 
    ORDER BY price DESC 
    LIMIT 3;`;
    try {
        const top3ExpensiveLaptops = await pool.query(getTop3ExpensiveLaptopsQuery);
        res.status(200).json(top3ExpensiveLaptops.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.get('/getTop3ExpensiveSmartphones', async (req, res) => {
    const getTop3ExpensiveSmartphonesQuery = `SELECT * 
    FROM PRODUCT join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid
    WHERE productid IN (
        SELECT productid 
        FROM product 
        WHERE subcategoryid = 24 
        GROUP BY productid 
        ORDER BY COUNT(productid) 
    ) 
    ORDER BY price DESC 
    LIMIT 3;`;
    try {
        const top3ExpensiveSmartphones = await pool.query(getTop3ExpensiveSmartphonesQuery);
        res.status(200).json(top3ExpensiveSmartphones.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.get('/bestLaptopForStudents', async (req, res) => {
    const cheapLaptopForStudentsQuery = `SELECT * 
    FROM PRODUCT join product_subcategory on product.subcategoryid=product_subcategory.subcategoryid
    WHERE productid IN (
        SELECT productid 
        FROM product 
        WHERE subcategoryid = 21
        GROUP BY productid 
        ORDER BY COUNT(productid) 
    ) 
    ORDER BY price ASC 
    LIMIT 1;`;
    try {
        const cheapLaptopForStudents = await pool.query(cheapLaptopForStudentsQuery);
        res.status(200).json(cheapLaptopForStudents.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);

app.get('/getBestSellers', async (req, res) => {
    const getBestSellersQuery = `select p.productid,p,productname,p.price,product_subcategory.productlink, COALESCE(sum(os.quantity), 0) as total_orders
    from product p join product_subcategory on p.subcategoryid=product_subcategory.subcategoryid
    left join order_status os on os.productid = p.productid
    group by p.productid,p,productname,p.price,product_subcategory.productlink
    order by total_orders desc
    limit 3;`;
    try {
        const bestSellers = await pool.query(getBestSellersQuery);
        res.status(200).json(bestSellers.rows);
    } catch (error) {
        console.error(error.message);
    }
   
}
);


//online
app.post('/reqToAdmin', async (req, res) => {
    const { productid,reqquantity} = req.body;
    const sendProductRequestQuery = `insert into customer_request (productid, quantity) VALUES ($1, $2)`;
    try {

        const parsedProductId = parseInt(productid);
        const parsedQuantity = parseInt(reqquantity);
       



        const sendProductRequest = await pool.query(sendProductRequestQuery, [parsedProductId, parsedQuantity]);
        res.status(200).json({ message: "Request sent successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.post('/updateProductFromCustomer', async (req, res) => {
    const { productid, quantity} = req.body;
    const fillProductRequestQuery = `UPDATE product SET productquantity = productquantity + $2 WHERE productid = $1`;
    try {
        const parsedProductId = parseInt(productid);
        const parsedQuantity = parseInt(quantity);

        const fillProductRequest = await pool.query(fillProductRequestQuery, [parsedProductId, parsedQuantity]);
        const deleteRequestQuery = `DELETE FROM customer_request WHERE productid = $1`;
        const deleteRequest = await pool.query(deleteRequestQuery, [parsedProductId]);
        res.status(200).json({ message: "Request filled successfully" });
    } catch (error) {
        console.error(error.message);
    }
}
);

app.get('/getReqFromCustomer', async (req, res) => {
    const getProductRequestsQuery = `SELECT * FROM customer_request`;
    try {
        const productRequests = await pool.query(getProductRequestsQuery);
        res.status(200).json(productRequests.rows);
    } catch (error) {
        console.error(error.message);
    }
}
);


app.listen(3000, () => {
    console.log("server has started on port 3000");
});



