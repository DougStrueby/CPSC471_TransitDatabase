import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const ViewRoute = () => {
    const [routes, setRoutes] = useState([]);
    const [lines, setLines] = useState([]);
    const [selectedRoute, setSelectedRoute] = useState('');
    const [selectedLine, setSelectedLine] = useState('');
    const [displayData, setDisplayData] = useState([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const fetchRoutesAndLines = async () => {
            try {
                const routesResponse = await axios.get('http://localhost:8800/route');
                const linesResponse = await axios.get('http://localhost:8800/line');
                setRoutes(routesResponse.data);
                setLines(linesResponse.data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };

        fetchRoutesAndLines();
    }, []);

    const fetchRouteStops = async (RouteName) => {
        setLoading(true);
        try {
            const response = await axios.get(`http://localhost:8800/stop/${RouteName}`);
            setDisplayData(response.data);
            setLoading(false);
        } catch (error) {
            console.error('Error fetching route stops:', error);
            setLoading(false);
        }
    };

    const fetchLineStations = async (LineName) => {
        setLoading(true);
        try {
            const response = await axios.get(`http://localhost:8800/station/${LineName}`);
            setDisplayData(response.data);
            setLoading(false);
        } catch (error) {
            console.error('Error fetching line stations:', error);
            setLoading(false);
        }
    };

    useEffect(() => {
        if (selectedRoute) {
            fetchRouteStops(selectedRoute);
        } else if (selectedLine) {
            fetchLineStations(selectedLine);
        }
    }, [selectedRoute, selectedLine]);

    const handleRouteChange = (e) => {
        setSelectedRoute(e.target.value);
        setSelectedLine('');
        setDisplayData([]);
    };

    const handleLineChange = (e) => {
        setSelectedLine(e.target.value);
        setSelectedRoute('');
        setDisplayData([]);
    };

    return (
        <div>
            <h1>Route and Line Information</h1>
            <div>
                <Link to="/home">Go to Home</Link> {/* Add this link */}
                <label htmlFor="route-select">Choose a Route:</label>
                <select id="route-select" onChange={handleRouteChange} value={selectedRoute}>
                    <option value="">Select a Route</option>
                    {routes.map(route => (
                        <option key={route.RouteName} value={route.RouteName}>
                            {route.RouteName}
                        </option>
                    ))}
                </select>

                <label htmlFor="line-select">Choose a Line:</label>
                <select id="line-select" onChange={handleLineChange} value={selectedLine}>
                    <option value="">Select a Line</option>
                    {lines.map(line => (
                        <option key={line.LineName} value={line.LineName}>
                            {line.LineName}
                        </option>
                    ))}
                </select>
            </div>

            {loading ? <div>Loading...</div> : (
                <table>
                    <thead>
                        <tr>
                            {selectedRoute && <th>Stop ID</th>}
                            {selectedLine && <th>Station ID</th>}
                        </tr>
                    </thead>
                    <tbody>
                        {displayData.map((item, index) => (
                            <tr key={index}>
                                <td>{item.StopID || item.StationID}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            )}
        </div>
    );
};

export default ViewRoute;
