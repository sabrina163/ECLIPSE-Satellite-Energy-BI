# 🚀 E.C.L.I.P.S.E.

## Energy Consumption & Load Intelligence Platform for Space Exploration

Business Intelligence and Machine Learning project focused on the analysis and prediction of the energy behavior of the **TSURU CubeSat** using real telemetry, orbital and space weather data.

---

## 📖 Project Overview

The objective of this project is to better understand how a nanosatellite manages its energy resources while orbiting the Earth.

The study combines:

* Satellite telemetry data
* Space weather indicators (Kp, Ap, Fobs)
* Orbital parameters from the ISS
* Machine Learning models

More than **23,000 real measurements** were analyzed over approximately **302 days of mission operations**.

---

## 🎯 Objectives

* Analyze the CubeSat energy system
* Evaluate the impact of space weather
* Evaluate the impact of orbital altitude
* Build predictive Machine Learning models
* Create an interactive Power BI dashboard

---

## 🛰️ Studied Satellite

**TSURU CubeSat**

* BIRDS Program
* Deployed from the International Space Station (ISS)
* Low Earth Orbit (~400 km)

---

## 🏗️ Project Architecture

API Data Collection

↓

Python Data Processing

↓

SQL Server Data Warehouse

↓

Power BI Dashboard

↓

Machine Learning Models

---

## 📊 Dashboard Analysis

The dashboard includes:

### Energy Monitoring

* Battery voltage analysis
* Solar production analysis
* Energy balance monitoring

### Space Weather Analysis

* Kp Index
* Ap Index
* Solar Flux (Fobs)

### Orbital Analysis

* Altitude monitoring
* Orbital parameter analysis

### Machine Learning

* Model comparison
* Feature importance analysis
* Prediction performance evaluation

---

## 🤖 Machine Learning Models

Several regression models were evaluated:

* Random Forest
* Gradient Boosting
* Extra Trees
* XGBoost

### Best Model

**XGBoost**

| Metric | Value   |
| ------ | ------- |
| R²     | 98.65 % |
| MAE    | 0.0071  |
| RMSE   | 0.0098  |

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
dashboard/       Power BI screenshots
images/          Project illustrations
notebooks/       Python notebooks
presentation/    Final presentation
report/          Final report
sql/             SQL scripts
```

---

## 🔭 Future Improvements

* Integrate additional CubeSats from the BIRDS program
* Analyze stronger geomagnetic storms
* Develop energy forecasting models several hours ahead
* Extend the platform to other satellite missions

---

## 👩‍💻 Author

**Sabrina Gharbi**

Business Intelligence Consultant Training – Technifutur

2026
