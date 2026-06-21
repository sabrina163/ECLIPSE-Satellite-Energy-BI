# 🚀 E.C.L.I.P.S.E.

## Energy Consumption & Load Intelligence Platform for Space Exploration

A complete Business Intelligence and Machine Learning project focused on analyzing and predicting the energy behavior of the **TSURU CubeSat** using real telemetry, orbital and space weather data.

---

## 🛰️ Project Context

Satellites rely on a delicate balance between energy production and energy consumption to remain operational in orbit.

This project investigates the energy performance of the **TSURU CubeSat**, a nanosatellite deployed from the International Space Station (ISS), by combining telemetry measurements, orbital parameters and space weather indicators.

The goal was to understand the factors influencing the satellite's energy system and evaluate whether Machine Learning could accurately predict its battery state.

---

## 🎯 Objectives

* Analyze the CubeSat energy system.
* Study the influence of space weather conditions.
* Evaluate the impact of orbital altitude.
* Build predictive Machine Learning models.
* Develop an interactive Power BI dashboard for data exploration.

---

## 📊 Dataset

The study is based on:

* More than **23,000 telemetry measurements**
* Approximately **302 days of mission data**
* Real satellite energy measurements
* NOAA and NASA space weather indicators
* ISS orbital parameters

---

## 🏗️ Data Pipeline

```text
APIs & Raw Data
       ↓
Python Data Processing
       ↓
SQL Server Data Warehouse
       ↓
Power BI Dashboard
       ↓
Machine Learning Models
```

---

## 📈 Dashboard Analysis

The Power BI dashboard includes six analysis pages:

### 1. Mission Overview

General mission context and key indicators.

### 2. Energy System Analysis

Battery voltage, solar production and energy balance.

### 3. Space Weather Monitoring

Analysis of Kp, Ap and Fobs indices.

### 4. Space Weather Impact

Comparison of energy performance under different geomagnetic conditions.

### 5. Orbital Altitude Analysis

Evaluation of the relationship between altitude and battery voltage.

### 6. Machine Learning

Model comparison, feature importance and prediction performance.

---

## 🤖 Machine Learning

Several regression models were trained and evaluated:

* Random Forest
* Gradient Boosting
* Extra Trees
* XGBoost

### Best Performing Model

| Model   | R²      | MAE    | RMSE   |
| ------- | ------- | ------ | ------ |
| XGBoost | 98.65 % | 0.0071 | 0.0098 |

The results demonstrate that the satellite energy state can be predicted with a very high level of accuracy using the available telemetry and environmental data.

---

## 🔍 Key Findings

✅ Solar panels provide sufficient energy to maintain satellite operations.

✅ No significant influence of space weather was observed during the studied period.

✅ Orbital altitude variations had minimal impact on battery voltage.

✅ Machine Learning achieved excellent predictive performance.

---

## 🛠️ Technologies Used

### Data Engineering

* Python
* Pandas
* NumPy

### Database

* SQL Server

### Business Intelligence

* Power BI

### Machine Learning

* Scikit-Learn
* XGBoost

### Version Control

* GitHub

---

## 📂 Repository Structure

```text
dashboard/      Power BI screenshots
notebooks/      Data preparation & Machine Learning notebooks
presentation/   Final presentation
sql/            SQL scripts and data warehouse creation
```

---

## 🔭 Future Improvements

* Integrate data from additional CubeSats of the BIRDS program.
* Analyze stronger geomagnetic storm events.
* Develop forecasting models capable of predicting energy status several hours ahead.
* Extend the platform to support additional satellite missions.

---

## 👩‍💻 Author

**Sabrina Gharbi**

Business Intelligence Consultant Training – Technifutur

2026
