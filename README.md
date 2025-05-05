# Hotel Resrvation SQL Analysis


![7bx40uyj](https://github.com/user-attachments/assets/12d8bc25-7fb6-474b-8f3f-e48bc819a8d4)

## Table of Contents

- [Introduction](#Introduction)
- [Dataset Overview](#Datset-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning-and-Transformation)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Conclusion](#Conclusion)
- [Recommendation](#Recommendation)
- ## Introduction
  The hotel industry relies on data to make informed decisions and provide a better guest experience.
   In this internship, I worked with a hotel reservation dataset to gain insights into guest preferences, booking trends,
   and other key factors that impact the hotel’s operations. I used SQL to query and analyze the data, as well as answer specific questions about the dataset.

---

  ## Dataset Overview
  The dataset includes the following columns:
- Booking_ID:  A unique identifier for each hotel reservation
- No_of_adults: The number of adults in the reservation.
-	No_of_children: The number of children in the reservation. 
-	No_of_weekend_nights: The number of nights in the reservation that fall on weekends. 
-	 No_of_week_nights: The number of nights in the reservation that fall on weekdays.
-	 Type_of_meal_plan: The meal plan chosen by the guests. 
-	Room_type_reserved: The type of room reserved by the guests. 
-	Lead_time: The number of days between booking and arrival.
-	Arrival_date: The date of arrival.
-	Market_segment_type: The market segment to which the reservation belongs. 
-	Avg_price_per_room: The average price per room in the reservation.
-	Booking_status: The status of the booking.
- The dataset also has 700 rows.

---

## Project objective
I was tasked with analyzing this hotel reservation dataset using SQL. Here are 15 questions for which you will write SQL queries to gain insights: 
1. What is the total number of reservations in the dataset?
2. Which meal plan is the most popular among guests? 
3. What is the average price per room for reservations involving children?
4. How many reservations were made for the year 20XX (replace XX with the desired year)?
5. What is the most commonly booked room type? 
6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
7. What is the highest and lowest lead time for reservations? 
8. What is the most common market segment type for reservations? 
9. How many reservations have a booking status of "Confirmed"? 
10. What is the total number of adults and children across all reservations? 
11. What is the average number of weekend nights for reservations involving children?
 12. How many reservations were made in each month of the year? 
13. What is the average number of nights (both weekend and weekday) spent by guests for each 0room type? 
14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
15. Find the market segment type that generates the highest average price per room.

---

![Screenshot 2025-02-13 105710](https://github.com/user-attachments/assets/ff38c2eb-dcd0-441c-a9c2-d79e07de07d2)

---

## Data Cleaning and Transformation
- Rename Table
```sql
RENAME TABLE `hotel reservation dataset` to  hotel_reservation_data;
```

- Standardizing data format
```sql
SET SQL_SAFE_UPDATES = 0;
UPDATE hotel_reservation_data
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%YYYY");
```

- Changed Arrival_date Datatype
```sql
ALTER TABLE hotel_reservation_data
MODIFY COLUMN arrival_date DATE;
```

---

## Data Exploration and Insights

1. What is the total number of reservations in the dataset?  
INSIGHTS: The total number of reservations in the dataset is 700.

2. Which meal plan is the most popular among guests? 
INSIGHTS: The most popular meal plan among the guests is Meal plan 1.

3. What is the average price per room for reservations involving children?
INSIGHTS: Room_type 6 has the highest average price and Room_tye 4 has the least average price.
4. How many reservations were made for the year 20XX (replace XX with the desired year)?  
INSIGHTS: The hotel made 194 reservations in 2017 and 501 reservations in 2018.

5. What is the most commonly booked room type?  
INSIGHTS: Room_type 1 is the most commonly booked hotel.

6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
INSIGHTS: 383 reservations fall on Weekend Night

7. What is the highest and lowest lead time for reservations?
INSIGHTS: Highest lead time is 443 and lowest is 0.

8. What is the most common market segment type for reservations?  
INSIGHTS: The most common market segment type for reservation is ONLINE.

9. How many reservations have a booking status of "Confirmed"?  
INSIGHTS: 493 reservations.

10. What is the total number of adults and children across all reservations?  
INSIGHTS: Total number of adults and children is 1385.

11. What is the average number of weekend nights for reservations involving children?  
INSIGHTS: The average number of weekend nights for reservations involving children is 1.00.

12. How many reservations were made in each month of the year?
INSIGHTS: January, February, October had the highest reservations with 90,80 and 74 counts respectively and May, June, November had the least counts with 44,36,34 respectively.

13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
INSIGHTS: The average number of nights for each room type are
Room_Type 1 – 2.79,
Room_Type 2 – 3.17,
Room_Type 4 – 3.45,
Room_Type 5 – 2.50,
Room_Type 6 – 3.11,
Room_Type 7 – 2.60.

14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

INSIGHTS: The most common room type is Room_type 1 and the Average price is 123.12.

15. Find the market segment type that generates the highest average price per room. 
 
INSIGHTS: ONLINE generates the highest average price per room.

---

## Conclusion
The insights from this dataset provide valuable information for improving the hotel’s operations and revenue. 
The hotel should capitalize on high-performing meal plans, room types, and market segments while introducing strategies to boost bookings during low-demand periods. 
By implementing dynamic pricing, enhancing customer experience, and focusing on digital marketing, the hotel can maximize profitability and ensure long-term success.

---

## Recommendation
- Optimize Meal Plan Offerings: Since Meal Plan 1 is the most popular, 
consider enhancing its value by adding more appealing options or offering discounts on bulk bookings.
- Adjust Pricing Strategy for Room Types: Room Type 6 has the highest average price, 
while Room Type 4 has the lowest. Consider analyzing customer preferences and room occupancy rates to adjust pricing strategies and improve revenue.
- Focus on High-Booking Months: Since January, February, and October have the highest number of reservations, 
implement targeted marketing campaigns during these months to maximize occupancy. For the low-booking months (May, June, and November), 
consider offering discounts or special promotions to attract more guests.
- Leverage Online Market Segments: The majority of bookings come from the ONLINE market segment. Invest in online advertising, SEO, 
and partnerships with travel agencies to increase visibility and attract more customers.
- Improve Weekend Offers: With 383 reservations falling on weekends, the hotel can introduce weekend-specific promotions, 
packages, or discounts to further boost weekend bookings.
- Enhance Customer Experience for Families: Since Room Type 1 is the most preferred for reservations involving children, 
consider improving family-friendly amenities in these rooms. Offer discounts or complimentary services for families to encourage repeat bookings.
- Optimize Lead Time Management: With a lead time range from 0 to 443 days, the hotel can implement dynamic pricing models based on booking windows. 
Encourage early bookings with discounts while introducing last-minute deals for unsold rooms.
- Increase Upselling Opportunities: With 493 confirmed reservations, the hotel should focus on upselling services such as premium rooms, spa treatments, and dining options to maximize revenue.
- Monitor Market Trends: Since ONLINE bookings generate the highest average room price, consider focusing marketing efforts on digital platforms, enhancing the hotel website, and offering exclusive online discounts.



