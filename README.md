# 🚆 Railway Reservation System

## 📌 Project Overview
The **Railway Reservation System** is a database-driven project designed to automate the train ticket booking process. It manages users, trains, bookings, passengers, and payments efficiently while providing an easy way to handle train schedules, seat availability, bookings, and cancellations.

---

## 🎯 **Objectives**
- ✅ Online Ticket Booking  
- ✅ User Management  
- ✅ Train & Schedule Management  
- ✅ Passenger & Booking Management  
- ✅ Payment Handling  
- ✅ Reporting & Data Retrieval  

---

## 🏗️ **Project Features**
- User registration and login with roles (Admin/User)
- Train management with schedule and availability
- Online booking with seat and coach assignment
- Passenger details handling
- Payment processing and status tracking
- Data normalization up to 3NF for efficient database design
- Support for DDL, DML, DCL, TCL, and DQL operations

---

## 📊 **Entity Relationship Diagram (ERD)**
The system uses a normalized relational database with the following entities:

- **User** – stores user details (name, email, mobile, address)
- **Login** – handles user login credentials
- **Roles** – defines user roles
- **Trains** – contains train details and schedules
- **Booking** – manages bookings with seat and train information
- **Passenger** – stores passenger details for each booking
- **Payment** – records payment information for bookings

![ER Diagram]
<img width="840" height="506" alt="ER-diagram" src="https://github.com/user-attachments/assets/d5464998-91aa-4a76-91b3-6144c7d26443" />


---

## 🗄️ **Database Design**
The database is normalized into **1NF, 2NF, and 3NF** to eliminate redundancy and maintain data integrity.  
Normalization steps are documented in the project files.

---

## 🛠️ **SQL Operations Implemented**
### **DDL (Data Definition Language)**
- `CREATE`, `ALTER`, `RENAME`, `DROP`, `TRUNCATE`

### **DML (Data Manipulation Language)**
- `INSERT`, `UPDATE`, `DELETE`

### **DCL (Data Control Language)**
- `GRANT`, `REVOKE`

### **TCL (Transaction Control Language)**
- `COMMIT`, `ROLLBACK`

### **DQL (Data Query Language)**
- `SELECT` with clauses (`ORDER BY`, `DISTINCT`, `LIMIT`, `GROUP BY`, `HAVING`, `JOIN`)

---

## 📂 **Project Structure**
├── ER-diagram.png # Entity Relationship Diagram
├── Normalization 1NF to 3NF.xlsx # Database normalization steps
├── Railway Reservation System.pptx # Presentation file
├── SQL Scripts # SQL queries for DDL, DML, etc.
└── README.md # Project documentation

## 🧑‍💻 **SQL Features Demonstrated**
- **Operators**: Arithmetic, Comparison, Logical, Pattern Matching, Null Operators  
- **Built-in Functions**: String, Aggregate, Math functions  
- **Advanced SQL**: Subqueries, Views, Stored Procedures, Stored Functions, Cursors, Triggers  

---

## 🚀 **Technologies Used**
- **Database**: MySQL  
- **Language**: SQL  
- **Tools**: MySQL Workbench / phpMyAdmin  

---

## 📽️ **Presentation**
A PowerPoint presentation (`Railway Reservation System.pptx`) is included to explain the project workflow and database design.

---

## 👤 **Author**
**Karan More**  
📧 *Email:* [morekaran3131@gmail.com]  
💻 *GitHub:* [https://github.com/Karan-More214]

---

## 📝 **Conclusion**
This project demonstrates the implementation of a fully normalized railway reservation database with support for various SQL operations, making it an excellent reference for learning database management and system design.

---

### ⭐ If you like this project, give it a star on GitHub!
