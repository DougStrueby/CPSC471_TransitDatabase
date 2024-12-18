import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';



function AddSchedule() {
  const [schedule, setSchedule] = useState({
    managerId: '',
    driverId: '',
    vehicleId: '',
    routeName: '',
    lineName: '',
    date: '',
    startTime: '',
    endTime: ''
  });
  const [drivers, setDrivers] = useState([]);
  const [vehicles, setVehicles] = useState([]);
  const [routes, setRoutes] = useState([]);
  const [lines, setLines] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async (url, setter) => {
        try {
          const response = await fetch(url);
          if (!response.ok) throw new Error('Network response was not ok');
          const data = await response.json();
          console.log(`Data from ${url}:`, data); // Debugging line
          setter(data);
        } catch (error) {
          console.error('Error fetching data:', error);
        }
      };
      

    fetchData('http://localhost:8800/driver', setDrivers);
    fetchData('http://localhost:8800/vehicle', setVehicles);
    fetchData('http://localhost:8800/route', setRoutes);
    fetchData('http://localhost:8800/line', setLines);
  }, []);

  const handleChange = (e) => {
    setSchedule({ ...schedule, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    e.preventDefault();

    if (!schedule.managerId) {
      console.error('ManagerID is required');
      return;
    }

    const backendUrl = 'http://localhost:8800/schedule';
    try {
      const response = await fetch(backendUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(schedule),
      });

      if (response.ok) {
        console.log('Schedule added successfully');
        navigate('/dashboard'); // Navigate to dashboard or other appropriate route
      } else {
        console.error('Failed to add schedule:', await response.json());
      }
    } catch (error) {
      console.error('Error submitting form:', error);
    }
  };

  return (
    <div>
      <h2>Add Schedule</h2>
      <form onSubmit={handleSubmit}>
        <label>Manager ID:</label>
        <input 
          type="text" 
          name="managerId" 
          value={schedule.managerId} 
          onChange={handleChange}
          placeholder="Enter Manager ID" 
        />

        <label>Driver ID:</label>
        <select name="driverId" value={schedule.driverId} onChange={handleChange}>
          <option value="">Select a Driver</option>
          {drivers.map(driver => (
            <option key={driver.DriverID} value={driver.DriverID}>{driver.DriverID}</option>
          ))}
        </select>

        <label>Vehicle ID:</label>
        <select name="vehicleId" value={schedule.vehicleId} onChange={handleChange}>
          <option value="">Select a Vehicle</option>
          {vehicles.map(vehicle => (
            <option key={vehicle.VehicleID} value={vehicle.VehicleID}></option>
          ))}
        </select>

        <label>Route Name:</label>
        <select name="routeName" value={schedule.routeName} onChange={handleChange}>
          <option value="">Select a Route</option>
          {routes.map(route => (
            <option key={route.RouteName} value={route.RouteName}>{route.RouteName}</option>
          ))}
        </select>

        <label>Line Name:</label>
        <select name="lineName" value={schedule.lineName} onChange={handleChange}>
          <option value="">Select a Line</option>
          {lines.map(line => (
            <option key={line.LineName} value={line.LineName}>{line.LineName}</option>
          ))}
        </select>

        <label>Date:</label>
        <input type="date" name="date" value={schedule.date} onChange={handleChange} />

        <label>Start Time:</label>
        <input type="time" name="startTime" value={schedule.startTime} onChange={handleChange} />

        <label>End Time:</label>
        <input type="time" name="endTime" value={schedule.endTime} onChange={handleChange} />

        <button type="submit">Add Schedule</button>
      </form>
      <button onClick={() => navigate('/dashboard')}>Go to Dashboard</button>
    </div>
  );
}

export default AddSchedule;

  