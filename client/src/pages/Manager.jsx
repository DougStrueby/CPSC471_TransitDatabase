import React from 'react';
import { useUser } from '../UserContext'; // Import useUser
import { useNavigate } from 'react-router-dom';

const Manager = () => {
    const { user } = useUser(); // Access user context
    const navigate = useNavigate();

    return (
        <div className='home'>
            <h1>Welcome to the Dashboard</h1>
            {user && <h2>Hello, {user.name}</h2>} {/* Display user's name if logged in */}
            
            {/* Conditional rendering based on user's account type */}
            {user && user.accountType === 'Manager' && (
                <div>
                    <button onClick={() => navigate('/dashboard')}>Manager Dashboard</button>
                    {/* Button to navigate to the schedule view */}
                </div>
            )}
        </div>
    );
};

export default Manager;
