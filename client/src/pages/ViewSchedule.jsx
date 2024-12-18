import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const ViewSchedule = () => {
    const [drivers, setDrivers] = useState([]);
    const [selectedDriver, setSelectedDriver] = useState('');
    const [schedule, setSchedule] = useState([]);
    const [loading, setLoading] = useState(false);

    const navigate = useNavigate();

    const goToHome = () => {
        navigate('/home'); // Navigate to the home route
    };

    useEffect(() => {
        const fetchDrivers = async () => {
            try {
                const response = await axios.get('http://localhost:8800/driver');
                setDrivers(response.data);
            } catch (error) {
                console.error('Error fetching drivers:', error);
            }
        };

        fetchDrivers();
    }, []);

    useEffect(() => {
        if (selectedDriver) {
            const fetchSchedule = async () => {
                setLoading(true);
                try {
                    const response = await axios.get(`http://localhost:8800/schedule/${selectedDriver}`);
                    setSchedule(response.data);
                    setLoading(false);
                } catch (error) {
                    console.error('Error fetching the schedule:', error);
                    setLoading(false);
                }
            };

            fetchSchedule();
        }
    }, [selectedDriver]);

    const handleDriverChange = (e) => {
        setSelectedDriver(e.target.value);
    };

    return (
        <div>
            <h1>Driver Schedule</h1>
            <div>
                <label htmlFor="driver-select">Choose a Driver:</label>
                <select id="driver-select" onChange={handleDriverChange} value={selectedDriver}>
                    <option value="">Select a Driver</option>
                    {drivers.map(driver => (
                        <option key={driver.DriverID} value={driver.DriverID}>
                            {driver.DriverID}
                        </option>
                    ))}
                </select>
            </div>

            {loading ? <div>Loading...</div> : (
                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Route Name</th>
                            <th>Vehicle ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {schedule.map((item, index) => (
                            <tr key={index}>
                                <td>{item.Date}</td>
                                <td>{item.startTime}</td>
                                <td>{item.endTime}</td>
                                <td>{item.RouteName}</td>
                                <td>{item.VID}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            )}
            <button onClick={goToHome}>Back to Home</button>
        </div>
    );
};

export default ViewSchedule;
