# -OLA-Ride-Booking-Analytics-SQL-Power-BI-Project

# 🚖 OLA Ride Booking Analytics — SQL & Power BI Project

> End-to-end data analyst project on 1,03,025 ride-booking records for OLA's Bengaluru operations (July 2024) — from raw data → SQL modeling → Power BI dashboard → business insights.

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![PowerBI](https://img.shields.io/badge/Visualization-Power%20BI-yellow)

---

## 📌 Project Overview

This project simulates a real-world ride-hailing analytics workflow for **OLA**. A synthetic but realistic dataset of Bengaluru bookings (1 month, ~1 lakh rows) was:

1. Generated with defined business rules (success rate, cancellation caps, weekend demand spikes, etc.)
2. Loaded into a **SQL database** and queried using views to answer 10 core business questions
3. Visualized in an interactive **5-page Power BI dashboard** (Overall, Vehicle Type, Revenue, Cancellation, Ratings)
4. Summarized into a **KPI + insights report** with actionable business recommendations

---

## 🗂️ Repository Structure


---

## 🧱 Dataset

| Attribute | Detail |
|---|---|
| Rows | 1,03,025 |
| Time period | July 2024 (1 month) |
| City | Bengaluru |
| Columns | 19 (Date, Time, Booking_ID, Booking_Status, Customer_ID, Vehicle_Type, Pickup/Drop Location, VTAT, CTAT, Cancellation reasons, Incomplete ride reasons, Booking_Value, Payment_Method, Ride_Distance, Driver/Customer Ratings) |
| Vehicle types | Auto, Prime Plus, Prime Sedan, Mini, Bike, eBike, Prime SUV |

Business rules baked into the data: ~62% success rate, customer cancellations capped at ~7–18%, driver cancellations capped at ~18%, incomplete rides under 6%, higher order values on weekends.

---

## 🛠️ Tech Stack

- **SQL (PostgreSQL)** — schema design, data import, aggregation views
- **Power BI** — interactive dashboarding (5 report pages)
- **Excel/CSV** — source data staging
- **Python (reportlab)** — automated PDF insight report generation

---

## 🧮 SQL Analysis

10 business questions answered via SQL views (see `sql/OLA_Analysis_Structured.sql`):

1. Retrieve all successful bookings
2. Average ride distance per vehicle type
3. Total rides cancelled by customers
4. Top 5 customers by ride count
5. Driver cancellations due to personal & car-related issues
6. Max/min driver ratings for Prime Sedan
7. All rides paid via UPI
8. Average customer rating per vehicle type
9. Total booking value of successful rides
10. Incomplete rides with reasons

---

## 📊 Power BI Dashboard

5 report pages:

| Page | Contents |
|---|---|
| **Overall** | Total bookings, total value, booking status breakdown, ride volume trend |
| **Vehicle Type** | Booking value, success value, avg. & total distance per vehicle type |
| **Revenue** | Ride distance trend, revenue by payment method, top 5 customers |
| **Cancellation** | Cancellation reason breakdown — customer vs driver |
| **Ratings** | Average driver & customer ratings per vehicle type |

---

## 💡 Key Insights

- Only **62.1%** of bookings complete successfully — 38% lost to cancellations/driver-not-found.
- **Driver-side cancellations (17.9%)** are ~2x customer-side cancellations (10.2%) — the biggest single loss driver is **"personal & car related issues."**
- Booking value is spread almost evenly across all 7 vehicle types (no single category dominates).
- **Cash (Rs. 19M) + UPI (Rs. 14M)** make up ~96% of revenue; card payments are negligible.
- Driver and customer ratings are consistently high (~3.98–4.01/5) across every vehicle type.
- Ride volume/distance spike around **day 30 (month-end)** — an opportunity for dynamic pricing.

Full write-up with charts: `report/OLA_Project_Report.pdf`

---

## 🚀 How to Reproduce

1. Import `data/Booking_ola_row.xlsx` (as CSV) into PostgreSQL using the `COPY` command in `sql/OLA_Analysis_Structured.sql`.
2. Run the SQL file to create the database, table, and all 10 analysis views.
3. Open `powerbi/OLA_Dashboard.pbix` in Power BI Desktop and point the data source to your database/CSV.
4. Refresh the dashboard to regenerate visuals.

---

## 👤 Author

**[ Name Niteesh Pandey]**
Data Analyst | SQL · Power BI · Python
🔗 [LinkedIn]() 
• [Portfolio]()

---





