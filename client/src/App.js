import React from 'react';
import { BrowserRouter as Router, Routes, Route, Outlet } from 'react-router-dom';
import Employee from "./pages/Employee";
import Add from "./pages/Add";
import Update from "./pages/Update";
import Login from "./pages/Login";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import "./style.scss";
import { UserProvider } from './UserContext';
import AddSchedule from './pages/AddSchedule';
import Manager from './pages/Manager'
import Dashboard from './pages/Dashboard'
import Schedule from './pages/Schedule'
import ViewRoute from './pages/ViewRoute'
import ViewSchedule from './pages/ViewSchedule'

const Layout = () => {
  return (
    <>
      <Navbar />
      <Outlet /> 
      <Footer />
    </>
  );
};

function App() {
  return (
    <UserProvider>
      <div className="app">
        <div className="container">
          <Router>
            <Routes>
              <Route path="/" element={<Layout />}>
                <Route index element={<Login />} />
                <Route path="home" element={<Home />} />
                <Route path="employee" element={<Employee />} />
                <Route path="add" element={<Add />} />
                <Route path="update/:EmployeeID" element={<Update />} />
                <Route path="addSchedule" element={<AddSchedule />} />
                <Route path="manager" element={<Manager />} />
                <Route path="dashboard" element={<Dashboard />} />
                <Route path="schedule" element={<Schedule />} />
                <Route path="viewroute" element={<ViewRoute />} />
                <Route path="viewschedule" element={<ViewSchedule />} />
              </Route>
            </Routes>
          </Router>
        </div>
      </div>
    </UserProvider>
  );
}

export default App;
