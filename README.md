# Setup and Running Instructions


This guide provides step-by-step instructions for setting up and running the project, which includes a login and signup system implemented using Node.js, Vue.js, and MySQL.


## Prerequisites


Before proceeding, ensure that you have the following installed on your system:

- Node.js
- npm
- MySQL database server


## Setup Instructions


1. **Clone the Repository**: Clone the project repository to your local machine using Git.

    ```bash
    git clone https://github.com/hanifmasy/simple-dashboard.git
    ```


2. **Install Dependencies**: Navigate to the project directory and install the required dependencies for both the frontend and backend.

    ```bash
    cd project-directory
    npm install     # Install backend dependencies
    cd frontend     # Navigate to frontend directory
    npm install     # Install frontend dependencies
    ```


3. **Database Setup**: Set up the MySQL database by importing the SQL dump provided in the `data_dump.sql` file. This file contains sample data for the `users` table.

    ```bash
    mysql -u username -p database_name < data_dump.sql
    ```

    Replace `username` with your MySQL username and `database_name` with the name of your MySQL database.


4. **Configuration**: Update the database configuration in the backend code (`server.js`, `assetsController.js`) with your MySQL database credentials.

    ```javascript
    const db = mysql.createConnection({
      host: 'localhost',
      user: 'your_mysql_username',
      password: 'your_mysql_password',
      database: 'your_database_name'
    });
    ```


## Running the Project


After completing the setup steps, you can run the project using the following instructions:


1. **Start the Backend Server**: Navigate to the project directory and start the backend server.

    ```bash
    cd simple-dashboard
    node server.js
    ```


2. **Start the Frontend Server**: Open a new terminal window/tab, navigate to the frontend directory, and start the frontend server.

    ```bash
    cd simple-dashboard/frontend
    npm run serve
    ```


3. **Access the Application**: Once both the backend and frontend servers are running, you can access the application by opening your web browser and navigating to `http://localhost:8080`.
