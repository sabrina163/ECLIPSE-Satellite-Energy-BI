USE SatelliteDW;
GO

DELETE FROM BIRDS_Fact_eps_telemetry;
DELETE FROM BIRDS_Dim_weather;
DELETE FROM BIRDS_Dim_satellite;
DELETE FROM BIRDS_Dim_date;
DELETE FROM BIRDS_Dim_time;
GO

INSERT INTO BIRDS_Dim_date (
    date_id,
    date_,
    day_,
    month_,
    month_name,
    year_,
    weekday_name
)
SELECT DISTINCT
    CONVERT(INT, FORMAT(measurement_date, 'yyyyMMdd')) AS date_id,
    measurement_date,
    DAY(measurement_date),
    MONTH(measurement_date),
    DATENAME(MONTH, measurement_date),
    YEAR(measurement_date),
    DATENAME(WEEKDAY, measurement_date)
FROM BIRDS_Stg_eps_telemetry
WHERE measurement_date IS NOT NULL;
GO

INSERT INTO BIRDS_Dim_time (
    time_id,
    time_,
    hour_,
    minute_,
    second_
)
SELECT
    ROW_NUMBER() OVER (ORDER BY time_clean) AS time_id,
    time_clean,
    DATEPART(HOUR, time_clean),
    DATEPART(MINUTE, time_clean),
    DATEPART(SECOND, time_clean)
FROM (
    SELECT DISTINCT
        CAST(measurement_time AS TIME(0)) AS time_clean
    FROM BIRDS_Stg_eps_telemetry
    WHERE measurement_time IS NOT NULL
) t;
GO

INSERT INTO BIRDS_Dim_satellite (
    satellite_name,
    platform,
    orbit_altitude_km,
    inclination_deg
)
SELECT DISTINCT
    satellite_name,
    'BIRDS 1U CubeSat',
    400,
    51.6
FROM BIRDS_Stg_eps_telemetry
WHERE satellite_name IS NOT NULL;
GO

INSERT INTO BIRDS_Dim_weather (
    time_tag,
    kp_index,
    ap,
    sn,
    fobs,
    geomagnetic_level
)
SELECT DISTINCT
    time_tag,
    kp_index,
    ap,
    sn,
    fobs,
    geomagnetic_level
FROM BIRDS_Stg_weather
WHERE time_tag IS NOT NULL;
GO