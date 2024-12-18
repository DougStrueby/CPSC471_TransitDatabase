import express from "express"
import mysql from "mysql"
import cors from "cors"
import axios from 'axios'

const app = express()


const db = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"Suspecial@2",
    database:"transit",
})

app.use(express.json())
app.use(cors())

app.get("/", (req,res)=>{
    res.json("hello this is the backend")
})
    
app.get("/employee", (req,res)=>{
    const q = "SELECT * FROM transit.employee;"
    db.query(q,(err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.post("/employee", async (req, res) => {
    const employeeValues = [
        req.body.EmployeeID, 
        req.body.FName, 
        req.body.LName, 
        req.body.Address, 
        req.body.Salary
    ];

    const driverValues = [
        req.body.EmployeeID,
        req.body.License,
        req.body.ManagerID
    ];

    const accountType = 'Driver';

    // Generate username and password
    const username = req.body.FName.charAt(0) + req.body.LName;
    const password = req.body.LName; // Consider using a more secure method for real applications

    const accountValues = [
        req.body.EmployeeID,
        username,
        password,
        accountType
    ];

    try {
        await db.beginTransaction();

        await db.query("INSERT INTO transit.employee (EmployeeID, FName, LName, Address, Salary) VALUES (?)", [employeeValues]);
        
        // Only insert into driver if the employee is not a manager
        await db.query("INSERT INTO transit.driver (DriverID, License, ManagerID) VALUES (?)", [driverValues]);

        // Insert into account
        await db.query("INSERT INTO transit.account (EmployeeID, Username, Password, AccountType) VALUES (?)", [accountValues]);

        await db.commit();
        res.json("Employee, Driver, and Account records have been added successfully");
    } catch (err) {
        await db.rollback();
        console.error('Error during database transaction:', err);
        res.status(500).json({ message: 'Error adding employee, driver, and account', error: err });
    }
});





app.delete("/employee/:EmployeeID", async (req, res) => {
    const EmployeeID = req.params.EmployeeID;

    try {
        await db.beginTransaction();

        // Delete from account table first because of the foreign key constraint
        await db.query("DELETE FROM account WHERE EmployeeID = ?", [EmployeeID]);

        // Then delete from schedule
        await db.query("DELETE FROM schedule WHERE DriverID = ?", [EmployeeID]);

        // Delete from driver
        await db.query("DELETE FROM driver WHERE DriverID = ?", [EmployeeID]);

        // Finally, delete from employee
        await db.query("DELETE FROM employee WHERE EmployeeID = ?", [EmployeeID]);

        await db.commit();
        res.status(200).json({ message: "Employee and related data have been deleted successfully" });
    } catch (err) {
        await db.rollback();
        console.error('Error during the delete transaction:', err);
        res.status(500).json({ message: 'Error deleting employee and related data', error: err });
    }
});

app.put("/employee/:EmployeeID", (req, res)=>{
    const EmployeeID = req.params.EmployeeID;
    const q = "UPDATE employee SET FName = ?, LName = ?, Address = ?, Salary = ? WHERE EmployeeID = ?"

    const values = [
        req.body.FName, 
        req.body.LName, 
        req.body.Address, 
        req.body.Salary
    ];
    db.query(q, [...values, EmployeeID], (err, data) => {
        if(err) return res.json(err);
        return res.json ("Employee has been updated successfully.")
    })
})

app.listen(8800, ()=>{
    console.log("Connected to backend!")
})

app.post("/login", (req, res) => {
    const { username, password } = req.body;

    const query = "SELECT EmployeeID, AccountType FROM transit.account WHERE Username = ? AND Password = ?";

    db.query(query, [username, password], (err, result) => {
        if (err) {
            console.error('Login Error:', err);
            return res.status(500).json({ message: "Error during login", error: err });
        }

        if (result.length > 0) {
            // Login successful
            return res.json({ 
                message: "Login successful", 
                employeeId: result[0].EmployeeID, 
                accountType: result[0].AccountType 
            });
        } else {
            // Login failed
            return res.status(401).json({ message: "Invalid credentials" });
        }
    });
});

app.get("/vehicle", (req, res) => {
    const query = "SELECT VehicleID FROM transit.vehicle";
    db.query(query, (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result);
    });
});

app.get("/driver", (req, res) => {
    const query = "SELECT DriverID FROM transit.driver"; 
    db.query(query, (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result);
    });
});

app.get("/route", (req, res) => {
    const query = "SELECT RouteName FROM transit.route";
    db.query(query, (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result);
    });
});

app.get("/line", (req, res) => {
    const query = "SELECT LineName FROM transit.line";
    db.query(query, (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result);
    });
});

