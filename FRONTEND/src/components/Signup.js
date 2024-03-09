import { React, useEffect, useState } from 'react'

export default function Signup(props) {
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [contactNumber, setContactNumber] = useState('');
    const [dob, setDob] = useState('');
    const [nid, setNid] = useState('');
    const [city, setCity] = useState('');
    const [state, setState] = useState('');
    const [zipCode, setZipCode] = useState('');
    const [country, setCountry] = useState('');
    const [creditCardNumber, setCreditCardNumber] = useState('');
    const [creditCardType, setCreditCardType] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [status, setStatus] = useState(false);


    const onsubmitform = async (e) => {
        try {
            if (!email || !password || !firstName || !lastName || !contactNumber || !dob || !nid || !city || !state || !zipCode || !country || !creditCardNumber || !creditCardType) {
                alert("please fill all the fields");
                return;
            }

            else if (password !== confirmPassword) {
                alert("password does not match");
                return;
            }
            else if (password.length < 6) {
                alert("password must be at least 6 characters");
                return;
            }
            else if (nid.length < 10) {
                alert("nid must be at least 10 characters");
                return;
            }
            else if (contactNumber.length < 11) {
                alert("contact number must be at least 11 characters");
                return;
            }
            else if (!isValidEmail(email)) {
                alert("Invalid email address");
                return;
            }
            else {

                e.preventDefault();
                try {
                    const body = { firstName, lastName, contactNumber, dob, nid, city, state, zipCode, country, creditCardNumber, creditCardType, email, password };

                    const response = await fetch("http://localhost:3000", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(body)
                    });
                    if (response.status === 200) {
                        alert("Registered successfully");
                        setStatus(true);
                        const user = [firstName, lastName, contactNumber, dob, nid, city, state, zipCode, country, creditCardNumber, creditCardType, email, password];
                        props.updateUserDescription(user);
                        props.buttonhandler();
                        // var signupForm = document.getElementById('signupform');
                        // var formElements = form.elements;
                        // signupForm.style.display = "none";
                        // for (var i = 0; i < formElements.length; i++) {
                        //     formElements[i].disabled = true;
                        // }

                    }

                }
                catch (error) {
                    console.error(error.message);
                    console.log("signup error");
                }

            }


        } catch (error) {
            console.error(error.message);
            console.log("signup outside error");
        }

    }

    const isValidEmail = (email) => {
        // Using a simple regex to check for the "@" symbol
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    };

    return (

        <div className="modal fade" id="SignUpModal" tabIndex="-1" aria-labelledby="SignUpModalLabel" aria-hidden="true">
            <div className="modal-dialog">
                <div className="modal-content">
                    <div className="modal-header">
                        <h1 className="modal-title fs-5" id="exampleModalLabel">GET A CODEBYTEMART ACCOUNT!!</h1>
                        <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div className="modal-body">
                        <form id="signupform">

                            <div className="form-floating mb-3">


                                <input type="text" className="form-control" id="firstName" placeholder="Enter First Name" required value={firstName}
                                    onChange={e => setFirstName(e.target.value)} />
                                <label htmlFor="firstName">First Name</label>

                            </div>
                            <div className="form-floating mb-3">

                                <input type="text" className="form-control" id="lastName" placeholder="Enter Last Name" required value={lastName}
                                    onChange={e => setLastName(e.target.value)} />

                                <label htmlFor="lastName">Last Name</label>

                            </div>

                            <div className="form-floating mb-3">
                                <input type="email" className="form-control" id="floatingInput" placeholder="name@example.com" value={email}
                                    onChange={e => setEmail(e.target.value)} />
                                <label htmlFor="floatingInput">Email address</label>
                            </div>
                            <div className="form-floating mb-3">
                                <input type="password" className="form-control" id="floatingConfirmPassword" placeholder="Password" value={password}
                                    onChange={e => setPassword(e.target.value)} />
                                <label htmlFor="floatingPassword">Password</label>
                            </div>

                            <div className="form-floating mb-3">
                                <input type="password" className="form-control" id="floatingPassword" placeholder="confirmPassword" value={confirmPassword}
                                    onChange={e => setConfirmPassword(e.target.value)} />
                                <label htmlFor="floatingConfirmPassword">Confirm Password</label>
                            </div>

                            <div className="form-floating mb-3">


                                <input type="tel" className="form-control" id="contactNumber" placeholder="Enter Contact Number" required value={contactNumber}
                                    onChange={e => setContactNumber(e.target.value)} />
                                <label htmlFor="contactNumber">Contact Number</label>

                            </div>
                            <div className="form-floating mb-3">


                                <input type="date" className="form-control" id="dob" required value={dob}
                                    onChange={e => setDob(e.target.value)} />

                            </div>



                            <div className="form-floating mb-3">


                                <input type="text" className="form-control" id="nid" placeholder="Enter NID" required value={nid}
                                    onChange={e => setNid(e.target.value)} />
                                <label htmlFor="nid">NID</label>

                            </div>



                            <div className="form-floating mb-3">


                                <select className="form-control" id="city" required value={city}
                                    onChange={e => setCity(e.target.value)}>
                                    <option value="">Select City</option>
                                    <option value="New York City">New York City</option>
                                    <option value="Albany">Albany</option>
                                    <option value="Buffalo">Buffalo</option>
                                    <option value="Rochester">Rochester</option>
                                    <option value="Syracuse">Syracuse</option>
                                    <option value="Yonkers">Yonkers</option>
                                </select>

                            </div>
                            <div className="form-floating mb-3">


                                <select className="form-control" id="state" required value={state}
                                    onChange={e => setState(e.target.value)}>
                                    <option value="">Select State</option>

                                    <option value="CA">California</option>
                                    <option value="FL">Florida</option>
                                    <option value="GA">Georgia</option>
                                    <option value="HI">Hawaii</option>
                                    <option value="IN">Indiana</option>
                                    <option value="MA">Massachusetts</option>
                                    <option value="MI">Michigan</option>
                                    <option value="MS">Mississippi</option>

                                    <option value="NH">New Hampshire</option>
                                    <option value="NJ">New Jersey</option>
                                    <option value="NM">New Mexico</option>
                                    <option value="NY">New York</option>
                                    <option value="NC">North Carolina</option>
                                    <option value="ND">North Dakota</option>
                                    <option value="OH">Ohio</option>
                                    <option value="OK">Oklahoma</option>

                                    <option value="PA">Pennsylvania</option>

                                    <option value="TX">Texas</option>

                                    <option value="VA">Virginia</option>
                                    <option value="WA">Washington</option>
                                    <option value="WV">West Virginia</option>

                                </select>

                            </div>
                            <div className="form-floating mb-3">


                                <input type="text" className="form-control" id="zipCode" placeholder="Enter Zip Code" required value={zipCode}
                                    onChange={e => setZipCode(e.target.value)} />
                                <label htmlFor="zipCode">Zip Code</label>

                            </div>



                            <div className="form-floating mb-3">


                                <select className="form-control" id="country" required value={country}
                                    onChange={e => setCountry(e.target.value)}>
                                    <option value="">select country</option>
                                    <option value="United States">United States</option>


                                </select>

                            </div>



                            <div className="form-floating mb-3">


                                <input type="text" className="form-control" id="creditCardNumber" placeholder="Enter Credit Card Number" required
                                    data-inputmask="'mask': '9999 9999 9999 9999'" data-mask value={creditCardNumber}
                                    onChange={e => { setCreditCardNumber(e.target.value) }} />
                                <label htmlFor="creditCardNumber">Credit Card Number</label>

                            </div>
                            <div className="form-floating mb-3">


                                <select className="form-control" id="creditCardType" required value={creditCardType}
                                    onChange={e => setCreditCardType(e.target.value)} >
                                    <option value="">Select Credit Card Type</option>
                                    <option value="visa">Visa</option>
                                    <option value="mastercard">MasterCard</option>
                                    <option value="amex">American Express</option>
                                    <option value="discover">Discover</option>
                                    {/* <!-- Add more options if needed --> */}
                                </select>

                            </div>


                            <button type="submit" className="btn btn-primary mt-2" onClick={onsubmitform}>Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}
