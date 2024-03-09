import React from 'react'
import { useState, useEffect } from 'react';

export default function SupplyProducts(props) {
    const [proposedProducts, setProposedProducts] = useState([]);
    const [offers, setOffers] = useState(0);
    const [discounts, setDiscounts] = useState(0);
    const [ratings, setRatings] = useState(0);
    const [importerid,setimporterid] = useState(props.importerid);

    useEffect(() => {
        fetchProposedProducts();
    }, []);

    const fetchProposedProducts = async () => {
        try {
            const response = await fetch('http://localhost:3000/getProposedProducts');
            const data = await response.json();
            setProposedProducts(data);
        } catch (error) {
            console.error('Error:', error);
        }
    }

    // const handleOfferChange = (offer) => {
    //     setOffers(offer);
    // }
    // const handleDiscountChange = (discount) => {
    //     setDiscounts(discount);
    // }

    // const handleRatingChange = (rating) => {
    //     setRatings(rating);
    // }

    const submitOffer = async (proposedproductid) => {
        const body ={ proposedproductid, offers, discounts, ratings, importerid }
        console.log(body);

        try{
            const response = await fetch("http://localhost:3000/offerPrice", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            if(response.status === 200){
                console.log('Offer submitted successfully');
                alert('Offer submitted successfully');
            } else {
                console.error('Error submitting offer:', response.status);
            }
        }
        catch (error) {
            console.error('Error submitting offer:', error);
        }
    }




    return (
        <div className="container">
            <form>
                <div className="row">
                    {proposedProducts.map(product => (
                        <div className="col-lg-4 mb-4" key={product.proposed_productid}>
                            <div className="card h-100">
                                <div className="card-body">
                                    <h5 className="card-title">{product.productname}</h5>
                                    <p className="card-text">Category: {product.categoryname}</p>
                                    <p className="card-text">Subcategory: {product.subcategoryname}</p>
                                    <p className="card-text">Brand: {product.brandname}</p>
                                    <p className="card-text">Quantity: {product.productquantity}</p>
                                    <p className="card-text">Specification: {product.specification}</p>
                                    <p className="card-text">Proposed Price: {product.proposedprice}</p>
                                    
                                    <div className="form-group">
                                        <label htmlFor={`offer_${product.proposed_productid}`}>Offer:</label>
                                        <input
                                            type="number"
                                            className="form-control"
                                            id={`offer_${product.proposed_productid}`}
                                            placeholder="Enter offer"
                                            // value={offers[product.proposed_productid] || ''}
                                            onChange={e => setOffers( e.target.value)}
                                        />
                                    </div>
                                    <div className="form-group">
                                        <label htmlFor={`discount_${product.proposed_productid}`}>Discount:</label>
                                        <input
                                            type="number"
                                            className="form-control"
                                            id={`discount_${product.proposed_productid}`}
                                            placeholder="Enter discount"
                                            // value={discounts[product.proposed_productid] || ''}
                                            onChange={e => setDiscounts(e.target.value)}
                                        />
                                    </div>

                                    <div className="form-group">
                                        <label htmlFor={`rating_${product.proposed_productid}`}>Rating:</label>
                                        <input
                                            type="number"
                                            className="form-control"
                                            id={`rating_${product.proposed_productid}`}
                                            placeholder="Enter rating"
                                            step="0.1"
                                            // value={ratings[product.proposed_productid] || ''}
                                            onChange={e => setRatings(e.target.value)}
                                        />
                                    </div>
                                    <button
                                        type="button"
                                        className="btn btn-primary"
                                        onClick={() => submitOffer(product.proposed_productid)}
                                    >
                                        Submit
                                    </button>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
                
            </form>
        </div>
    );
}
