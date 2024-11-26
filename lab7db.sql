CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    CategoryId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE News (
    NewsId INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    CategoryId INT NOT NULL,
    AuthorId INT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    FOREIGN KEY (AuthorId) REFERENCES Users(UserId)
);

CREATE TABLE Comments (
    CommentId INT AUTO_INCREMENT PRIMARY KEY,
    NewsId INT NOT NULL,
    UserId INT NULL,
    Content TEXT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (NewsId) REFERENCES News(NewsId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Ratings (
    RatingId INT AUTO_INCREMENT PRIMARY KEY,
    NewsId INT NOT NULL,
    IPAddress VARCHAR(45) NOT NULL,
    RatingValue TINYINT NOT NULL CHECK (RatingValue BETWEEN 1 AND 5),
    RatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (NewsId, IPAddress),
    FOREIGN KEY (NewsId) REFERENCES News(NewsId)
);


INSERT INTO Users (Username, Email, PasswordHash) 
VALUES 
('john_doe', 'john@example.com', 'password_hash_1'),
('jane_doe', 'jane@example.com', 'password_hash_2'),
('admin', 'admin@example.com', 'admin_password_hash');

INSERT INTO Categories (Name) 
VALUES 
('Technology'),
('Sports'),
('Politics'),
('Entertainment');

INSERT INTO News (Title, Content, CategoryId, AuthorId) 
VALUES 
('Tech News 1', 'Content about technology...', 1, 1),
('Sports News 1', 'Content about sports...', 2, 2),
('Politics News 1', 'Content about politics...', 3, 1),
('Entertainment News 1', 'Content about entertainment...', 4, 3);

INSERT INTO Comments (NewsId, UserId, Content) 
VALUES 
(1, 1, 'Great tech article!'),
(1, 2, 'Very informative, thanks for sharing.'),
(2, 1, 'Nice summary of the latest sports events.'),
(3, 2, 'Interesting perspective on current political trends.'),
(4, 3, 'I loved the details in this entertainment article!');

INSERT INTO Ratings (NewsId, IPAddress, RatingValue) 
VALUES 
(1, '192.168.1.1', 5),
(2, '192.168.1.2', 4),
(3, '192.168.1.3', 3),
(4, '192.168.1.4', 5),
(1, '192.168.1.5', 4);

-- буде помилка, привів цей запит для прикладу
INSERT INTO Ratings (NewsId, IPAddress, RatingValue) 
VALUES 
(1, '192.168.1.1', 3); 