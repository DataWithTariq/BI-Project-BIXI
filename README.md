# BIXI Montreal 2021 – End-to-End Data Analytics Project

This project covers the full lifecycle of a business intelligence pipeline, from raw open data to an interactive Power BI dashboard. The dataset contains detailed information on bike-sharing trips in Montreal during 2021, sourced from BIXI via Kaggle (~5.5 million trips).

---

## Project Overview

The goal was to build a clean, structured analytics solution that anyone in a business context can actually use. Starting from messy raw CSV files, the data goes through cleaning, modeling into a star schema, and finally a dashboard that surfaces trip trends, station activity, and user behavior patterns.

| Stage | Description |
|-------|-------------|
| Data Discovery | Raw BIXI 2021 trip data from Kaggle |
| Data Cleaning | Missing value handling, geospatial validation, format standardization |
| Data Modeling | Star schema design, building the `gold.trips_2021` reporting view |
| Reporting | Interactive Power BI dashboard with filters and KPIs |
| Delivery | Dashboard published to Power BI Service |

---

## Dataset

- **Source**: Kaggle BIXI Montreal 2021
- **Records**: ~5.5 million bike trips
- **Fields**: Trip timestamps (start/end), station coordinates, trip duration, membership status (member vs. non-member)

---

## Data Model

The model follows a star schema with a central fact table and two supporting dimensions.

**Fact Table**: `fact_trips_2021` — derived from the original CSV, one row per trip.

**Dimension Tables**:
- `dim_stations` — station names and geo-coordinates
- `dim_date` — calendar table with date hierarchies for time intelligence

The main reporting view is `gold.trips_2021`. See the [data catalogue](docs/data_catalogue) for full column definitions.

---

## Power BI Dashboard

The dashboard is built around five areas of analysis:

- **Date filters** — slice by day, week, month, or season
- **Station insights** — most popular departure and arrival stations
- **User behavior** — member vs. non-member trip patterns side by side
- **Time trends** — usage peaks by hour of day and month
- **Geospatial map** — interactive station activity visualization

[View the live dashboard](https://app.powerbi.com/view?r=eyJrIjoiZjU5YTBmYzEtM2FhNC00YTc2LWI2NGYtM2Y0NmQ1OTRkYjQxIiwidCI6ImM3OTkwYjAwLTgwNWUtNGU0OS1hZTg3LWVmY2Q2ZjBhMTc4OCJ9)

![BIXI Dashboard](https://github.com/user-attachments/assets/d9116a7f-02d7-4967-8b7e-a8f3abdf451c)

---

## Key KPIs

The dashboard tracks total trips, average trip duration, volume trends over time, the most common start-to-end routes, and the split between member and casual trips.

---

## Tools and Technologies

| Tool | Use |
|------|-----|
| SQL Server | Data storage and transformation |
| Power Query | Data cleaning and preparation |
| DAX / M | Calculated metrics and modeling |
| Power BI | Dashboard and storytelling |
| Excel | Intermediate analysis and prototyping |

---

## What I Learned

This project gave me hands-on experience with the full BI workflow — not just the technical side but also thinking about what questions a business actually wants answered. Geospatial analysis and time-based segmentation turned out to be the most interesting parts, and I wanted to make sure the dashboard told a clear story rather than just displaying numbers.

---

## Future Improvements

A few directions I'd like to explore next: adding weather data to study usage correlation with temperature and precipitation, enriching station metadata with neighborhood context, and automating the pipeline refresh with Power BI Gateway or Power Automate.

---

## Acknowledgements

Dataset sourced from [Kaggle](https://www.kaggle.com/datasets/camilleb469/bixi-open-data-2021/data) — thanks to Camille B. for making it available.

---

## About

Hi, I'm Tariq Ladidji — a Data Engineer with a BI background based in Montreal. I build data systems that analysts and business teams actually want to use.

- [LinkedIn](https://www.linkedin.com/in/tariq-ladidji-b08951311/)
- [Email](mailto:tariqladidji43@gmail.com)

---

*Licensed under MIT for academic and non-commercial use.*
