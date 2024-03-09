import React from 'react'
import { useState, useEffect } from 'react';

export default function PriceOfferView() {
    const [priceOffers, setPriceOffers] = useState([]);

    useEffect(() => {
        fetchPriceOffers();
    }, []);

    const fetchPriceOffers = async () => {
        try{
            const response = await fetch("http://localhost:3000/priceOffers",
            {
                method: "GET",
                headers: { "Content-Type": "application/json" }
            }
            );
            if(response.status === 200){
                const data = await response.json();
                console.log(data);
                setPriceOffers(data);
            } else {
                console.error('Error fetching data:', response.status);
            }
            
        }
        catch (error) {
            console.error('Error fetching data:', error);
        }
    };

    const handleAcceptOffer = async(productname,brandname,productquantity,price,specification,rating,discountoffer,subcategoryname,importerid) => {
        const body = { productname, brandname, productquantity, price, specification, rating, discountoffer, subcategoryname, importerid }
        console.log('Accepting offer:', body);
        try {
            const response = await fetch("http://localhost:3000/addProduct", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                console.log("requested to accept offer successfully");
                fetchPriceOffers();
            }
            else {
                console.log("Failed to accept offer");
            }
        } catch (error) {
            console.error("Error:", error);
        }
        
    };

    return (
        <div style={{ margin: '20px' }}>
            <h2>Best Offers By the importers</h2>
            <table style={{ width: '100%', borderCollapse: 'collapse' }}>
                <thead>
                    <tr>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Product Name</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Agency Name</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Category</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Subcategory</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Brand</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Product Quantity</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Specification</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Rating</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Discount Offer</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Net Price</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Price Offer</th>
                        <th style={{ border: '1px solid #dddddd', padding: '8px', backgroundColor: '#f2f2f2' }}>Action</th>
                    </tr>
                </thead>
                {/* const{productname,brandname,productquantity,price,specification,rating,discountoffer,subcategoryname,importerid}=req.body; */}
                <tbody>
                    {priceOffers.map((offer, index) => (
                        <tr key={index}>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.productname}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.importeragencyname}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.categoryname}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.subcategoryname}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.brandname}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.productquantity}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.specification}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.rating}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.discountoffer}%</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.minimumprice}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>{offer.offeredprice}</td>
                            <td style={{ border: '1px solid #dddddd', padding: '8px' }}>
                                <button style={{ backgroundColor: '#007bff', color: 'white', padding: '6px 12px', border: 'none', borderRadius: '4px', cursor: 'pointer' }} 
                                onClick={() => handleAcceptOffer(offer.productname,offer.brandname,offer.productquantity,offer.offeredprice,offer.specification,offer.rating,offer.discountoffer,offer.subcategoryname,offer.importerid)}
                                >Accept
                                </button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
