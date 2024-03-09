import React, { useState, useEffect } from 'react'

export default function OrderHistory() {
    const [orderHistory, setOrderHistory] = useState(null);

    const getOrderHistory = async () => {
        try {
            const response = await fetch("http://localhost:3000/getOrderHistory", {
                method: "GET",
                headers: { "Content-Type": "application/json" }
            })
            if (response.status === 200) {
                const responseData = await response.json();
                console.log(responseData);
                setOrderHistory(responseData);
            }
            else {
                console.log("No order found");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }


    useEffect(() => {
        getOrderHistory();
    }, []);
    return (
        <div className='container mt-4'>
            <h1>Previous Orders</h1>

            {orderHistory === null ? (
                <h2>Loading...</h2>
            ) : orderHistory.length === 0 ? (
                <h2>No Orders Found</h2>
            ) :
                <table className="table">
                    <thead>
                        <tr>
                            {/* <th scope="col">Order ID</th> */}
                            <th scope="col">Product Name</th>
                            <th scope='col'>Order Placement Date</th>
                            <th scope="col"> Delivered Date</th>
                            <th scope="col">Total Price</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        {orderHistory.map((order) => (
                            <tr key={order.orderid}>
                                <td>{order.productname}</td>
                                <td>{order.orderplaceddate}</td>
                                <td>{order.orderdelivereddate}</td>
                                <td>{order.total_price}</td>
                                <td>{order.orderstatus}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>

            }



        </div>
    )
}
