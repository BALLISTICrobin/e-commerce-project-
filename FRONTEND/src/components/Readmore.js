import React, { useState, useEffect } from 'react'
import Comment from './Comment';
import { useLocation, useParams,useNavigate } from 'react-router-dom';
import Suggestions from './Suggestions';

export default function Readmore(props) {

    // const {productname,brandname,specification,price,discountoffer,rating}=productInfo;
    const [userId, setUserId] = useState(props.userId);
    const [userInfo, setUserInfo] = useState(props.userInfo);
    const [review, setReview] = useState(null);
    const [Rating, setrating] = useState(0);
    const [quantity, setQuantity] = useState(1);
    const { id } = useParams();
    const [productid, setProductId] = useState(0);
    const [productname, setProductname] = useState(null);
    const [brandname, setBrandname] = useState(null);
    const [productquantity, setProductquantity] = useState(null);
    const [specification, setSpecification] = useState(null);
    const [price, setPrice] = useState(null);
    const [discountoffer, setDiscountoffer] = useState(null);
    const [rating, setRating] = useState(null);
    const [subcategoryid, setSubcategoryid] = useState(0);
    const [comment, setComment] = useState(null);
    const [isAdmin, setIsAdmin] = useState(props.isAdmin);
    const [productlink, setProductlink] = useState(null);
    const [reqquantity,setreqquantity] = useState(0);
    const navigate = useNavigate();
    const getReview = async () => {
        //fetch data from backend
        const body = { id };
        try {
            const response = await fetch("http://localhost:3000/getReview", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                setComment(responseData);
            }
            else {
                alert("No review found");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const getProductInfo = async () => {
        const body = { id };
        try {
            const response = await fetch("http://localhost:3000/getProductInfo", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                console.log(responseData);
                setProductId(responseData[0].productid);
                setProductname(responseData[0].productname);
                setBrandname(responseData[0].brandname);
                setProductquantity(responseData[0].productquantity);
                setSpecification(responseData[0].specification);
                setPrice(responseData[0].price);
                setDiscountoffer(responseData[0].discountoffer);
                setRating(responseData[0].rating);
                setSubcategoryid(responseData[0].subcategoryid);
                setProductlink(responseData[0].productlink);

            }
            else {
                console.log("No product found");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const submitReview = async () => {
        if(userId===0){
            alert("Please login to submit review");
            return;
        }
        const body = { userId, productid, review, Rating };
        try {
            const response = await fetch("http://localhost:3000/submitReview", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if (response.status === 200) {
                const responseData = await response.json();
                console.log(responseData);
                getReview();
                getProductInfo();
            }
            else if(response.status === 400){
                const responseData = await response.json();
                alert(responseData.error);
            }
            else {
                alert("No review found");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const decrement = () => {
        if (quantity > 1) {
            setQuantity(quantity - 1);
        }
    }

    const increment = () => {
        setQuantity(quantity + 1);
    }

    const addToCart = async() => {
        if(userId===0){
            alert("Please login to add to cart");
            return;
        }
        const body = { userId, productid, quantity };
        try {
            const response = await fetch("http://localhost:3000/addToCart", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if(response.status === 200){
                const responseData = await response.json();
                alert(responseData.message);
            }
            else if(response.status === 500){
                const responseData = await response.json();
                alert(responseData.error);
            }
            else{
                alert("your item is not added to cart");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const deleteProduct = async() => {
        const body = { productid };
        try {
            const response = await fetch("http://localhost:3000/deleteProduct", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if(response.status === 200){
                const responseData = await response.json();
                alert(responseData.message);
                navigate("/product");
            }
            else if(response.status === 500){
                const responseData = await response.json();
                alert(responseData.error);
            }
            else{
                alert("your item is not deleted");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    const reqToAdmin = async(productid,reqquantity) => {
        const body = { productid,reqquantity};
        try{
            const response = await fetch("http://localhost:3000/reqToAdmin", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })
            if(response.status === 200){
                const responseData = await response.json();
                alert(responseData.message);
               
            }
            else{
                alert("your request is not sent");
            }
        
        }
        catch (error) {
            console.error(error.message);
        }
    }


    useEffect(() => {
        getReview();
        getProductInfo();
    }, [id]);
    return (
        <div className="container">
            {(productname == null) ? (
                <div>loading.......</div>
            ) : (
                <div class="card mb-3 my-5" style={{ maxWidth: '400px'}}>
                    <div className = "container">
                    <img src={`${productlink}`} class="card-img-top" alt="..." style={{ maxWidth: '100%', height: 'auto' }}/>
                    </div>
                    <div class="card-body">
                        <h3 className="card-title">{productname}</h3>
                        <p classNameName="card-text">rating:{rating}</p>
                        <h5 className="card-text">{brandname}</h5>
                        <p className="card-text">{specification}</p>
                        <h4 className="card-text">${price}</h4>
                        <p className="card-text"><small className="text-muted">discount offer: {discountoffer}%</small></p>
                        
                        {productquantity > 0 ? (
                       (isAdmin!=true)? (<div className="btn-group" role="group">
                            <button type="button" className="btn btn-info" onClick={decrement}>-</button>
                            <span className="mx-2">{quantity}</span>
                            <button type="button" className="btn btn-info" onClick={increment}>+</button>
                            <button type="button" className="btn btn-danger mx-4" onClick={addToCart}>Add to Cart</button>
                        </div>):(
                            <div>
                                <button type="button" className="btn btn-danger mx-4" onClick={deleteProduct}>DELETE</button>
                            </div>
                        )
                    ) : (
                        <div className='container'>
                        <h4 className="text-danger">Out of Stock</h4>
                        <input type="number" className="form-control" placeholder="Enter quantity" onChange={(e) => setreqquantity(e.target.value)} />
                        <button type="button" className="btn btn-danger" onClick={()=>{reqToAdmin(productid,reqquantity)}}>REQUEST</button>
                        </div>
                    )}

                    </div>
                </div>
            )}

            {(subcategoryid !== 0)?(
                <Suggestions subcatid ={subcategoryid}/>
            ):(
                <div>loading.......</div>
            )
                
            }

                <h3>Reviews</h3>
                {isAdmin !== true && (
    <div className="container">
        <div className="input-group mb-3">
            <input
                type="text"
                className="form-control"
                placeholder="Recipient's username"
                aria-label="reviews"
                aria-describedby="basic-addon2"
                onChange={(e) => setReview(e.target.value)}
            />
            <span className="input-group-text" id="basic-addon2">
                <label htmlFor="customRange3" className="form-label">
                    Rating: {Rating}
                </label>
                <input
                    type="range"
                    className="form-range"
                    min="0"
                    max="5"
                    step="0.1"
                    id="customRange3"
                    onChange={(e) => setrating(e.target.value)}
                />
                <button onClick={submitReview}>send</button>
            </span>
        </div>
    </div>
)}


            {(comment === null) ? (


                <div>loading.......</div>


            ) : comment.length > 0 ? (
                <div className="container my-5">
                    
                    <div className="container">
                        {comment.map((c, index) => (
                            <Comment key={index} comment={c} userid={userId} callReview={getReview} callGetProductInfo={getProductInfo}/>
                        ))}

                    </div>
                </div>
            ) :
                <div>No review found</div>
            }

                



        </div>
    )
}
