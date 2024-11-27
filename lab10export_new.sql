
CREATE TABLE lines (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Color VARCHAR(50) 
);

CREATE TABLE Stations (
    Station_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Line_ID INT,
    Coordinates VARCHAR(255),  
    Previous_Station_ID INT NULL,   
    Next_Station_ID INT NULL,       
    FOREIGN KEY (Line_ID) REFERENCES Lines(Line_ID),
    FOREIGN KEY (Previous_Station_ID) REFERENCES Stations(Station_ID),
    FOREIGN KEY (Next_Station_ID) REFERENCES Stations(Station_ID)
);

CREATE TABLE Line_Transfers (
    Transfer_ID INT AUTO_INCREMENT PRIMARY KEY,
    From_Line_ID INT,   
    To_Line_ID INT,     
    Station_ID INT,     
    FOREIGN KEY (From_Line_ID) REFERENCES Lines(Line_ID),
    FOREIGN KEY (To_Line_ID) REFERENCES Lines(Line_ID),
    FOREIGN KEY (Station_ID) REFERENCES Stations(Station_ID)
);
