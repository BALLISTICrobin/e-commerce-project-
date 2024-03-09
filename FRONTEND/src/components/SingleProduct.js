import React, { useState,useEffect } from 'react'
import Readmore from './Readmore';
import { NavLink } from 'react-router-dom';

export default function SingleProduct(props) {
    const {productname,brandname,specification,price,discountoffer,rating,productquantity,subcategoryid,productlink}=props.product;
    // const {imageId,setImageId}=useState(props.imageId);
    const imageId = subcategoryid;
    const productinfo={productname,brandname,specification,price,discountoffer,rating};
    const [isAdmin, setIsAdmin] = React.useState(props.isAdmin);
  return (
    // <NavLink to={{ pathname: `/Readmore/${productname}`,state:{productinfo} }} style={{ textDecoration: 'none' }}>
    <NavLink to = {`/Readmore/${productname}`} >
    <div className="card mb-3" style={{ maxWidth: '100%' }}>
    <div className="row g-0">
      <div className="col-md-4">
      <img src={`${productlink}`} className="img-fluid rounded-start" alt={`Image for Subcategory ID ${subcategoryid}`}/>
      </div>
      <div className="col-md-8">
        <div className="card-body">
          <h3 className="card-title">{productname}</h3>
          <p classNameName="card-text">rating:{rating}</p>
          <h5 className="card-text">{brandname}</h5>
          <p className="card-text">{specification}</p>
          <h4 className="card-text">${price}</h4>
          <p className="card-text"><small className="text-muted">discount offer: {discountoffer}%</small></p>
          {/* <button type="button" class="btn btn-dark" onClick={handleReadMore}>read more</button> */}
        </div>
      </div>
    </div>
  </div>
  </NavLink>
  )
}
