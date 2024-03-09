import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PriceOfferView from './PriceOfferView';

export default function LaunchNewProduct() {
    const [selectedCategory, setSelectedCategory] = useState('');
    const [selectedSubcategory, setSelectedSubcategory] = useState('');
    const [productName, setProductName] = useState('');
    const [brandName, setBrandName] = useState('');
    const [specification, setSpecification] = useState('');
    const [productQuantity, setProductQuantity] = useState('');
    const [proposedPrice, setProposedPrice] = useState('');
    const navigate = useNavigate();
    const categories = [
        { id: 1, name: "pc accessories", subcategories: ["mouse", "keyboard", "monitor", "headphone", "speaker", "webcam", "microphone", "ups", "printer", "scanner", "projector", "processor"] },
        { id: 2, name: "laptop", subcategories: ["gaming laptop", "business laptop", "student laptop"] },
        { id: 3, name: "mobile", subcategories: ["gaming mobile", "feature mobile", "smartphone"] },

        { id: 4, name: "camera", subcategories: ["dslr camera", "mirrorless camera", "action camera"] },
        { id: 5, name: "tv", subcategories: ["smart tv", "oled tv"] },
        { id: 6, name: "others", subcategories: ["smart watch", "smart band", "smart speaker", "drone", "smart toy"] },
    ]

    const handleSubmit = async (event) => {
        event.preventDefault();
        // Add your logic to handle form submission here
        // You can use the state variables (categoryName, subcategoryName, etc.) to access the form values

        console.log('Product Name:', productName);
        console.log('Brand Name:', brandName);
        console.log('Specification:', specification);
        console.log('Product Quantity:', productQuantity);
        console.log('Proposed Price:', proposedPrice);

        const body = { productName, brandName, specification, selectedCategory, selectedSubcategory, productQuantity, proposedPrice }
        try {
            const response = await fetch("http://localhost:3000/launchNewProduct", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                console.log("requested to launch a product successfully");
                navigate('/');

            }
            else {
                console.log("Failed to launch product");
            }
        } catch (error) {
            console.error("Error:", error);
        }
    };

    const handleCategoryChange = (e) => {
        setSelectedCategory(e.target.value);
        // Reset subcategory when category changes
        setSelectedSubcategory('');
    };

    const handleSubcategoryChange = (e) => {
        setSelectedSubcategory(e.target.value);
    };

    return (
        <div className='container'>
            <div style={{ maxWidth: '600px', margin: 'auto' }}>
                <form onSubmit={handleSubmit} style={{ backgroundColor: '#f8f9fa', padding: '20px', borderRadius: '10px', boxShadow: '0 0 10px rgba(0, 0, 0, 0.1)' }}>
                    <h2 style={{ marginBottom: '20px' }}>Launch New Product</h2>
                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Category:</label>
                        <select
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={selectedCategory}
                            onChange={handleCategoryChange}
                            required
                        >
                            <option value="" disabled>Select Category</option>
                            {categories.map(category => (
                                <option key={category.id} value={category.name}>{category.name}</option>
                            ))}
                        </select>
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Subcategory:</label>
                        <select
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={selectedSubcategory}
                            onChange={handleSubcategoryChange}
                            required
                        >
                            <option value="" disabled>Select Subcategory</option>
                            {selectedCategory &&
                                categories.find(category => category.name === selectedCategory)?.subcategories.map(subcategory => (
                                    <option key={subcategory} value={subcategory}>{subcategory}</option>
                                ))
                            }
                        </select>
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Product Name:</label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={productName}
                            onChange={(e) => setProductName(e.target.value)}
                            required
                        />
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Brand Name:</label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={brandName}
                            onChange={(e) => setBrandName(e.target.value)}
                            required
                        />
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Specification:</label>
                        <textarea
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={specification}
                            onChange={(e) => setSpecification(e.target.value)}
                            required
                        ></textarea>
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Product Quantity:</label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={productQuantity}
                            onChange={(e) => setProductQuantity(e.target.value)}
                            required
                        />
                    </div>

                    <div className="form-group" style={{ marginBottom: '15px' }}>
                        <label style={{ fontWeight: 'bold' }}>Proposed Price:</label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ width: '100%', padding: '10px', borderRadius: '5px', border: '1px solid #ced4da' }}
                            value={proposedPrice}
                            onChange={(e) => setProposedPrice(e.target.value)}
                            required
                        />
                    </div>

                    <button type="submit" className="btn btn-primary" style={{ marginTop: '20px' }}>Submit</button>
                </form>

            </div>
            <div className="container">

                <PriceOfferView />
            </div>
        </div>

    );
}
