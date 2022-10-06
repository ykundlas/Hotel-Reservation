USE HotelReservation;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, 
-- the room number(s), and the reservation dates.

SELECT
CONCAT(FirstName, ' ', LastName) `GuestName`,
r.RoomNo,
re.StartDate,
re.EndDate
FROM Guest g
INNER JOIN Reservation re ON g.GuestId = re.GuestId
INNER JOIN Room r ON re.RoomId = r.RoomId
WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- Result(For Query 1)- 4 rows returned 
-- # GuestName	      RoomNo	       StartDate	  EndDate
-- Yashpreet Kundlas	205	          2023-06-28	2023-07-02
-- Walter Holaway	    204           2023-07-13    2023-07-14
-- Wilfred Vise	        401	          2023-07-18    2023-07-21
-- Bettyann Seery	    303           2023-07-28	2023-07-29

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT
CONCAT(FirstName, ' ', LastName) `GuestName`,
r.RoomNo,
re.StartDate,
re.EndDate
FROM Guest g
INNER JOIN Reservation re ON g.GuestId = re.GuestId
INNER JOIN Room r ON re.RoomId = r.RoomId
INNER JOIN RoomAmenity ra ON r.RoomId = ra.RoomId
INNER JOIN Amenity a ON ra.AmenityId = a.AmenityId
WHERE a.AmenityName = 'Jacuzzi';

-- Result(For Query 2) 11 rows returned
-- # GuestName	     RoomNo  StartDate	    EndDate
-- Karie Yang	      201	  2023-03-06	2023-03-07
-- Bettyann Seery	  203	  2023-02-05	2023-02-10
-- Karie Yang	      203	  2023-09-13	2023-09-15
-- Yashpreet Kundlas  205	  2023-06-28	2023-07-02
-- Wilfred Vise	      207	  2023-04-23	2023-04-24
-- Walter Holaway	  301     2023-04-09 	2023-04-13
-- Mack Simmer	      301	  2023-11-22	2023-11-25
-- Bettyann Seery     303	  2023-07-28	2023-07-29
-- Duane Cullison	  305	  2023-02-22	2023-02-24
-- Bettyann Seery	  305 	  2023-08-30    2023-09-01
-- Yashpreet Kundlas  307	  2023-03-17	2023-03-20

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT
CONCAT(FirstName, ' ', LastName) GuestName,
r.RoomNo,
re.StartDate,
re.Adults,
re.Children
FROM Guest g
INNER JOIN Reservation re ON g.GuestId = re.GuestId
INNER JOIN Room r ON re.RoomId = r.RoomId
WHERE CONCAT(FirstName, ' ', LastName) = 'Wilfred Vise';

-- Result(For Query 3)- 2 rows returned 
-- # GuestName	  RoomNo	StartDate	Adults	Children
--  Wilfred Vise   207	   2023-04-23	  1	     1
--  Wilfred Vise   401	   2023-07-18	  4	     2

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT DISTINCT
r.RoomNo,
re.ReservationId,
DATEDIFF(re.EndDate,re.StartDate) *(rt.BasePrice +(IFNULL(re.ExtraPerson,0)* IFNULL(rt.ExtraPersonCost,0)) +  SUM(a.ExtraCost)) RoomCost
FROM Room r
LEFT OUTER JOIN Reservation re ON  r.RoomId = re.RoomId
LEFT OUTER JOIN RoomType rt ON r.RoomTypeId = rt.RoomTypeId
LEFT OUTER JOIN RoomAmenity ra ON r.RoomId = ra.RoomId
LEFT OUTER JOIN Amenity a ON ra.AmenityId = a.AmenityId
GROUP BY re.ReservationId, r.roomNo;

-- Result(For Query 4)- 26 rows returned
-- # RoomNo	  ReservationId	RoomCost
--  201	          5	        199.99
--  202	          7	        349.98
--  203           3       	999.95
--  203           20  	    399.98
--  204	          15	    184.99
--  205	          14	    699.96
--  206	          12	    599.96
--  206	          22	    449.97
--  207	          10	    174.99
--  208	          12	    599.96
--  208	          19	    149.99
--  301	          9	        799.96
--  301	          22	    599.97
--  302	          6	        924.95
--  302	          23	    699.96
--  303           17	    199.99
--  304	          13	    184.99
--  305	          4	        349.98
--  305	          18	    349.98
--  306		      Null      Null
--  307	          1	        524.97
--  308           2	        299.98
--  401	          11	    1199.97
--  401	          16	    1259.97
--  401	          21	    1199.97
--  402		      Null      Null

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT 
r.RoomNo
From Room r
INNER JOIN Reservation re ON r.RoomId = re.RoomId
WHERE (re.Adults + re.Children)>= 3 AND (re.EndDate BETWEEN '2023-04-01' AND '2023-04-30' OR re.StartDate BETWEEN '2023-04-01' AND '2023-04-30');

-- Result(For Query 5)- 0 rows returned

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with
--    the guest with the most reservations and then by the guest's last name.

SELECT 
CONCAT(FirstName, ' ', LastName) GuestName,
COUNT(DISTINCT re.ReservationId) NumberOfReservations
FROM Reservation re
INNER JOIN Guest g ON  re.GuestId = g.GuestId
GROUP BY g.GuestId
ORDER BY COUNT(DISTINCT re.ReservationId) DESC, g.LastName;

-- # GuestName	 NumberOfReservations
-- Bettyann Seery	     3
-- Mack Simmer	         3
-- Duane Cullison	     2
-- Walter Holaway	     2
-- Yashpreet Kundlas	 2
-- Aurore Lipton	     2
-- Maritza Tilton	     2
-- Wilfred Vise	         2
-- Karie Yang	         2
-- Zachery Luechtefeld	 1
-- Joleen Tison	         1


-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number.
-- (Choose a phone number from the existing data.)

SELECT
CONCAT(FirstName, ' ', LastName) GuestName,
g.Address,
g.Phone
FROM Guest g
WHERE g.Phone LIKE '%893%';

-- Result(For Query 7)- 1 row returned
-- # GuestName	     Address	     Phone
-- Joleen Tison	   87 Queen St.	    (231)893-2755
