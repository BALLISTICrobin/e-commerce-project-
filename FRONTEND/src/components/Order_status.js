import React from 'react';
import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Order_status(props) {
    const [customerid, setCustomerid] = useState(props.userid);

    const [orderStatusData, setOrderStatusData] = useState(null);
    const navigate = useNavigate();
    // let productid = 0;

    const fetchData = async () => {
        const body = { customerid };
        try {
            const response = await fetch("http://localhost:3000/getOrderStatus", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });

            if (response.status === 200) {
                const data = await response.json();
                console.log('inside order status');
                console.log(data);
                setOrderStatusData(data);
            } else {
                console.error('Error fetching data:', response.status);
            }

        } catch (error) {
            console.error('Error fetching data:', error);
        }
    };

    useEffect(() => {
        fetchData();
    }, [customerid]);

    // CREATE TABLE order_status (
    //     OrderStatusId BIGSERIAL PRIMARY KEY,
    //     CustomerId BIGINT NOT NULL,
    //     ProductId BIGINT NOT NULL,
    //     QUANTITY INT NOT NULL,
    //     TOTAL_PRICE DECIMAL(10,2) NOT NULL;
    //     OrderPlacedDate DATE NOT NULL,
    //     ADDRESS VARCHAR(100) NOT NULL,
    //     OrderDeliveredDate DATE NOT NULL,
    //     OrderStatus VARCHAR(100) NOT NULL,
    //     NAME VARCHAR(50) NOT NULL,
    //      EMAIL VARCHAR(50) NOT NULL,
    //     FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId),
    //     FOREIGN KEY (ProductId) REFERENCES product(ProductId)
    // );
    return (
        <div className="container mt-4">
            <h2>Order Status(current)</h2>
            {orderStatusData === null ? (
                <h2>Loading...</h2>
            ) : orderStatusData.length === 0 ? (
                <h2>No Orders Found</h2>
            ) : (
                <div className="table-responsive">
                    <table className="table table-striped">
                        <thead>
                            <tr>
                                <th>product name</th>
                                <th>quantity</th>
                                <th>total price</th>
                                <th>order placed date</th>
                                <th>address</th>
                                <th>order delivered date</th>
                                <th>order status</th>
                                <th>name</th>
                                <th>email</th>
                            </tr>
                        </thead>
                        <tbody>
                            {orderStatusData.map((order, index) => (
                                <tr key={index}>
                                    {/* <Link to={`/Readmore/${order.productid}`}> */}
                                    <td>{order.productname}</td>
                                    <td>{order.quantity}</td>
                                    <td>{order.total_price}</td>
                                    <td>{order.orderplaceddate}</td>
                                    <td>{order.address}</td>
                                    <td>{order.orderdelivereddate}</td>
                                    <td>{order.orderstatus}</td>
                                    <td>{order.name}</td>
                                    <td>{order.email}</td>
                                    {/* </Link> */}
                                </tr>

                            ))

                            }
                        </tbody>
                    </table>
                </div>
            )}
        </div>
    );
}
