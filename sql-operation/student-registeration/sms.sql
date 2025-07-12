CREATE TABLE students (
    StudentID UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName  VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE departments (
    DepartmentID      UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    DepartmentName    VARCHAR(255),
    BuildingLocation  VARCHAR(255)
);

CREATE TABLE instructors(
    TeacherID     UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    FirstName     VARCHAR(50),
    LastName      VARCHAR(50),
    Email         VARCHAR(100),
    PhoneNumber   VARCHAR(100),
    Rank          VARCHAR(100),
    departmentId  UUID,
    FOREIGN KEY (departmentId) REFERENCES departments(DepartmentID)
);

CREATE TABLE courses (
    CourseID UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    CourseName VARCHAR(50),
    CourseCode VARCHAR(100),
    Credits    VARCHAR(100),
    Description TEXT,
    teacherId UUID,
    FOREIGN KEY (teacherId) REFERENCES instructors(TeacherID)
);

CREATE TABLE enrollments (
    EnrollmentID   UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    studentID      VARCHAR(255),
    courseID       VARCHAR(255), 
    EnrollmentDate VARCHAR(255),
    Grade          VARCHAR(255)
)

INSERT INTO "students" (FirstName,LastName,Email,PhoneNumber,Address) VALUES ('Win Tun','Hlaing','wintun.hlaing@outlook.com','+9509445099919','Yangon');
INSERT INTO "departments" (DepartmentName,BuildingLocation) VALUES ('Physics','B-19,R-5');
INSERT INTO "instructors" (FirstName,LastName,Email,PhoneNumber,Rank,departmentId) VALUES ('John','Smit','johnsmit@gmail.com','09458752222','10','83a75d67-2490-4c85-b6d1-b3ae5fbfb4c3');

