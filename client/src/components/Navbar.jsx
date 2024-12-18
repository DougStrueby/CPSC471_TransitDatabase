import React from 'react';
import { useUser } from '../UserContext'; // Import useUser
import { Link, useNavigate } from 'react-router-dom'; // Import useNavigate
import Logo from "../img/logo.png"; // Imports logo

const Navbar = () => {
    const { user, logout } = useUser();
    const navigate = useNavigate(); // Initialize navigate

    const handleLogout = () => {
        logout();
        navigate('/'); // Navigate to login page after logout
    };

    return (
        <div className='navbar'>
            <div className="container">
                <div className='logo'>
                    <img src={Logo} alt="Logo" />
                </div>
                <div className="links">
                    {user ? (
                        <>
                            <button onClick={handleLogout}>Logout</button>
                            
                        </>
                    ) : (
                        <Link to="/">Login</Link>
                    )}
                </div>
            </div>
        </div>
    );
};

export default Navbar;
