import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';


import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS

export default function Suggestions(props) {
    const [subcategoryid, setSubcategoryid] = useState(props.subcatid);
    const [suggestions, setSuggestions] = useState(null);
    const [activeIndex, setActiveIndex] = useState(0);

    const getSuggestions = async () => {
        const body = { subcategoryid };
        try {
            const response = await fetch("http://localhost:3000/getSuggestions", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body),
            });
            if (response.status === 200) {
                const responseData = await response.json();
                console.log(responseData);
                setSuggestions(responseData);
            } else {
                console.log("No suggestions found");
            }
        } catch (error) {
            console.error(error.message);
        }
    };

    useEffect(() => {
        getSuggestions();
    }, [subcategoryid]);

    const handleNext = () => {
        setActiveIndex((prevIndex) => (prevIndex + 1) % suggestions.length);
    };

    const handlePrev = () => {
        setActiveIndex((prevIndex) =>
            prevIndex === 0 ? suggestions.length - 1 : prevIndex - 1
        );
    };

    return (
        <div className="container-fluid">
            <h3 style={{ fontFamily: 'Arial, sans-serif' }}>Related products with free delivery on eligible orders</h3>

            <div id="carouselExampleControls" className="carousel slide" data-ride="carousel">
                <div className="carousel-inner">
                    {suggestions &&
                        suggestions.map((suggestion, index) => (
                            <div
                                key={index}
                                className={`carousel-item ${index === activeIndex ? 'active' : ''}`}
                                
                            >
                                <Link to={`/Readmore/${suggestion.productname}`} className="text-decoration-none">
                                    <div className="card suggestion-card">
                                        <img
                                            src={`${suggestion.productlink}`}
                                            className="card-img-top"
                                            alt={`Slide ${index + 1}`}
                                            style={{ width: '50%', height: '300px', alignContent: 'center'}}
                                        />
                                        <div className="card-body">
                                            <h5 className="card-title">{suggestion.productname}</h5>
                                            <p className="card-text">{suggestion.specification}</p>
                                        </div>
                                    </div>
                                </Link>
                            </div>
                        ))}
                </div>
                <a className="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" onClick={handlePrev}>
                    <span className="carousel-control-prev-icon" aria-hidden="false" />
                    <span className="sr-only" style={{ color: '#3498db' }}>Previous</span>
                </a>
                <a className="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" onClick={handleNext}>
                    <span className="carousel-control-next-icon" aria-hidden="false" />
                    <span className="sr-only" style={{ color: '#3498db' }}>Next</span>
                </a>
            </div>
        </div>
    );
}
