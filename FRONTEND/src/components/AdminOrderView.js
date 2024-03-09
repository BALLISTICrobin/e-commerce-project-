import React, { useEffect, useState } from 'react'

export default function AdminOrderView() {
  const [orderView, setOrderView] = useState(null);

  const getOrderView = async () => {
    try {
      const response = await fetch("http://localhost:3000/getOrderStatusAdmin", {
        method: "GET",
        headers: { "Content-Type": "application/json" }
      })
      if (response.status === 200) {
        const responseData = await response.json();
        setOrderView(responseData);
        console.log(responseData);
      }
      else {
        console.log("No order found");
      }
    }
    catch (error) {
      console.error(error.message);
    }
  }
  const acceptOrder = async (orderstatusid) => {
    const body = { orderstatusid };
    console.log(orderstatusid);
    try {
      const response = await fetch("http://localhost:3000/acceptOrder", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
      })
      if (response.status === 200) {
        const responseData = await response.json();
        alert(responseData.message);
        getOrderView();
      } else {
        alert("Order not accepted");
      }
    } catch (error) {
      console.error(error.message);
    }
  }

  useEffect(() => {
    getOrderView();
  }, []);

  return (
    <div>
      //make a table to display the order details
      {orderView === null ? (
        <h2>Loading...</h2>
      ) : orderView.length === 0 ? (
        <h2>No Orders Found</h2>
      ) : <table className="table">
        <thead>
          <tr>

            <th>Product Name</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Order Place Date</th>
            <th>estimated delivery date</th>
            <th>Accept</th>
          </tr>
        </thead>
        <tbody>
          {orderView && orderView.map((order) => {
              console.log(order);
            return (
              <tr key={order.orderstatusid}>
                <td>{order.productname}</td>
                <td>{order.quantity}</td>
                <td>{order.total_price}</td>
                <td>{order.orderplaceddate}</td>
                <td>{order.orderdelivereddate}</td>
                <td><button onClick={() => {acceptOrder(order.orderstatusid)}}>Accept</button></td>
              </tr>
            );
          })}
        </tbody>
      </table>
      }
    </div>
  )
}

