import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const Employee = () => {
    const [employees, setEmployees] = useState([]);

    useEffect(() => {
        const fetchAllEmployees = async () => {
            try {
                const res = await axios.get("http://localhost:8800/employee");
                setEmployees(res.data);
            } catch (err) {
                console.error(err);
            }
        };

        fetchAllEmployees();
    }, []);

    const handleDelete = async (EmployeeID) => {
        try {
            const res = await axios.delete(`http://localhost:8800/employee/${EmployeeID}`);
            if (res.status === 200) {
                setEmployees(employees.filter(employee => employee.EmployeeID !== EmployeeID));
            } else {
                console.error('Failed to delete the employee:', res.data);
            }
        } catch (err) {
            console.error(err);
        }
    };

    return (
        <div>
            <h1>All Employees</h1>
            <Link to="/dashboard">
                <button>Back to Dashboard</button>
            </Link>
            <div className="Employees">
                {employees.map((employee) => (
                    <div key={employee.EmployeeID}>
                        <h2>ID: {employee.EmployeeID} Name: {employee.FName} {employee.LName}</h2>
                        <h3>Address: {employee.Address}</h3>
                        <h3>Salary: ${employee.Salary}</h3>
                        <button className="delete" onClick={() => handleDelete(employee.EmployeeID)}>
                            Delete
                        </button>
                        <Link to={`/update/${employee.EmployeeID}`}>
                            <button className="update">Update</button>
                        </Link>
                    </div>
                ))}
            </div>
            <Link to="/add">
                <button>Add new Driver</button>
            </Link>
            
        </div>
    );
};

export default Employee;