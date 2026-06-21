USE SatelliteDW;
GO

SELECT COUNT(*) AS stg_eps_rows
FROM BIRDS_Stg_eps_telemetry;

SELECT COUNT(*) AS stg_weather_rows
FROM BIRDS_Stg_weather;

SELECT COUNT(*) AS dim_date_rows
FROM BIRDS_Dim_date;

SELECT COUNT(*) AS dim_time_rows
FROM BIRDS_Dim_time;

SELECT COUNT(*) AS dim_satellite_rows
FROM BIRDS_Dim_satellite;

SELECT COUNT(*) AS dim_weather_rows
FROM BIRDS_Dim_weather;

SELECT COUNT(*) AS fact_rows
FROM BIRDS_Fact_eps_telemetry;
GO

SELECT TOP 20
    f.measurement_datetime,
    s.satellite_name,
    f.battery_voltage_V,
    f.battery_current_mA,
    f.battery_level_percent,
    f.solar_power_W,
    f.consumption_W,
    f.energy_balance_W,
    w.kp_index,
    w.geomagnetic_level
FROM BIRDS_Fact_eps_telemetry f
JOIN BIRDS_Dim_satellite s
    ON f.satellite_id = s.satellite_id
LEFT JOIN BIRDS_Dim_weather w
    ON f.spaceweather_id = w.spaceweather_id
ORDER BY f.measurement_datetime;
GO

SELECT TOP 20
    measurement_datetime,
    kp_index,
    ap,
    geomagnetic_level
FROM BIRDS_Fact_eps_telemetry f
LEFT JOIN BIRDS_Dim_weather w
    ON f.spaceweather_id = w.spaceweather_id;

SELECT
    MIN(battery_level_percent) AS min_battery,
    MAX(battery_level_percent) AS max_battery,

    MIN(solar_power_W) AS min_solar,
    MAX(solar_power_W) AS max_solar,

    MIN(consumption_W) AS min_cons,
    MAX(consumption_W) AS max_cons
FROM BIRDS_Fact_eps_telemetry;

SELECT
    CASE
        WHEN battery_current_mA > 0 THEN 'Charge'
        ELSE 'Décharge'
    END AS mode_batterie,
    COUNT(*) nb
FROM BIRDS_Fact_eps_telemetry
GROUP BY
    CASE
        WHEN battery_current_mA > 0 THEN 'Charge'
        ELSE 'Décharge'
    END;

SELECT COUNT(*)
FROM BIRDS_Fact_eps_telemetry
WHERE battery_voltage_V = 0

SELECT
    w.geomagnetic_level,
    COUNT(*) AS nb_lignes
FROM BIRDS_Fact_eps_telemetry f
INNER JOIN BIRDS_Dim_weather w
    ON f.spaceweather_id = w.spaceweather_id
GROUP BY w.geomagnetic_level
ORDER BY nb_lignes DESC;

ALTER TABLE BIRDS_Fact_eps_telemetry
ADD latitude FLOAT NULL;

ALTER TABLE BIRDS_Fact_eps_telemetry
ADD longitude FLOAT NULL;

ALTER TABLE BIRDS_Fact_eps_telemetry
ADD altitude_km FLOAT NULL;

DROP TABLE BIRDS_Stg_eps_telemetry;