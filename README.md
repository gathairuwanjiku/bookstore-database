1.Bookstore Database Project

This project is a database system for managing a bookstore. It includes books, authors, customers, orders, shipping, using MySQL with tables and relationships.


2.Project Structure

bookstore-database
er_diagram.drawio        # ER diagram created using draw.io 
schema.sql               # SQL file to create all tables and relationships
test_queries.sql         # Test queries to test the database 
README.md                # Project documentation




3.Tools & Technologies

MySQL Workbench – For writing and executing SQL scripts
Draw.io – For creating the ER diagram
VS Code – For managing project files
Git & GitHub – For version control and collaboration

4.Objective

The goal is to create a real-world bookstore system with:

- Inventory tracking (books, authors, publishers, languages)
- Customer and address management
- Order processing and shipping
- Order history and status tracking



1.Clone the Repository
bash
git clone https://github.com/your-username/bookstore-database.git
cd bookstore-database

2. Open in VS Code

code .

3. Open MySQL Workbench
Run the contents of schema.sql to create all tables

Run test_queries.sql to test your database


Database Schema

The database includes the following entities:

Main Tables

Book

Author

Book_Author (many-to-many)

Publisher

Book_Language

Customer

Address

Customer_Address (many-to-many with status)

Cust_Order

Order_Line

Shipping_Method

Order_History

Order_Status

Supporting Tables

Country

Address_Status


Relationships are seen in primary and foreign keys, and each table is put with data types.

Refer to the er_diagram.drawio for the structure of the database.


4.Sample Data

After creating tables, run the sample data inserts provide in schema.sql to populate:

Countries, Languages, Publishers

Authors and Books

Customers and Addresses

Orders and Order Lines


5.Testing

Open test_queries.sql and run the following:

View books with authors and publishers

Check current addresses of customers

See full order details

Track order status history

Group stock by language

Get books in a specific order

6.Security and Roles

Create MySQL users for Admin, Manager, and Viewer roles

Grant different privileges using:

GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'manager'@'localhost' IDENTIFIED BY 'password';



















