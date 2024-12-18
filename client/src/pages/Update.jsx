import React from 'react';
import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useLocation } from "react-router-dom";

const Update = () => {
    const [employee, setEmployee] = useState({
        FName: "",
        LName: "",
        Address: "",
        Salary: null,
    });

    const navigate = useNavigate()
    const location = useLocation()

    const EmployeeID = location.pathname.split("/")[2]

    console.log(location.pathname.split("/")[2])

    const handleChange = (e) => {
        setEmployee(prev =>({...prev, [e.target.name]: e.target.value}))
    };

    const handleClick = async e =>{
        e.preventDefault()
        try {
            await axios.put("http://localhost:8800/employee/" + EmployeeID, employee)
            navigate("/dashboard")
        } catch (err) {
            console.log(err)
        }
    }

    console.log(employee);
    return (
        <div className='form'>
            <h1>Update Employee</h1>
            <input type = "text" placeholder ='FName' onChange = {handleChange} name = "FName"/>
            <input type = "text" placeholder ='LName' onChange = {handleChange} name = "LName"/>
            <input type = "text" placeholder ='Address' onChange = {handleChange} name = "Address"/>
            <input type = "number" placeholder ='Salary' onChange = {handleChange} name = "Salary"/>
            <button onClick={handleClick}>Update</button>
        </div>
    );
};

export default Update