import { useEffect, useState } from 'react'
import React from 'react'
import Signup from './Signup'
import Userinfomodal from './Userinfomodal'
import Login from './login';
import { Link } from 'react-router-dom';




export default function Navbar(props) {

    const [userDescription, setUserDescription] = useState([]);
    const [customerid, setcustomerid] = useState(0);
    const [loginbutton, setloginbutton] = useState(true);
    const [signupbutton, setsignupbutton] = useState(true);
    const [signOutbutton, setsignOutbutton] = useState(false);
    const [username, setusername] = useState('');
    const [totalItem, setTotalItem] = useState(0);
    const [isAdmin, setIsAdmin] = useState(false);
    const [isImporter, setIsImporter] = useState(false);
    const [importerAgName, setimporterAgName] = useState(null);

    const updateUserDescription = (newDescription) => {
        setUserDescription(newDescription);
        setusername(newDescription[0] + " " + newDescription[1]);
        props.updateInfo(newDescription);
    };

    const updateImporterId = (newID) => {
        props.updImpId(newID);
    }

    const updateImporterAgName = (newName) => {
        setimporterAgName(newName);
    }

    const updateCustomerID = (newID) => {
        setcustomerid(newID);
        props.updateId(newID);
    };

    const ckAdmin = (x) => {
        props.checkAdmin(x);
        setIsAdmin(x);
    }

    const ckImporter = (x) => {
        props.checkImporter(x);
        setIsImporter(x);
    }

    const buttonhandler = () => {
        setloginbutton(false);
        setsignupbutton(false);
        setsignOutbutton(true);
        console.log(loginbutton);
        console.log(signupbutton);
    }

    const getTotalItem = async () => {
        const body = { customerid };
        try {
            const response = await fetch("http://localhost:3000/getTotalItem", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)

            })
            if (response.status === 200) {
                const responseData = await response.json();
                setTotalItem(responseData[0].count);
            }
            else {
                console.log("Failed to get total item");
            }
        }
        catch (error) {
            console.error(error.message);
        }
    }

    useEffect(() => {
        getTotalItem();
    }, []);
    return (
        <>

            <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-top mb-5">
                <div className="container-fluid">
                    <a className="navbar-brand" href="#">codebytemart</a>
                    <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                            <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/">Home</Link>
                            </li>

                            {isImporter!=true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/product">Product</Link>

                            </li>}
                            {isAdmin != true && <li className="nav-item">
                                {username !== '' && (
                                    <Link className="nav-link active position-relative" aria-current="page" to="/cart">
                                        Cart
                                        {/* <span className="badge rounded-pill bg-danger position-absolute top-0 start-100 translate-middle">
                                            {totalItem}
                                            <span className="visually-hidden">cart items</span>
                                        </span> */}
                                    </Link>
                                )}
                            </li>}

                            {isAdmin != true && <li className="nav-item">
                                {username !== '' && (
                                    <Link className="nav-link active" aria-current="page" to="/order_status">Order Status</Link>
                                )}
                            </li>}
                            {isAdmin != true && <li className="nav-item">
                                {username !== '' && (
                                    <Link className="nav-link active" aria-current="page" to="/order_history_customer">Order History</Link>
                                )}
                            </li>}
                            {isAdmin === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/getOrderStatusAdmin">Order Summary</Link>

                            </li>}

                            {isAdmin === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/order_history">Order History</Link>
                            </li>}

                            {isAdmin === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/update_order_inventory">Update Inventory</Link>
                            </li>}

                            {isAdmin === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/lanch_new_product">Launch New Product</Link>
                            </li>}

                            {isImporter === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/reqForUpdatingExistingProduct">Updating Existing Product</Link>
                                </li>}
                            {isImporter === true && <li className="nav-item">
                                <Link className="nav-link active" aria-current="page" to="/reqForSupplyingNewProduct"> Supplying New Product</Link>
                            </li>}




                        </ul>
                        {/* <!-- Button trigger modal --> */}
                        {signOutbutton === true && username!='' && isAdmin != true && isImporter!=true && <button type="button" className="btn btn-outline-success image-btn" data-bs-toggle="modal" data-bs-target="#userinfo" style={{ borderRadius: '2px', paddingRight: '5px', border: 'none', background: 'transparent' }}>
                            <div className="container">
                                <img src="https://img.freepik.com/premium-vector/art-illustration_890735-11.jpg?w=1060" alt="Image Button" style={{ maxWidth: '100%', borderRadius: '25px', height: '40px' }} />
                            </div>
                        </button>}

                        {signOutbutton === true && isAdmin === true && (
                            <button type="button"
                            style={{ borderRadius: '2px', paddingRight: '5px', border: 'none', background: 'transparent' }}>
                            <div className="container d-flex">
                                <img
                                    src="https://www.creativefabrica.com/wp-content/uploads/2022/10/25/Support-Admin-icon-Graphics-43209390-1.jpg"
                                    alt="Image Button"
                                    style={{ width: '40px', height: '40px', borderRadius: '50%', marginRight: '10px', marginLeft: 'auto' }}
                                />
                                <p id="username" style={{ color: 'white' }}>
                                    ADMIN
                                </p>
                            </div>
                        </button>
                        )}

                        {signOutbutton === true && isImporter=== true && <button type="button"
                        style={{ borderRadius: '2px', paddingRight: '5px', border: 'none', background: 'transparent' }}>
                            <div className="container">
                                <img src="https://w7.pngwing.com/pngs/532/473/png-transparent-computer-icons-logistics-import-ship-management-border-blue-angle-company.png" alt="Image Button" style={{ maxWidth: '100%', borderRadius: '25px', height: '40px' }} />
                            </div>
                        </button>}



                        {signOutbutton === true && username!='' && <div className="mx-2">
                            <p id="username" style={{ color: 'white' }}>{username}</p>
                        </div>}
                        
                        {signOutbutton === true && isImporter==true && <div className="mx-2">
                            <p id="username" style={{ color: 'white' }}>{importerAgName}</p>
                        </div>}
                        {/* <form className="d-flex" role="search">
                            <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                            <button className="btn btn-outline-success" type="submit">Search</button>


                        </form> */}
                        <div className="mx-2">
                            {loginbutton === true && <button className="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#LoginModal" disabled={!loginbutton}>Login</button>}
                            {signupbutton === true && <button className="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#SignUpModal" disabled={!signupbutton}>Sign up</button>}
                            {signOutbutton === true && <button className="btn btn-outline-danger" onClick={() => { setloginbutton(true); setsignupbutton(true); setsignOutbutton(false); setUserDescription([]); setusername(''); ckAdmin(false); ckImporter(false) }}>Sign Out</button>}
                        </div>
                    </div>
                </div>
            </nav>

            <div className="my-2">
                <p>dduhud </p>
            </div>



            <Userinfomodal user={userDescription} />

            <Login updateUserDescription={updateUserDescription} buttonhandler={buttonhandler} updateId={updateCustomerID} chkAdmin={ckAdmin} chkImporter={ckImporter} updateImporterInfo={updateImporterAgName} updateImpId={updateImporterId}/>

            <Signup updateUserDescription={updateUserDescription} buttonhandler={buttonhandler} />
        </>
    )

}
