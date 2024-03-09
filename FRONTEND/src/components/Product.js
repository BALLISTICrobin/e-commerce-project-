import React, { useState, useEffect } from 'react'
import SingleProduct from './SingleProduct';
import { Pagination } from 'react-bootstrap';
import { NavLink } from 'react-router-dom';


export default function Product(props) {

  const [productCat, setProductCat] = useState('');
  const [productSubCat, setProductSubCat] = useState('');
  const [productInfo, setProductInfo] = useState(null);
  const [minprice, setminprice] = useState(0);
  const [maxprice, setmaxprice] = useState(8000);
  const [minrating, setminrating] = useState(0.0);
  const [maxrating, setmaxrating] = useState(5);
  const [search, setSearch] = useState(null);
  const [isAdmin, setIsAdmin] = useState(props.isadmin);

  //newly added
  const [currentPage, setCurrentPage] = useState(1);
  const productsPerPage = 30; // Number of products to display per page
  //

  const [subcategories, setSubcategories] = useState([]);

  const categories = [
    { id: 1, name: "pc accessories", subcategories: ["mouse", "keyboard", "monitor", "headphone", "speaker", "webcam", "microphone", "ups", "printer", "scanner", "projector", "processor"] },
    { id: 2, name: "laptop", subcategories: ["gaming laptop", "business laptop", "student laptop"] },
    { id: 3, name: "mobile", subcategories: ["gaming mobile", "feature mobile", "smartphone"] },

    { id: 4, name: "camera", subcategories: ["dslr camera", "mirrorless camera", "action camera"] },
    { id: 5, name: "tv", subcategories: ["smart tv", "oled tv"] },
    { id: 6, name: "others", subcategories: ["smart watch", "smart band", "smart speaker", "drone", "smart toy"] },
  ]
  const getProduct = async () => {
    const body = { productCat, productSubCat, minprice, maxprice, minrating, maxrating };
    console.log(body);
    try {
      const response = await fetch("http://localhost:3000/getProduct", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
      })
      if (response.status === 200) {
        const responseData = await response.json();

        // Update the state with the new product information
        setProductInfo(responseData);
        console.log(responseData);
      }
      else {
        console.log("No product found");
      }
    } catch (error) {
      console.error(error.message);
    }
  }
  const searchProduct = async (e) => {
    // e.preventDefault();
    const body = { search };
    console.log(body);
    try {
      const response = await fetch("http://localhost:3000/search", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
      })
      if (response.status === 200) {
        const responseData = await response.json();
        setProductInfo(responseData);
        console.log(responseData);
      }
      else {
        console.log("No product found");
      }
    } catch (error) {
      console.error(error.message);
    }
  }




  useEffect(() => {
    // Call getProduct when the component mounts (initial load)
    getProduct();
  }, []);

  useEffect(() => {
    if (search !== null)
      searchProduct();
  }, [search]);

  //newly added
  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const indexOfLastProduct = currentPage * productsPerPage;
  const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
  // const currentProducts = productInfo.slice(indexOfFirstProduct, indexOfLastProduct);
  //
  return (

    <div className="container-fluid my-5">
      

      {/* filtering started */}
      <div className="row my-5">

        <div className="col-md-3 position-fixed bg-light p-3" style={{ height: '100vh', overflowY: 'scroll' }}>
          <div className="mb-3">
            <h5 >Filter Options</h5>
            <form className="d-flex" role="search">
              <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                onChange={e => setSearch(e.target.value)}></input>
              {/* <button className="btn btn-outline-success" type="submit" onClick={searchProduct}>Search</button> */}


            </form>
          </div>
          <div className="mb-3">
            <label htmlFor="category" className="form-label">Category</label>
            <select class="form-select" aria-label="Default select example" value={productCat}
              onChange={e => {
                setProductCat(e.target.value);
                setSubcategories(categories.find(category => category.name === e.target.value).subcategories);
              }}
            >
              <option value="">select category</option>

              {categories.map((category => <option value={category.name}>{category.name}</option>))}


            </select>

            <div id="categoryHelp" className="form-text">Enter category name</div>
          </div>

          <div className="mb-3">
            <label htmlFor="subcategory" className="form-label">Subcategory</label>
            <select class="form-select" aria-label="Default select example" value={productSubCat}
              onChange={e => setProductSubCat(e.target.value)}>

              <option selected>select subcategory</option>
              {subcategories.map((subcategory => <option value={subcategory}>{subcategory}</option>))}


            </select>
          </div>
          <div id="subcategoryHelp" className="form-text">Enter subcategory name</div>
          <div className="container mb-3">
            <label for="customRange1" class="form-label">Min price: {minprice}</label>
            <input type="range" class="form-range" min="0" max="8000" id="customRange1" value={minprice}
              onChange={e => setminprice(e.target.value)}></input>
          </div>
          <div className="container mb-3">
            <label for="customRange2" class="form-label">Max price: {maxprice}</label>
            <input type="range" class="form-range" min="0" max="8000" id="customRange2" value={maxprice}
              onChange={e => setmaxprice(e.target.value)}></input>
          </div>
          <div className="container mb-3">
            <label for="customRange3" class="form-label">Min Rating: {minrating}</label>
            <input type="range" class="form-range" min="0" max="5" step="0.1" id="customRange3" value={minrating}
              onChange={e => setminrating(e.target.value)}></input>
          </div>
          <div className="container mb-3">
            <label for="customRange4" class="form-label">Max Rating: {maxrating}</label>
            <input type="range" class="form-range" min="0" max="5" step="0.1" id="customRange4" value={maxrating}
              onChange={e => setmaxrating(e.target.value)}></input>
          </div>


          <button type="button" class="btn btn-danger" onClick={getProduct} style={{ display: 'block' }}>Search</button>
        </div>
        {/* filtering ended */}

        {/* //updated */}
        <div className="col-md-9 offset-md-3">
    {(productInfo === null) ? (
        <div>loading.......</div>
    ) : productInfo.length > 0 || (productSubCat === '' || productCat === '') ? (
        <div className="container my-5">
            {(productInfo.length > 0) ? (
                productInfo.slice(indexOfFirstProduct, indexOfLastProduct).map((product, index) => (
                    <SingleProduct key={index} product={product} isAdmin={isAdmin} />
                ))
            ) : (
                <p>No products available.</p>
            )}
            <div className="d-flex justify-content-center">
                <Pagination>
                    {Array.from({ length: Math.ceil((productInfo?.length || 1) / productsPerPage) }, (_, index) => (
                        <Pagination.Item
                            key={index}
                            active={index + 1 === currentPage}
                            onClick={() => handlePageChange(index + 1)}
                        >
                            {index + 1}
                        </Pagination.Item>
                    ))}
                </Pagination>
            </div>
        </div>
    ) : (
        <p>No product information available.</p>
    )}
</div>

            {/* //ended */}
      </div>
    </div>
  )
}






