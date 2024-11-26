CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Projects (
    ProjectId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ProjectUsers (
    ProjectId INT NOT NULL,
    UserId INT NOT NULL,
    PRIMARY KEY (ProjectId, UserId),
    FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Tasks (
    TaskId INT AUTO_INCREMENT PRIMARY KEY,
    ProjectId INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    AuthorId INT NOT NULL,  -- Автор таску
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    FOREIGN KEY (AuthorId) REFERENCES Users(UserId)
);

CREATE TABLE TaskUsers (
    TaskId INT NOT NULL,
    UserId INT NOT NULL,
    PRIMARY KEY (TaskId, UserId),
    FOREIGN KEY (TaskId) REFERENCES Tasks(TaskId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Files (
    FileId INT AUTO_INCREMENT PRIMARY KEY,
    FilePath VARCHAR(255) NOT NULL,
    TaskId INT NULL,   
    ProjectId INT NULL,   
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TaskId) REFERENCES Tasks(TaskId),
    FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId)
);

INSERT INTO Users (Username, Email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('admin', 'admin@example.com');

INSERT INTO Projects (Name, Description) VALUES
('Project Alpha', 'Description for Project Alpha'),
('Project Beta', 'Description for Project Beta');
INSERT INTO ProjectUsers (ProjectId, UserId) VALUES
(1, 1),  
(1, 2),  
(2, 2),  
(2, 3);  

INSERT INTO Tasks (ProjectId, Title, Description, AuthorId) VALUES
(1, 'Task 1', 'Description for Task 1 in Project Alpha', 1),
(1, 'Task 2', 'Description for Task 2 in Project Alpha', 2),
(2, 'Task 3', 'Description for Task 3 in Project Beta', 3);

INSERT INTO TaskUsers (TaskId, UserId) VALUES
(1, 1),  
(1, 2), 
(2, 2),  
(3, 3);  

INSERT INTO Files (FilePath, TaskId) VALUES
('/files/task1_file.txt', 1),
('/files/task2_file.txt', 2);

INSERT INTO Files (FilePath, ProjectId) VALUES
('/files/project_alpha_file.txt', 1);

SELECT * FROM Users;
SELECT * FROM Projects;
SELECT * FROM ProjectUsers;
SELECT * FROM Tasks;
SELECT * FROM TaskUsers;
SELECT * FROM Files;