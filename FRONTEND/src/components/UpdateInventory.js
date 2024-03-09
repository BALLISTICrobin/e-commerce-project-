import React, { useEffect, useState } from 'react';

export default function UpdateInventory() {
    const [products, setProducts] = useState([]);
    const [selectedProduct, setSelectedProduct] = useState(null);
    const [askedQuantity, setAskedQuantity] = useState('');
    const [minStock, setMinStock] = useState('');
    const [maxStock, setMaxStock] = useState('');
    const [reqFromCustomer, setReqFromCustomer] = useState(null);
    const [showModal, setShowModal] = useState(false);
    //   const [importerId, setImporterId] = useState(0);

    const getProduct = async () => {
        try {
            const response = await fetch("http://localhost:3000/getInventory", {
                method: "GET",
                headers: { "Content-Type": "application/json" }
            });

            if (response.status === 200) {
                const responseData = await response.json();
                setProducts(responseData);
            } else {
                console.log("No product found");
            }
        } catch (error) {
            console.error(error.message);
        }
    };

    const openModal = (product) => {
        setSelectedProduct(product);
        setShowModal(true);
    };

    const closeModal = () => {
        setShowModal(false);
        setAskedQuantity('');
    };

    const submitUpdateInventory = async () => {
        const body = {
            productid: selectedProduct.productid,
            importerid: selectedProduct.importerid,
            quantity: askedQuantity
        };

        try {
            const response = await fetch("http://localhost:3000/updateInventory", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });

            if (response.status === 200) {
                console.log("Inventory updated successfully");
            } else {
                console.log("Failed to update inventory");
            }
        } catch (error) {
            console.error(error.message);
        }
    }
    const filterProducts = async () => {
        const body ={minStock, maxStock};
        try {
            const response = await fetch("http://localhost:3000/filterInventory", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });

            if (response.status === 200) {
                const responseData = await response.json();
                setProducts(responseData);
            } else {
                console.log("No product found");
            }
        } catch (error) {
            console.error(error.message);
        }
    };

    const getReqFromCustomer = async () => {
        try{
            const response = await fetch("http://localhost:3000/getReqFromCustomer", {
                method: "GET",
                headers: { "Content-Type": "application/json" }
            });

            if(response.status === 200){
                const responseData = await response.json();
                console.log(responseData);
                setReqFromCustomer(responseData);
            } else {
                console.log("No request found");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const updateProduct = async(productid, quantity) => {
        const body = {productid, quantity};
        try{
            const response = await fetch("http://localhost:3000/updateProductFromCustomer", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });

            if(response.status === 200){
                console.log("Product updated successfully");
                alert("Product updated successfully");
                getReqFromCustomer();
            } else {
                console.log("Failed to update product");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }



    const handleSubmit = () => {
        // Handle submission logic here
        console.log("Product ID:", selectedProduct.productid);
        console.log("Asked Quantity:", askedQuantity);
        console.log("Importer ID:", selectedProduct.importerid);
        // Add your logic to update inventory or perform other actions
        submitUpdateInventory();
        closeModal();
    };

    useEffect(() => {
        getProduct();
        getReqFromCustomer();
    }, []);

    return (
        <div className="container-fluid mt-4">
            <div className="row">
                <div className="col-md-3">
                    <div className="sidebar">
                        <h4>Filter Products</h4>
                        <div className="form-group">
                            <label>Min Stock:</label>
                            <input
                                type="text"
                                className="form-control"
                                value={minStock}
                                onChange={(e) => setMinStock(e.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <label>Max Stock:</label>
                            <input
                                type="text"
                                className="form-control"
                                value={maxStock}
                                onChange={(e) => setMaxStock(e.target.value)}
                            />
                        </div>
                        <button className="btn btn-primary" onClick={filterProducts}>
                            Filter
                        </button>

                        {/* //create table for customer request */}
                        <h4>Customer Request</h4>
                        {reqFromCustomer ? (
                            <table className="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Product Id</th>
                                        <th>Quantity</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {reqFromCustomer.map((req) => (
                                        <tr key={req.productid}>
                                            <td>{req.productid}</td>
                                            <td>{req.quantity}</td>
                                            <td>
                                                <button
                                                    className="btn btn-primary"
                                                    onClick={()=>{updateProduct(req.productid, req.quantity)}}
                                                >
                                                    Update
                                                </button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        ) : (
                            <p>No request available</p>
                        )}
                    </div>
                </div>

                <div className="col-md-9">
                    <div className="main-content">
                        {products ? (
                            <table className="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Category</th>
                                        <th>Subcategory</th>
                                        <th>Product Name</th>
                                        <th>Brand Name</th>
                                        <th>Product Quantity</th>
                                        <th>price</th>
                                        <th>specification</th>
                                        <th>Importer Agency Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {products.map((product) => (
                                        <tr key={product.productid}>
                                            <td>{product.categoryname}</td>
                                            <td>{product.subcategoryname}</td>
                                            <td>{product.productname}</td>
                                            <td>{product.brandname}</td>
                                            <td>{product.productquantity}</td>
                                            <td>{product.price}</td>
                                            <td>{product.specification}</td>
                                            <td>{product.importeragencyname}</td>
                                            <td>
                                                <button
                                                    className="btn btn-primary"
                                                    onClick={() => openModal(product)}
                                                >
                                                    Update
                                                </button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        ) : (
                            <p>No products available</p>
                        )}
                    </div>
                </div>
            </div>

            {/* Modal */}
            <div
                className={`modal fade ${showModal ? 'show' : ''}`}
                style={{ display: showModal ? 'block' : 'none' }}
                tabIndex="-1"
                role="dialog"
                aria-labelledby="exampleModalCenterTitle"
                aria-hidden="true"
            >
                <div className="modal-dialog modal-dialog-centered" role="document">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title" id="exampleModalLongTitle">
                                Update Quantity
                            </h5>
                            <button
                                type="button"
                                className="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onClick={closeModal}
                            >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div className="modal-body">
                            <form>
                                <div className="form-group">
                                    <label>Product ID:</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        value={selectedProduct ? selectedProduct.productid : ''}
                                        readOnly
                                    />
                                </div>
                                <div className="form-group">
                                    <label>Importer ID:</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        value={selectedProduct ? selectedProduct.importerid : ''}
                                        readOnly
                                    />
                                </div>
                                <div className="form-group">
                                    <label>Asked Quantity:</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        value={askedQuantity}
                                        onChange={(e) => setAskedQuantity(e.target.value)}
                                    />
                                </div>
                            </form>
                        </div>
                        <div className="modal-footer">
                            <button
                                type="button"
                                className="btn btn-secondary"
                                data-dismiss="modal"
                                onClick={closeModal}
                            >
                                Close
                            </button>
                            <button
                                type="button"
                                className="btn btn-primary"
                                onClick={handleSubmit}
                            >
                                Submit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}







