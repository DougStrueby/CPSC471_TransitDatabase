import React from 'react';
import { useUser } from '../UserContext'; // Import useUser
import { useNavigate } from 'react-router-dom';

const Home = () => {
    const { user } = useUser(); // Access user context
    const navigate = useNavigate();

    return (
        <div className='home'>
            <h1>Welcome to the Driver's Dashboard</h1>
            {user && <h2> {user.name}</h2>} {/* Display user's name if logged in */}

            {/* Conditional rendering based on user's account type */}
            {user && user.accountType === 'Manager' && (
                <div>
                    <button onClick={() => navigate('/manager')}>Manager Dashboard</button>
                    {/* Other manager-specific functionalities */}
                </div>
            )}
            {user && user.accountType === 'Employee' && (
                <div>
                    <button onClick={() => navigate('/employee')}>Employee Dashboard</button>
                    {/* Other employee-specific functionalities */}
                </div>
            )}
            
            {/* Buttons for viewing schedule and route information */}
            <div>
                <button onClick={() => navigate('/ViewSchedule')}>View Schedule</button>
                <button onClick={() => navigate('/ViewRoute')}>View Route Information</button>
            </div>
        </div>
    );
};

export default Home;
