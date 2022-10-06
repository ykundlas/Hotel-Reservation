USE HotelReservation;

INSERT INTO Guest (FirstName, LastName, Address, City, State, Zip, Phone) VALUES
('Yashpreet','Kundlas', '54 Sage Bluff Manor','Calgary','AB','T3R1T5','(587)573-2591'),
('Mack','Simmer','379 Old Shore Street','Council Bluffs','IA','51501','(291)553-0508'),
('Bettyann','Seery','750 Wintergreen Dr.','Wasilla','AK','99654','(478)277-9632'),
('Duane','Cullison','9662 Foxrun Lane','Harlingen','TX','78552','(308)494-0198'),
('Karie','Yang','9378 W. Augusta Ave.','West Deptford','NJ','08096','(214)730-0298'),
('Aurore','Lipton','762 Wild Rose Street','Saginaw','MI','48601','(377)507-0974'),
('Zachery','Luechtefeld','7 Poplar Dr.','Arvada','CO','80003','(814)485-2615'),
('Jeremiah','Pendergrass','70 Oakwood St.','Zion','IL','60099','(279)491-0960'),
('Walter','Holaway','7556 Arrowhead St.','Cumberland','RI','02864','(446)396-6785'),
('Wilfred','Vise','77 West Surrey Street','Oswego','NY','13126','(834)727-1001'),
('Maritza','Tilton','939 Linda Rd.','Burke','VA','22015','(446)351-6860'),
('Joleen','Tison','87 Queen St.','Drexel Hill','PA','19026','(231)893-2755');

INSERT INTO Amenity (AmenityName, ExtraCost) VALUES
('Microwave', 0),
('Refrigerator', 0),
('Jacuzzi', 25),
('Oven', 0);

INSERT INTO RoomType (RoomType, StandardOccupancy, MaximumOccupancy, Baseprice, ExtraPersonCost) VALUES
('Single',2,2,149.99,null),
('Double',2,4,174.99,10),
('Suite',3,8,399.99,20);

INSERT INTO Room (RoomNo, RoomTypeId, ADAAccessible) VALUES
('201',2,0),
('202',2,1),
('203',2,0),
('204',2,1),
('205',1,0),
('206',1,1),
('207',1,0),
('208',1,1),
('301',2,0),
('302',2,1),
('303',2,0),
('304',2,1),
('305',1,0),
('306',1,1),
('307',1,0),
('308',1,1),
('401',3,1),
('402',3,1);

INSERT INTO RoomAmenity (RoomId, AmenityId) VALUES
(1,1),
(1,3),
(2,2),
(3,1),
(3,3),
(4,2),
(5,1),
(5,2),
(5,3),
(6,1),
(6,2),
(7,1),
(7,2),
(7,3),
(8,1),
(8,2),
(9,1),
(9,3),
(10,2),
(11,1),
(11,3),
(12,2),
(13,1),
(13,2),
(13,3),
(14,1),
(14,2),
(15,1),
(15,2),
(15,3),
(16,1),
(16,2),
(17,1),
(17,2),
(17,4),
(18,1),
(18,2),
(18,4);


INSERT INTO Reservation (Reservationid, GuestId, RoomId, Adults, Children, StartDate, EndDate, ExtraPerson) VALUES
(1,1,15,1,1,'2023-03-17','2023-03-20',null),
(2,2,16,1,0,'2023-02-02','2023-02-04',null),
(3,3,3,2,1,'2023-02-05','2023-02-10',null),
(4,4,13,2,0,'2023-02-22','2023-02-24',null),
(5,5,1,2,2,'2023-03-06','2023-03-07',null),
(6,6,10,3,0,'2023-03-18','2023-03-23',1),
(7,7,2,2,2,'2023-03-29','2023-03-31',null),
(8,8,12,2,0,'2023-03-31','2023-04-05',null),
(9,9,9,1,0,'2023-04-09','2023-04-13',null),
(10,10,7,1,1,'2023-04-23','2023-04-24',null),
(11,11,17,2,4,'2023-05-30','2023-06-02',null),
(12,12,6,2,0,'2023-06-10','2023-06-14',null),
(12,12,8,1,0,'2023-06-10','2023-06-14',null),
(13,6,12,3,0,'2023-06-17','2023-06-18',1),
(14,1,5,2,0,'2023-06-28','2023-07-02',null),
(15,9,4,3,1,'2023-07-13','2023-07-14',1),
(16,10,17,4,2,'2023-07-18','2023-07-21',1),
(17,3,11,2,1,'2023-07-28','2023-07-29',null),
(18,3,13,1,0,'2023-08-30','2023-09-01',null),
(19,2,8,2,0,'2023-09-16','2023-09-17',null),
(20,5,3,2,'2','2023-09-13','2023-09-15',null),
(21,4,17,2,2,'2023-11-22','2023-11-25',null),
(22,2,6,2,0,'2023-11-22','2023-11-25',null),
(22,2,9,2,2,'2023-11-22','2023-11-25',null),
(23,11,10,2,0,'2023-12-24','2023-12-28',null);

-- Checking GuestId for Jeremiah Pendergrass
SELECT * FROM Guest
WHERE FirstName = 'Jeremiah' AND LastName = 'Pendergrass';

-- Checking for records for  Jeremiah Pendergrass with GuestId = 8 in the Reservation table.
SELECT * FROM reservation
WHERE GuestId = 8 ;

-- Deleting Jeremiah Pendergrass reservation from the Reservation table.
DELETE FROM Reservation
WHERE ReservationId = 8 AND GuestId = 8 AND RoomId = 12;

-- Deleting Jeremiah Pendergrass record from the Guest table
DELETE FROM Guest
WHERE GuestId = 8;
