import React, { useState, useEffect } from 'react';
import { NavLink } from 'react-router-dom';

export default function TechDeals() {
    const [top3ExpensiveLaptops, setTop3ExpensiveLaptops] = useState([]);
    const [top3ExpensiveSmartphones, setTop3ExpensiveSmartphones] = useState([]);
    const [bestLaptopForStudents, setBestLaptopForStudents] = useState({});
    const [bestSellers, setBestSellers] = useState([]);


    const fetchTop3ExpensiveLaptops = async () => {
        try {
            const response = await fetch('/getTop3ExpensiveGamingLaptops');
            const data = await response.json();
            setTop3ExpensiveLaptops(data);
        } catch (error) {
            console.error('Error fetching top 3 expensive laptops:', error);
        }
    };

    const fetchTop3ExpensiveSmartphones = async () => {
        try {
            const response = await fetch('/getTop3ExpensiveSmartphones');
            const data = await response.json();
            setTop3ExpensiveSmartphones(data);
        } catch (error) {
            console.error('Error fetching top 3 expensive smartphones:', error);
        }
    };

    const fetchBestLaptopForStudents = async () => {
        try {
            const response = await fetch('/bestLaptopForStudents');
            const data = await response.json();
            setBestLaptopForStudents(data[0]); // Assuming the API returns a single laptop
        } catch (error) {
            console.error('Error fetching best laptop for students:', error);
        }
    };

    const fetchBestSellers = async () => {
        try {
            const response = await fetch('/getBestSellers');
            const data = await response.json();
            setBestSellers(data);
        } catch (error) {
            console.error('Error fetching best sellers:', error);
        }
    };

    useEffect(() => {
        fetchTop3ExpensiveLaptops();
        fetchTop3ExpensiveSmartphones();
        fetchBestLaptopForStudents();
        fetchBestSellers();
    }, []);
    return (
        <div className="container my-2">
            {/* Render cards for top 3 expensive laptops */}
            <h2>Top 3 Expensive Laptops</h2>
            <div className="row">
                {top3ExpensiveLaptops.length > 0 ? (
                    top3ExpensiveLaptops.map((laptop, index) => (
                        <div key={index} className="col-md-4 mb-3">
                            {/* Render card for each laptop */}
                            <NavLink to={`/Readmore/${laptop.productname}`}>
                            <div className="card">
                                <div className="card-body">
                                    {/* Display laptop details */}
                                    <h5 className="card-title">{laptop.productname}</h5>
                                    <p className="card-text">Price: ${laptop.price}</p>
                                    {/* Add more details as needed */}
                                </div>
                            </div>
                            </NavLink>
                        </div>
                    ))
                ) : (
                    <p>No top 3 expensive laptops found.</p>
                )}
            </div>

            {/* Render cards for top 3 expensive smartphones */}
            <h2>Top 3 Expensive Smartphones</h2>
            <div className="row">
                {top3ExpensiveSmartphones.length > 0 ? (
                    top3ExpensiveSmartphones.map((smartphone, index) => (
                        <div key={index} className="col-md-4 mb-3">
                            {/* Render card for each smartphone */}
                            <NavLink to={`/Readmore/${smartphone.productname}`}>
                            <div className="card">
                                <div className="card-body">
                                    {/* Display smartphone details */}
                                    <h5 className="card-title">{smartphone.productname}</h5>
                                    <p className="card-text">Price: ${smartphone.price}</p>
                                    {/* Add more details as needed */}
                                </div>
                            </div>
                            </NavLink>
                        </div>
                    ))
                ) : (
                    <p>No top 3 expensive smartphones found.</p>
                )}
            </div>

            {/* Render card for best laptop for students */}
            <h2>Best Laptop for Students</h2>
            <div className="row">
                {/* Render card for best laptop */}
                <NavLink to={`/Readmore/${bestLaptopForStudents.productname}`}>
                <div className="col-md-4">
                    <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">{bestLaptopForStudents.productname}</h5>
                            <p className="card-text">Price: ${bestLaptopForStudents.price}</p>
                            {/* Add more details as needed */}
                        </div>
                    </div>
                </div>
                </NavLink>
            </div>
            {/* Render cards for best sellers */}
            <h2>Best Sellers</h2>
            <div className="row">
                {bestSellers.length > 0 ? (
                    bestSellers.map((seller, index) => (
                        <div key={index} className="col-md-4 mb-3">
                            {/* Render card for each best seller */}
                            <NavLink to={`/Readmore/${seller.productname}`}>
                            <div className="card">
                                <div className="card-body">
                                    {/* Display seller details */}
                                    <h5 className="card-title">{seller.productname}</h5>
                                    <p className="card-text">Price: ${seller.price}</p>
                                    {/* Add more details as needed */}
                                </div>
                            </div>
                            </NavLink>
                        </div>
                    ))
                ) : (
                    <p>No best sellers found.</p>
                )}
            </div>
        </div>
    )
}
