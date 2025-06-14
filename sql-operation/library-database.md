## Create Table 
```
CREATE TABLE books (
    _id INT PRIMARY KEY,
    bookType VARCHAR(10),
    bookName VARCHAR(100),
    authorId VARCHAR(10)
)
```

### Create Table Departments & Employees
```
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
)
```
```
CREATE TABLE employees (
    employees_id INT PRIMARY KEY,
    employees_name VARCHAR(100),
    department_id INT REFERENCES departments (department_id)
)
```

### Studen Table
```
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT
)
```

### Insert
```
INSERT INTO Books 
    (_id,bookType,bookName,authorId) 
VALUES 
(1,'Fiction','The Great Gatsby','F0001'),
(2,'Fiction','To Kill a Mockingbird','H0003'),
(3,'Romance','Pride and Prejudice','J0000');
```

### Update
```
UPDATE books
SET bookType='Classic'
WHERE _id = 1;
```