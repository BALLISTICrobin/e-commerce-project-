import React, { useState } from 'react';

export default function Comment(props) {
    const [editedReview, setEditedReview] = useState(props.comment.review);
    const [editedRating, setEditedRating] = useState(props.comment.rating);
    const [showModal, setShowModal] = useState(false);
    const [userid, setUserId] = useState(props.userid);
    const [productid, setProductId] = useState(props.comment.productid);
    const [customerid, setCustomerId] = useState(props.comment.customerid);
    const handleEdit = () => {
        setShowModal(true);
    };

    const handleModalClose = () => {
        setShowModal(false);
    };

    const handleSaveChanges = async() => {
        // You can handle saving changes here
        console.log("Edited review:", editedReview);
        console.log("Edited rating:", editedRating);
       
        const body = {userid, productid, editedReview, editedRating};
        try{
            const response = await fetch('http://localhost:3000/editReview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(body)
            });
            if(response.status === 200){
                const responseData = await response.json();
                setShowModal(false);
                props.callReview();
                props.callGetProductInfo();
            }
            else{
                console.log("Failed to edit review");
            }
        }
        catch(error){
            console.log("Error:", error);
        }
    };

    return (
        <div className="card">
            <div className="card-header">
                <h3 style={{ marginBottom: '0' }}>{props.comment.firstname}</h3>
            </div>
            <div className="card-body">
                <h5 className="card-title">Rating: {props.comment.rating}</h5>
                <p className="card-text">{props.comment.review}</p>
                {(userid===customerid) && <button onClick={handleEdit} className="btn btn-primary">Edit</button>}
            </div>

            {/* Modal for editing comment */}
            {showModal &&
                <div className="modal" tabIndex="-1" role="dialog" style={{ display: 'block', backgroundColor: 'rgba(0, 0, 0, 0.5)' }}>
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title">Edit Comment</h5>
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close" onClick={handleModalClose}>
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div className="modal-body">
                                <div className="form-group">
                                    <label htmlFor="editedReview">Edited Comment:</label>
                                    <textarea id="editedReview" className="form-control" value={editedReview} onChange={(e) => setEditedReview(e.target.value)} style={{ height: '100px' }} />
                                </div>
                                <div className="form-group">
                                    <label htmlFor="editedRating">Edited Rating:</label>
                                    <input type="range" id="editedRating" className="form-control-range" value={editedRating} min="1" max="5" onChange={(e) => setEditedRating(e.target.value)} />
                                    <span style={{ marginLeft: '5px' }}>{editedRating}</span>
                                </div>
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleModalClose}>Close</button>
                                <button type="button" className="btn btn-primary" onClick={handleSaveChanges}>Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            }
            {/* End of modal */}
        </div>
    );
}