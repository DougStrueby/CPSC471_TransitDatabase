import React from 'react';
import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const Add = () => {
    const [employee, setEmployee] = useState({
        EmployeeID: null,
        FName: "",
        LName: "",
        Address: "",
        Salary: null,
        License: "",   // Added for driver table
        ManagerID: null // Added for driver table
    });

    const navigate = useNavigate();

    const handleChange = (e) => {
        setEmployee(prev => ({ ...prev, [e.target.name]: e.target.value }));
    };

    const handleClick = async e => {
        e.preventDefault();
        try {
            await axios.post("http://localhost:8800/employee", employee);
            navigate("/dashboard");
        } catch (err) {
            console.log(err);
        }
    };

    return (
        <div className='form'>
            <h1>Add new Employee and Driver</h1>
            <input type="number" placeholder='EmployeeID' onChange={handleChange} name="EmployeeID"/>
            <input type="text" placeholder='First Name' onChange={handleChange} name="FName"/>
            <input type="text" placeholder='Last Name' onChange={handleChange} name="LName"/>
            <input type="text" placeholder='Address' onChange={handleChange} name="Address"/>
            <input type="number" placeholder='Salary' onChange={handleChange} name="Salary"/>
            <input type="text" placeholder='License' onChange={handleChange} name="License"/> {/* New field for License */}
            <input type="number" placeholder='Manager ID' onChange={handleChange} name="ManagerID"/> {/* New field for Manager ID */}
            <button onClick={handleClick}>Add</button>
        </div>
    );
};

export default Add;
