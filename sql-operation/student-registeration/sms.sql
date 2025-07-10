CREATE TABLE students (
    StudentID VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName  VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(255),
    Address VARCHAR(255)
)

CREATE TABLE departments (
    DepartmentID      VARCHAR(255) PRIMARY KEY,
    DepartmentName    VARCHAR(255),
    BuildingLocation  VARCHAR(255)
)

CREATE TABLE instructors(
    TeacherID     VARCHAR(255) PRIMARY KEY,
    FirstName     VARCHAR(50),
    LastName      VARCHAR(50),
    Email         VARCHAR(100),
    PhoneNumber   VARCHAR(100),
    Rank          VARCHAR(100),
    departmentId  VARCHAR(255)
    FOREIGN KEY (departmentId) REFERENCES departments(DepartmentID)
)

CREATE TABLE courses (
    CourseID VARCHAR(255) PRIMARY KEY,
    CourseName VARCHAR(50),
    CourseCode VARCHAR(100),
    Credits    VARCHAR(100),
    Description TEXT,
    teacherId VARCHAR(255),
    FOREIGN KEY (teacherId) REFERENCES instructors(TeacherID)
)

CREATE TABLE enrollments (
    EnrollmentID   VARCHAR(255) PRIMARY KEY,
    studentID      VARCHAR(255),
    courseID       VARCHAR(255), 
    EnrollmentDate VARCHAR(255),
    Grade          VARCHAR(255)
)
