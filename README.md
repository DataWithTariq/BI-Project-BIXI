# 🚴‍♂️ BIXI Montréal 2021 – End-to-End Data Analytics Project

This repository documents a complete **Business Intelligence (BI) project**, from **open data collection** to the creation of a **Power BI dashboard**. The dataset contains detailed information on bike-sharing trips in Montreal during 2021, sourced from BIXI via Kaggle.

---

## 📌 Project Overview

| Stage | Description |
|-------|-------------|
| 🔍 **Data Discovery** | Found raw BIXI 2021 trip data on [Kaggle]                                        |
| 🧹 **Data Cleaning** | Cleaned missing values, validated geospatial fields, standardized formats         |
| 🏗️ **Data Modeling** | Modeled a star schema (fact + dimension tables), built the `gold.trips_2021` view |
| 📊 **Reporting** | Developed an interactive Power BI dashboard with filters and KPIs                     |
| 🚀 **Delivery** | Dashboard published internally / to Power BI Service (optional embed link)             |

---

## 🧾 Dataset Summary

- 📁 **Source**: Kaggle BIXI Montréal 2021  
- 📈 **Records**: ~2.5 million bike trips  
- 📍 **Fields**:
  - Trip timestamps (start/end)
  - Start and end station coordinates
  - Trip durations
  - Membership status (member vs non-member)

---

## 🗂️ Data Model – Star Schema

- **Fact Table**
  - `fact_trips_2021` (derived from original CSV)
- **Dimension Tables**
  - `dim_stations` – enriched with station names and geo-coordinates
  - `dim_date` – calendar table with date hierarchies
  - `dim_users` – classified by member type

🧮 The main reporting view: `gold.trips_2021`

> ✅ See [📚 Data Catalog](./docs/data_catalog.md)

---

## 📊 Power BI Dashboard Features

| Feature | Description |
|---------|-------------|
| 📆 Date filters | Filter by day, week, month, season                          |
| 📍 Station-level insights | Most popular stations for departures and arrivals |
| 👥 User behavior | Compare member vs non-member trip patterns                 |
| 🕓 Time trends | Track usage peaks by time of day and month                   |
| 🗺️ Maps | Interactive geospatial visualizations for station activity          |

📎 Screenshot example:  
![Dashboard preview](./assets/dashboard_preview.png)

---

## 🧠 Key KPIs

- 🚲 Total trips  
- ⏳ Average trip duration  
- 📈 Trip volume trend  
- 🔁 Most common routes (Start → End)  
- 👤 % of trips by members vs casual users

---

## 🛠️ Tools & Technologies

| Tool           | Use Case                              |
|----------------|---------------------------------------|
| **Power BI**   | Dashboard creation & storytelling     |
| **SQL Server** | Data storage & transformation         |
| **DAX / M**     | Data modeling & calculated metrics   |
| **Power Query**| Data cleaning & preparation           |
| **Excel**      | Intermediate analysis & prototyping   |

---

## 📁 Repository Structure
📦 bixi-2021-project/

├── 📁 data/
│ ├── raw/ # Original datasets (e.g., CSVs from Kaggle)
│ └── cleaned/ # Cleaned and pre-processed data files
│
├── 📁 sql/
│ ├── create_tables.sql # DDL scripts for staging and gold layers
│ ├── transformations.sql # Data transformations and view creation
│ └── sample_queries.sql # Queries used for exploration and reporting
│
├── 📁 powerbi/
│ └── BIXI_2021_Dashboard.pbix # Power BI dashboard file
│
├── 📁 docs/
│ ├── data_catalog.md # Detailed data dictionary for gold layer
│ └── model_schema.png # ERD or star schema image (optional)
│
├── 📁 assets/
│ ├── dashboard_preview.png # Screenshot(s) of the dashboard
│ └── station_map.png # Any additional visual content
│
└── README.md # Project overview and documentation


---

## 📌 Project Highlights

- ✅ Demonstrates **data cleaning, modeling, and reporting** in one cohesive project.
- ✅ Uses **open public data** to simulate real-world business scenarios.
- ✅ Emphasizes **geospatial analysis** and time-based metrics.
- ✅ Tailored for **business intelligence portfolios**, especially in transportation, mobility, or smart cities.

---

## 🚀 Future Improvements

- 🧩 Add weather data for weather/usage correlation.
- 🗺️ Enrich station metadata (e.g., neighborhoods, capacity).
- 📱 Publish dashboard to Power BI Service with real-time refresh.
- 📦 Automate pipeline using Power BI Gateway or Power Automate.

---

## 🤝 Acknowledgements
 
- [Kaggle Dataset](https://www.kaggle.com/datasets/aurelienponcins/bixi-montreal-bike-sharing-data-2021) – open data source  
- Icons by [FontAwesome](https://fontawesome.com) and [Twemoji](https://twemoji.twitter.com/)  

---

## 📜 License

This project is licensed under the MIT License.  
For academic, non-commercial, and educational use only.

---

## 🙋‍♂️ About Me

👋 Hi, I’m Tariq Ladidji, a Business Intelligence & Data Analyst.  
I specialize in turning raw data into actionable insights through Power BI, SQL, and data modeling.

- 📫 [email](tariqladidji43@gmail) 
- 💼 [LinkedIn](https://www.linkedin.com/in/tariq-ladidji-b08951311/)  
- 🌐 [Portfolio](https://yourwebsite.com) *(optional)*

---

Thanks for checking out this project!  
If you found it helpful, feel free to ⭐ star the repo or connect with me!


