

RENAME TABLE `hotel reservation dataset` TO hotel_reservation_data;

SELECT * FROM hotel_reservation_data;

-- 1. What is the total number of reservations in the dataset?  
SELECT COUNT(Booking_ID) AS total_reservations FROM hotel_reservation_data;

-- 2. Which meal plan is the most popular among guests?  
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS most_popular_meal_plan FROM hotel_reservation_data
WHERE booking_status = "Not_Canceled"
GROUP BY type_of_meal_plan
ORDER BY most_popular_meal_plan DESC LIMIT 1;

-- 3. What is the average price per room for reservations involving children?  
SELECT room_type_reserved, round(avg(avg_price_per_room)) as Avg_price FROM hotel_reservation_data
WHERE no_of_children > 0
Group by room_type_reserved, no_of_children;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  
SET SQL_SAFE_UPDATES = 0;

UPDATE hotel_reservation_data
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%YYYY");
ALTER TABLE hotel_reservation_data
MODIFY COLUMN arrival_date DATE;

ALTER TABLE hotel_reservation_data
ADD COLUMN Reservation_Date DATE;
UPDATE hotel_reservation_data
SET Reservation_Date = DATE_SUB(arrival_date, INTERVAL lead_time DAY);

-- Number of reservation in 2017 using the left string method
SELECT COUNT(Reservation_Date) AS 2017_reservation FROM hotel_reservation_data
WHERE LEFT(Reservation_Date, 4) = 2017;

-- Number of reservation in 2018 using the Year method in DateTime
SELECT COUNT(Reservation_Date) AS 2018_reservation FROM hotel_reservation_data
WHERE YEAR(Reservation_Date) = 2018;

-- 5. What is the most commonly booked room type?  
SELECT room_type_reserved, count(room_type_reserved) AS Commonly_booked_room FROM hotel_reservation_data
group by room_type_reserved
order by Commonly_booked_room desc
limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(no_of_weekend_nights) AS weekend_reservation FROM hotel_reservation_data
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?  
SELECT MAX(lead_time) AS highest_leadtime, MIN(lead_time) AS lowest_leadtime FROM hotel_reservation_data;

-- 8. What is the most common market segment type for reservations?  
SELECT Market_segment_type, count(market_segment_type) AS count FROM hotel_reservation_data
group by market_segment_type
order by count desc
limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?  
SELECT COUNT(booking_status) AS confirmed_booking_status FROM hotel_reservation_data
WHERE booking_status = "Not_Canceled"; 

-- 10. What is the total number of adults and children across all reservations?   
SELECT SUM(no_of_adults)as Total_adults, SUM(no_of_children) AS total_children, 
sum(no_of_adults + no_of_children) as Total_number_of_adults_ad_children FROM hotel_reservation_data;

-- 11. What is the average number of weekend nights for reservations involving children?  
SELECT round(AVG(no_of_weekend_nights),2) AS avg_weekend_nights FROM hotel_reservation_data
WHERE no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 
SELECT MONTHNAME(Reservation_Date) AS mnt_name, MONTH(Reservation_Date) AS mnt_number, COUNT(Reservation_Date) FROM hotel_reservation_data
GROUP BY mnt_name, mnt_number
ORDER BY mnt_number;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
SELECT room_type_reserved,round(AVG(no_of_week_nights) + AVG(no_of_weekend_nights),2) AS avg_number_of_nights FROM hotel_reservation_data
where booking_status = "Not_canceled"
GROUP BY room_type_reserved
order by avg_number_of_nights desc;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
SELECT room_type_reserved, COUNT(room_type_reserved) AS total_reservation, round(avg(avg_price_per_room),2) as avg_price_per_room FROM hotel_reservation_data
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY total_reservation DESC LIMIT 1;

-- 15. Find the market segment type that generates the highest average price per room.  
SELECT market_segment_type, round(avg(avg_price_per_room),2) AS highest_avg_price FROM hotel_reservation_data
GROUP BY market_segment_type
ORDER BY highest_avg_price DESC LIMIT 1;

SELECT * FROM hotel_reservation_data;