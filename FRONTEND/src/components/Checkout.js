import React from 'react'
import { useState } from 'react';
import { useParams } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';

export default function Checkout(props) {
    const navigate = useNavigate();
    const [customerid, setcustomerid] = useState(props.userid);
    const { totalPrice } = useParams();
    const [RecipientName, setRecipientName] = useState('');
    const [Email, setEmail] = useState('');
    const [Address, setAddress] = useState('');
    // const [NameOnCard, setNameOnCard] = useState('');
    const [CreditCardNumber, setCreditCardNumber] = useState('');
    const [creditCardType, setCreditCardType] = useState('');
    let vat = 15, shipping = 5,total = 0;
    const totalCost = totalPrice + shipping + (totalPrice * vat / 100);
    const roundedTotalCost = parseFloat(totalCost).toFixed(2);

    const placeOrder = async () => {
        const body = { customerid, RecipientName, Email, Address};
        try {
            const response = await fetch("http://localhost:3000/placeOrder", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                alert("Order placed successfully");
                navigate('/order_status');
            }
            else {
                alert("Failed to place order");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }


    const checkValidity =async () => {
        const body = {customerid,creditCardType,CreditCardNumber};
        try {
            const response = await fetch("http://localhost:3000/checkValidity", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                placeOrder();
            }
            else {
                alert("invalid credit card details");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    return (
        <div className="container">
            <h2>Checkout form</h2>
            
            <h4 class="mb-3">Billing address</h4>
            <div class="col-sm-6">
                <label for="name" class="form-label">Receipent's Name</label>
                <input type="text" class="form-control" id="Name" placeholder="" required=""
                onChange={e=>setRecipientName(e.target.value)} />
                <div class="invalid-feedback">
                    Valid first name is required.
                </div>
            </div>
            <div class="col-12">
                <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com" 
                onChange={e=>setEmail(e.target.value)}/>
                <div class="invalid-feedback">
                    Please enter a valid email address for shipping updates.
                </div>
            </div>
            <div class="col-12">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="" 
                onChange={e=>setAddress(e.target.value)}/>
                <div class="invalid-feedback">
                    Please enter your shipping address.
                </div>
            </div>
            <h4 class="mb-3">Payment</h4>
            <div class="form-check">
                <input id="Mastercard" name="paymentMethod" type="radio" class="form-check-input"  required="" 
                onChange={e=>setCreditCardType(e.target.id)}/>
                <label class="form-check-label" for="Mastercard">Mastercard</label>
            </div>
            <div class="form-check">
                <input id="Visa" name="paymentMethod" type="radio" class="form-check-input" required="" 
                onChange={e=>setCreditCardType(e.target.id)}/>
                <label class="form-check-label" for="Visa">Visa</label>
            </div>
            <div class="form-check">
                <input id="Paypal" name="paymentMethod" type="radio" class="form-check-input" required="" 
                onChange={e=>setCreditCardType(e.target.id)}/>
                <label class="form-check-label" for="PayPal">PayPal</label>
            </div>
            <div class="form-check">
                <input id="Amex" name="paymentMethod" type="radio" class="form-check-input" required="" 
                onChange={e=>setCreditCardType(e.target.id)}/>
                <label class="form-check-label" for="Amex">Amex</label>
            </div>
            <div class="form-check">
                <input id="Discover" name="paymentMethod" type="radio" class="form-check-input" required="" 
                onChange={e=>setCreditCardType(e.target.id)}/>
                <label class="form-check-label" for="Discover">Discover</label>
            </div>
           
            <div class="col-md-6">
                <label for="cc-number" class="form-label">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required="" 
                onChange={e=>setCreditCardNumber(e.target.value)}/>
                <div class="invalid-feedback">
                    Credit card number is required
                </div>
            </div>

            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Your cart</span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Cost</h6>
                            <small class="text-muted">total price without shipping cost & vat</small>
                        </div>
                        <span class="text-muted">{totalPrice}$</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Shipping Cost</h6>
                            <small class="text-muted">delivery charge</small>
                        </div>
                        <span class="text-muted">{shipping}$</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Vat</h6>
                            <small class="text-muted">Tax</small>
                        </div>
                        <span class="text-muted">{vat}%</span>
                    </li>
                    
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total Cost(USD)</span>
                        <strong>{roundedTotalCost}$</strong>
                    </li>
                </ul>

                {/* <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Promo code" />
                        <button type="submit" class="btn btn-secondary">Redeem</button>
                    </div>
                </form> */}
            </div>
            <hr class="my-4"></hr>

            <button class="w-100 btn btn-primary btn-lg" type="submit" onClick={checkValidity}>Placed Order</button>
            
        </div>
    )

}
