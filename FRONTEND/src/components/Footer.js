import React from 'react'
import { Link } from 'react-router-dom'

export default function Footer() {
  return (
    <footer className="bg-dark text-light mt-5">
      <div className="container py-4">
        <div className="row">
          <div className="col-md-4">
            <h5 className="mb-4">Contact Us</h5>
            <p>Email: 2105019@ugrad.cse.buet.ac.bd</p>
            <p>Email: 2105021@ugrad.cse.buet.ac.bd</p>
            <p>Phone: +880 1318449064</p>
          </div>
          <div className="col-md-4">
            <h5 className="mb-4">Quick Links</h5>
            <ul className="list-unstyled">
              <li><Link to="/" className="text-light">Home</Link></li>
              <li><Link to="/product" className="text-light">Shop</Link></li>
              <li><Link href="#" className="text-light">About Us</Link></li>
              <li><Link href="#" className="text-light">Contact</Link></li>
            </ul>
          </div>
          <div className="col-md-4">
            <h5 className="mb-4">Follow Us</h5>
            <ul className="list-unstyled">
              <li><Link to="#" className="text-light"><i className="fab fa-facebook-f me-2"></i>Facebook</Link></li>
              <li><Link to="#" className="text-light"><i className="fab fa-twitter me-2"></i>Twitter</Link></li>
              <li><Link to="#" className="text-light"><i className="fab fa-instagram me-2"></i>Instagram</Link></li>
            </ul>
          </div>
        </div>
      </div>
      <div className="text-center py-3 bg-secondary">
        <p className="mb-0">&copy; 2024 Your Gadgets Store. All rights reserved.</p>
      </div>
    </footer>
  )
}
