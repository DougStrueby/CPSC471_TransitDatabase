import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Schedule = () => {
    const [schedule, setSchedule] = useState([]);

    useEffect(() => {
        fetch('http://localhost:8800/schedule')
            .then(response => response.json())
            .then(data => setSchedule(data))
            .catch(error => console.error('Error fetching schedules:', error));
    }, []);

    const navigate = useNavigate();

    const goToDashboard = () => {
        navigate('/dashboard'); // Navigate to the dashboard route
    };

    return (
        <div>
            <h1>Schedule Table</h1>
            <button onClick={goToDashboard}>Back to Dashboard</button>
            <table>
                <thead>
                    <tr>
                        <th>Manager ID</th>
                        <th>Driver ID</th>
                        <th>Vehicle ID</th>
                        <th>Route Name</th>
                        <th>Line Name</th>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                </thead>
                <tbody>
                {schedule.map((item, index) => (
                    <tr key={index}>
                        <td>{item.ManagerID}</td>
                        <td>{item.DriverID}</td>
                        <td>{item.VID}</td>
                        <td>{item.RouteName}</td>
                        <td>{item.LineName}</td>
                        <td>{item.Date}</td>
                        <td>{item.startTime}</td>
                        <td>{item.endTime}</td>
                </tr>
            ))}
            </tbody>   
            </table>
            
        </div>
    );
};

export default Schedule;
