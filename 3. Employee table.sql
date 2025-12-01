CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employee(id) ON DELETE SET NULL
<<<<<<< HEAD
);
=======
);
>>>>>>> f52d4c7021ed712e64f600edd3b11b1f233a439e
