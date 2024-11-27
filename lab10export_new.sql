
CREATE TABLE lines (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Color VARCHAR(50) 
);

CREATE TABLE stations (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Line_ID INT,
    Coordinates VARCHAR(255),  
    Previous_Station_ID INT NULL,   
    Next_Station_ID INT NULL,       
    FOREIGN KEY (Line_ID) REFERENCES sines(Id),
    FOREIGN KEY (Previous_Station_ID) REFERENCES stations(Id),
    FOREIGN KEY (Next_Station_ID) REFERENCES stations(Id)
);

CREATE TABLE line_transfers (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    From_Line_ID INT,   
    To_Line_ID INT,     
    Station_ID INT,     
    FOREIGN KEY (From_Line_ID) REFERENCES lines(Id),
    FOREIGN KEY (To_Line_ID) REFERENCES lines(Id),
    FOREIGN KEY (Station_ID) REFERENCES stations(Id)
);
