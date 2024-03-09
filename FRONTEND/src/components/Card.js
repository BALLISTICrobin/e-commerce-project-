import React from 'react'
import { NavLink } from 'react-router-dom'

export default function Card() {
  return (
<div className="card-group mt-4 ">
  
  <div className="card rounded mx-3" >
  <NavLink to ="/techdeals" >
    <img src="https://img.freepik.com/premium-psd/cyber-monday-sale-composition-mock-up_23-2148659811.jpg?w=2000" className="card-img-top" alt="..."/>
    </NavLink>
    <div className="card-body">
      <h5 className="card-title">Get Latest Tech Deals</h5>
      <p className="card-text">Explore our wide range of cutting-edge gadgets and enjoy exclusive deals on the latest technology. From smartphones to smartwatches, find the perfect device to elevate your digital experience.</p>
      <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  
  <div className="card mx-3">
    <img src="https://img.freepik.com/premium-photo/vr-headphone-laptop-blue-background-concept-vr-game-simulate-technology_34777-318.jpg?w=1800" className="card-img-top" alt="..."/>
    <div className="card-body">
      <h5 className="card-title">Immerse Yourself in Virtual Reality</h5>
      <p className="card-text">Step into the future with our top-notch VR gadgets. Experience immersive gaming, virtual travel, and more. Elevate your senses with the latest VR technology available at unbeatable prices.</p>
      <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div className="card mx-3">
    <img src="https://img.freepik.com/free-photo/medium-shot-man-wearing-vr-glasses_23-2149126949.jpg?w=2000&t=st=1705885787~exp=1705886387~hmac=14abf64262715e7a6b3157827e9bc3e52044c64a37fc42ef53de038f912560ef" className="card-img-top" alt="..."/>
    <div className="card-body">
      <h5 className="card-title">Tech Lifestyle Redefined</h5>
      <p className="card-text">Upgrade your lifestyle with our high-tech gadgets. Whether you're a tech enthusiast or a casual user, we have the perfect devices to enhance your daily routines. Embrace the future of technology today!</p>
      <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>
  )
}
