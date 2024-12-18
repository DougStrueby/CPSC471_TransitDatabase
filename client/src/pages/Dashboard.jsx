import React from 'react';
import { useNavigate } from 'react-router-dom';

const Dashboard = () => {
    const navigate = useNavigate(); // Hook for navigation

    return (
        <div>
            <h1>Dashboard</h1>
            {/* Button to navigate to Employee page */}
            <button onClick={() => navigate('/employee')}>Go to Employee Page</button>

            {/* Button to navigate to AddSchedule page */}
            <button onClick={() => navigate('/addschedule')}>Go to Add Schedule Page</button>
            
            <button onClick={() => navigate('/schedule')}>View Schedule Table</button>
        </div>
    );
}

export default Dashboard;
