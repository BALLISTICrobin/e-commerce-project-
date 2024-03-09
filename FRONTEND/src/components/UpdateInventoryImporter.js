import React, { useState, useEffect } from 'react';

const UpdateInventoryImporter = (props) => {
    const [inventoryData, setInventoryData] = useState([]);
    const [importerid, setImporterid] = useState(props.importerid);
    const fetchData = async () => {
        const body = { importerid };
        try {
            const response = await fetch("http://localhost:3000/getUpdateInventory", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            if (response.status === 200) {
                const data = await response.json();
                console.log(data);
                setInventoryData(data);
            }
            else {
                console.error("Failed to fetch data");
            }

        }
        catch (err) {
            console.error(err.message);
        }
    };

    useEffect(() => {
        fetchData();
    }, []);

    const handleAddStocks = async (productid, quantity) => {
        const body = { productid, quantity };
        try {
            const response = await fetch("http://localhost:3000/acceptUpdateInventory", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body),
            });
            if (response.status === 200) {
                alert("Stocks added successfully");
                fetchData();
            } else {
                console.error("Failed to add stocks");
            }
        } catch (err) {
            console.error(err.message);
        }
    };
    
    return (
        <div className="container mt-4">
            <h2 className="mb-4">Update Inventory Importer</h2>
            {inventoryData.length === 0 ? (
                <p>Loading data...</p>
            ) : (
                <>
                    <div className="row">
                        {inventoryData.map((item) => (
                            <div className="col-md-4 mb-4" key={item.updateInventoryId}>
                                <div
                                    className="card"
                                    style={{
                                        border: '1px solid #ddd',
                                        borderRadius: '8px',
                                        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
                                        transition: 'transform 0.2s ease-in-out',
                                    }}
                                >
                                    <div className="card-body">
                                        <h5 className="card-title">Product Name: {item.productname}</h5>
                                        <p className="card-text">Asked Quantity: {item.askedproductquantity}</p>
                                        <p className="card-text">Brand Name: {item.brandname}</p>
                                        <p className="card-text">Specification: {item.specification}</p>
                                        {/* Add more fields as needed */}
                                    </div>
                                </div>
                                <button
                                    className="btn btn-primary mt-3"
                                    onClick={() => handleAddStocks(item.productid, item.askedproductquantity)}
                                    style={{
                                        borderRadius: '8px',
                                        padding: '10px',
                                        backgroundColor: '#007bff',
                                        color: '#fff',
                                        border: 'none',
                                        cursor: 'pointer',
                                    }}
                                >
                                    Add Stocks
                                </button>
                            </div>


                        ))}
                    </div>

                </>
            )}
        </div>
    );
};

export default UpdateInventoryImporter;
