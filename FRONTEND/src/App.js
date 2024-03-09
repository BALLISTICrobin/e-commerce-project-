
import './App.css';
import Card from './components/Card';
import Navbar from './components/Navbar';
import Slider from './components/Slider';
import { useState } from 'react';
import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom";

import Product from './components/Product';
import Readmore from './components/Readmore';
import Cart from './components/Cart';
import Checkout from './components/Checkout';
import Order_status from './components/Order_status';
import Footer from './components/Footer';
import AdminOrderView from './components/AdminOrderView';
import OrderHistory from './components/OrderHistory';
import OrderHistoryCustomer from './components/OrderHistoryCustomer';
import UpdateInventory from './components/UpdateInventory';
import LaunchNewProduct from './components/LaunchNewProduct';
import UpdateInventoryImporter from './components/UpdateInventoryImporter';
import SupplyProducts from './components/SupplyProducts';
import TechDeals from './components/TechDeals';

function App() {
  const [customerid, setcustomerid] = useState(0);
  const [userDescription, setUserDescription] = useState([]);
  const [isAdmin, setIsAdmin] = useState(false);
  const [isImporter, setIsImporter] = useState(false);
  const [importerid, setimporterid] = useState(0);

  const updateUserInfo = (newDescription) => {
    setUserDescription(newDescription);
  }
  const updateCustomerID = (newID) => {
    setcustomerid(newID);
  }

  const setAdmin = (x) => {
    setIsAdmin(x);
  }

  const setImporter= (x) => {
    setIsImporter(x);
  }

  const updateImporterId = (newID) => {
    setimporterid(newID);
  }
  return (
    <>
      <Router>
        <Navbar title="codebytemart" updateId={updateCustomerID} updateInfo = {updateUserInfo} checkAdmin={setAdmin} checkImporter={setImporter} updImpId={updateImporterId}/>
        <Routes>
          <Route exact path="/" element={<>
            <Slider />
            <Card />
          </>} />
          {isImporter!=true && <Route exact path="/product" element={<Product isadmin={isAdmin}/>} />}
          {isImporter!=true && <Route exact path="/Readmore/:id" element={<Readmore userInfo ={userDescription} userId ={customerid} isAdmin={isAdmin}/>}  />}
          {isAdmin!=true && <Route exact path ="/cart" element={<Cart userid ={customerid}></Cart>} />}
          {isAdmin!=true && <Route exact path ="/checkout/:totalPrice" element= {<Checkout userid ={customerid}/>} />}
          {isAdmin!=true && <Route exact path="/order_status" element={<Order_status userid={customerid}/>} />}
          {isAdmin!=true && <Route exact path="/order_history_customer" element={<OrderHistoryCustomer userid ={customerid}/>} />}
          {isAdmin===true && <Route exact path="/getOrderStatusAdmin" element={<AdminOrderView/>} />}
          {isAdmin===true && <Route exact path="/order_history" element={<OrderHistory/>} />}
          {isAdmin===true && <Route exact path ="/update_order_inventory" element = {<UpdateInventory/>}/>}
          {isAdmin===true && <Route exact path="/lanch_new_product" element={<LaunchNewProduct/>}/> }
          {isImporter===true && <Route exact path="/reqForUpdatingExistingProduct" element={<UpdateInventoryImporter importerid ={importerid}/>} /> }
          {isImporter===true && <Route exact path="/reqForSupplyingNewProduct" element={<SupplyProducts importerid ={importerid}/>} /> }
          {isImporter!=true && isAdmin!=true && <Route exact path="/techDeals" element ={<TechDeals/>}/>}
        </Routes>
        <Footer />
      </Router>
    </>
  );
}

export default App;