app.post("/schedule", (req, res) => {
    const { managerId, driverId, vehicleId, routeName, lineName, date, startTime, endTime } = req.body;
    console.log("Received schedule data:", req.body);
    if (!managerId || !driverId || !vehicleId || !date || !startTime || !endTime) {
        return res.status(400).json({ message: "All fields are required" });
    }
    console.log(managerId, driverId, vehicleId, routeName, lineName, date, startTime, endTime);
    const query = "INSERT INTO schedule (ManagerID, DriverID, VID, RouteName, LineName, Date, startTime, endTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    db.query(query, [managerId, driverId, vehicleId, routeName, lineName, date, startTime, endTime], (err, result) => {
        if (err) {
            console.error('Error during schedule creation:', err);
            return res.status(500).json({ message: "Error creating schedule", error: err });
        }
        res.json("Schedule created successfully");
    });
});

app.get("/schedule", (req, res) => {
    const query = "SELECT * FROM transit.schedule"; 

    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching schedules:', err);
            return res.status(500).json({ message: "Error fetching schedules", error: err });
        }
        res.json(results);
    });
});


app.get("/schedule/:DriverID", (req, res) => {
    const DriverID = req.params.DriverID;

    const query = "SELECT * FROM schedule WHERE DriverID = ?";
    db.query(query, [DriverID], (err, results) => {
        if (err) {
            console.error('Error fetching the schedule:', err);
            res.status(500).json({ message: 'Error fetching schedule', error: err });
        } else if (results.length === 0) {
            res.status(404).json({ message: 'No schedule found for this driver' });
        } else {
            res.json(results);
        }
    });
});


app.get('/route', (req, res) => {
    db.query('SELECT transit.RouteName FROM route', (err, results) => {
        if (err) {
            console.error('Error fetching routes:', err);
            res.status(500).json({ message: 'Error fetching routes', error: err });
        } else {
            res.json(results);
        }
    });
});

app.get('/line', (req, res) => {
    db.query('SELECT transit.LineName FROM line', (err, results) => {
        if (err) {
            console.error('Error fetching lines:', err);
            res.status(500).json({ message: 'Error fetching lines', error: err });
        } else {
            res.json(results);
        }
    });
});

app.get('/stop/:RouteName', (req, res) => {
    const { RouteName } = req.params;
    const query = `
        SELECT s.StopID, s.Start, s.StationID 
        FROM transit.Route r
        JOIN transit.hasroutestop hrs ON r.RouteName = hrs.RouteName
        JOIN transit.Stop s ON hrs.StopID = s.StopID
        WHERE r.RouteName = ?`;

    db.query(query, [RouteName], (err, results) => {
        if (err) {
            console.error(`Error fetching stops for route ${RouteName}:`, err);
            res.status(500).json({ message: 'Error fetching stops', error: err });
            return;
        }
        if (results.length === 0) {
            res.status(404).json({ message: `No stops found for route ${RouteName}` });
            return;
        }
        res.json(results);
    });
});


app.get('/station/:LineName', (req, res) => {
    const { LineName } = req.params;
    db.query('SELECT * FROM transit.station WHERE LineName = ?', [LineName], (err, results) => {
        if (err) {
            console.error(`Error fetching stations for line ${LineName}:`, err);
            res.status(500).json({ message: 'Error fetching stations', error: err });
        } else {
            res.json(results);
        }
    });
});