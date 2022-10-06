DROP DATABASE IF EXISTS HotelReservation;

CREATE DATABASE IF NOT EXISTS HotelReservation;

USE HotelReservation;

CREATE TABLE IF NOT EXISTS Guest (
    GuestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    Phone CHAR(13) NOT NULL
);

CREATE TABLE IF NOT EXISTS RoomType (
    RoomTypeId INT PRIMARY KEY AUTO_INCREMENT,
    RoomType VARCHAR(6) NOT NULL,
    StandardOccupancy TINYINT NOT NULL,
    MaximumOccupancy TINYINT NOT NULL,
    BasePrice DECIMAL(5 , 2 ) NOT NULL,
    ExtraPersonCost INT NULL
);

CREATE TABLE IF NOT EXISTS Amenity (
    AmenityId INT PRIMARY KEY AUTO_INCREMENT,
    AmenityName VARCHAR(25) NOT NULL,
    ExtraCost INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Room (
    RoomId INT PRIMARY KEY AUTO_INCREMENT,
    RoomNo CHAR(3) NOT NULL,
    RoomTypeId INT NOT NULL,
    ADAAccessible BOOL NOT NULL,
    CONSTRAINT fk_Room_RoomType FOREIGN KEY (RoomTypeId)
        REFERENCES RoomType (RoomTypeId)
);

CREATE TABLE IF NOT EXISTS RoomAmenity (
    RoomId INT NOT NULL,
    AmenityId INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomId , AmenityId),
    CONSTRAINT fk_RoomAmenity_Room FOREIGN KEY (RoomId)
        REFERENCES Room (RoomId),
    CONSTRAINT fk_RoomAmenity_Amenity FOREIGN KEY (AmenityId)
        REFERENCES Amenity (AmenityId)
);

CREATE TABLE IF NOT EXISTS Reservation (
    ReservationId INT,
    GuestId INT NOT NULL,
    RoomId INT NOT NULL,
    Adults TINYINT NOT NULL,
    Children TINYINT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    ExtraPerson TINYINT NULL,
    PRIMARY KEY pk_Reservation (ReservationId , GuestId , RoomId),
    CONSTRAINT fk_Reservation_Guest FOREIGN KEY (GuestId)
        REFERENCES Guest (GuestId),
    CONSTRAINT fk_Reservation_Room FOREIGN KEY (RoomId)
        REFERENCES Room (RoomId)
);




