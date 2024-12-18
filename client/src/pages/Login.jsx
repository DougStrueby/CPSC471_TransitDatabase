import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { useUser } from '../UserContext';

const Login = () => {
    const [credentials, setCredentials] = useState({ username: '', password: '' });
    const [error, setError] = useState(''); // State to hold error message
    const navigate = useNavigate();
    const { login } = useUser(); // Use the login function from the context

    const handleChange = (e) => {
        setCredentials({ ...credentials, [e.target.name]: e.target.value });
        setError(''); // Clear error on input change
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post("http://localhost:8800/login", credentials);
            
            // Check if the response contains accountType
            if (response.data.accountType) {
                const accountType = response.data.accountType;

                // Assuming response.data contains user data including name
                const userData = { name: response.data.name, accountType };

                login(userData); // Login the user

                // Redirect to different routes based on account type
                if (accountType === 'Manager') {
                    navigate('/manager');
                } else if (accountType === 'Employee') {
                    navigate('/employee');
                } else {
                    navigate('/home');
                }
            } else {
                setError('Login failed. Please check your credentials.');
            }
        } catch (err) {
            console.error(err);
            setError('Login failed. Please check your credentials.');
        }
    };

    return (
        <div className='auth'>
            <h1>Login</h1>
            <form onSubmit={handleSubmit}>
                <input type="text" name="username" placeholder='Username' onChange={handleChange} />
                <input type="password" name="password" placeholder='Password' onChange={handleChange} />
                <button type="submit">Login</button>
            </form>
            {error && <div className="error">{error}</div>} {/* Display error message */}
        </div>
    );
};

export default Login;
