import React, { useState, useEffect } from 'react'
import { NavLink } from 'react-router-dom';

export default function Cart(props) {
    const [userId, setUserId] = useState(props.userid);
    const [cart, setCart] = useState(null);
    let total = 0;


    const increment = async (productid, quantity) => {
        quantity = quantity + 1;
        const body = { userId, productid, quantity };
        console.log(body);
        try {
            const response = await fetch("http://localhost:3000/updateCart", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                getCart();
            }
            else {
                alert("Failed to add to cart");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }
    const decrement = async (productid, quantity) => {
        if (quantity > 1) {
            quantity = quantity - 1;
        }

        const body = { userId, productid, quantity };
        try {
            const response = await fetch("http://localhost:3000/updateCart", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                getCart();
            }
            else {
                alert("Failed to add to cart");
            }
        }
        catch (error) {
            console.error(error.message);
        }

    }

    const getCart = async () => {
        if (userId === 0) {
            alert("Please login to view cart");
        }
        const body = { userId };
        try {
            const response = await fetch("http://localhost:3000/getCart", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                console.log(responseData);
                setCart(responseData);
            }
            else {

                alert("No product found in cart");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const rmvFromCart = async (productid) => {
        const body = { userId, productid };
        try {
            const response = await fetch("http://localhost:3000/rmvFromCart", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                getCart();
            }
            else {
                alert("Failed to remove from cart");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    useEffect(() => {

        getCart();
    }, []);
    return (
        <div className='container'>

            <table className="table">
                <thead>
                    <tr>
                        <th scope="col">Product Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    {cart && cart.map((item) => (
                        total = total + (item.price - item.price * item.discountoffer / 100) * item.quantity,
                        <tr key={item.productid}>
                            <td>{item.productname}</td>
                            <td>{item.price}</td>
                            <td>
                                <div className="btn-group" role="group">
                                    <button type="button" className="btn btn-info mb-3" onClick={() => decrement(item.productid, item.quantity)}>-</button>
                                    <span className='mx-2'>{item.quantity}</span>
                                    <button type="button" className="btn btn-info mb-3" onClick={() => increment(item.productid, item.quantity)}>+</button>
                                </div>
                            </td>
                            <td>{(item.price - item.price * item.discountoffer / 100) * item.quantity}</td>
                            <td>
                           
                                <button type="button" style={{ borderRadius: '2px', paddingRight: '5px', border: 'none', background: 'transparent' }} onClick={() => {rmvFromCart(item.productid)}}>
                                    <img src="https://www.shutterstock.com/image-vector/trash-bin-icon-vector-recycle-600nw-1909485802.jpg" alt="delete" style={{ maxWidth: '100%', borderRadius: '25px', height: '40px' }}/>
                                </button>
                            
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <div className="container">

                <div class="card" style={{ width: '18rem' }}>
                    <div class="card-body">
                        <h5 class="card-title">Cart Subtotal</h5>
                        {/* <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> */}
                        <p class="card-text"><h3>Total: </h3>{total}$</p>
                        <NavLink to={`/checkout/${total}`} >
                            <button type="button" class="btn btn-warning"> Proceed to checkout
                            </button>
                        </NavLink>
                    </div>
                </div>

            </div>

        </div>
    )
}
