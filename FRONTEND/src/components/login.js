import React,{useState} from 'react'

export default function Login(props) {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    

    const onsubmitform = async (e) => {
        try {
            if (!email || !password ) {
                alert("please fill all the fields");
                return;
            }

            
            else if (password.length < 6) {
                alert("password must be at least 6 characters");
                return;
            }
            
            
            else if (!isValidEmail(email)) {
                alert("Invalid email address");
                return;
            }
            else {

                e.preventDefault();
                const body ={ email, password };
                const response = await fetch("http://localhost:3000/login", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(body)
                })
                if (response.status === 200) {
                    alert("loginned successfully");
                    const responseData = await response.json();
                    if(responseData.stat==="customer"){
                    const { id,firstName, lastName, contactNumber, dob, nid, city, state, zipCode, country, creditCardNumber, creditCardType, email } = responseData.user;
                    const userinfo = [firstName, lastName, contactNumber, dob, nid, city, state, zipCode, country, creditCardNumber, creditCardType, email];
                    console.log(userinfo);
                    props.updateUserDescription(userinfo);
                    props.updateId(id);
                    props.buttonhandler();
                    }

                    else if(responseData.stat==="admin"){
                        props.chkAdmin(true);
                        props.buttonhandler();
                    }
                    else if(responseData.stat==="importer"){
                        props.chkImporter(true);
                        props.buttonhandler();
                        props.updateImporterInfo(responseData.user.agencyName);
                        props.updateImpId(responseData.user.id);
                    }
                    // console.log(user);
                } else {
                    console.error("Login failed");
                }
                // setUser(response.data.user);


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
    
    <div className="modal fade" id="LoginModal" tabIndex="-1" aria-labelledby="LoginModalLabel" aria-hidden="true">
    <div className="modal-dialog">
        <div className="modal-content">
            <div className="modal-header">
                <h1 className="modal-title fs-5" id="exampleModalLabel">Login to CodeByteMart</h1>
                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body">
                <form>
                    <div className="mb-3">
                        <label htmlFor="exampleInputEmail1" className="form-label" >Email address</label>
                        <input type="email" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value={email} onChange={e=>
                        setEmail(e.target.value)}/>
                        <div id="emailHelp" className="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div className="mb-3">
                        <label htmlFor="exampleInputPassword1" className="form-label">Password</label>
                        <input type="password" className="form-control" id="exampleInputPassword1" value={password}
                        onChange={e=>setPassword(e.target.value)}/>
                    </div>
                    
                    <button type="submit" className="btn btn-primary" onClick ={onsubmitform}>Submit</button>
                </form>
            </div>
            <div className="modal-footer">
                <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
  )
}
