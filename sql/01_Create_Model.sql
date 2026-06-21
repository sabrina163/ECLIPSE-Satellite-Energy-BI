USE SatelliteDW;
GO

DROP TABLE IF EXISTS BIRDS_Fact_eps_telemetry;
DROP TABLE IF EXISTS BIRDS_Dim_weather;
DROP TABLE IF EXISTS BIRDS_Dim_satellite;
DROP TABLE IF EXISTS BIRDS_Dim_date;
DROP TABLE IF EXISTS BIRDS_Dim_time;
DROP TABLE IF EXISTS BIRDS_Stg_eps_telemetry;
DROP TABLE IF EXISTS BIRDS_Stg_weather;
GO

CREATE TABLE BIRDS_Dim_date (
    date_id INT PRIMARY KEY,
    date_ DATE NOT NULL,
    day_ INT,
    month_ INT,
    month_name VARCHAR(20),
    year_ INT,
    weekday_name VARCHAR(20)
);
GO

CREATE TABLE BIRDS_Dim_time (
    time_id INT PRIMARY KEY,
    time_ TIME(0) NOT NULL,
    hour_ INT,
    minute_ INT,
    second_ INT
);
GO

CREATE TABLE BIRDS_Dim_satellite (
    satellite_id INT IDENTITY(1,1) PRIMARY KEY,
    satellite_name VARCHAR(50),
    platform VARCHAR(50),
    orbit_altitude_km FLOAT,
    inclination_deg FLOAT
);
GO

CREATE TABLE BIRDS_Dim_weather (
    spaceweather_id INT IDENTITY(1,1) PRIMARY KEY,
    time_tag DATETIME2,
    kp_index FLOAT,
    ap FLOAT,
    sn FLOAT,
    fobs FLOAT,
    geomagnetic_level VARCHAR(50)
);
GO

CREATE TABLE BIRDS_Stg_eps_telemetry (
    satellite_name VARCHAR(50),
    sheet_name VARCHAR(100),

    measurement_datetime DATETIME2,
    measurement_date DATE,
    measurement_time TIME,

    time_offset_s FLOAT,
    sampling_mode VARCHAR(50),

    battery_voltage_V FLOAT,
    battery_current_mA FLOAT,
    battery_temperature_C FLOAT,
    battery_power_W FLOAT,
    battery_level_percent FLOAT,

    solar_power_W FLOAT,
    consumption_W FLOAT,
    energy_balance_W FLOAT,

    vpx_mV FLOAT,
    vpy_mV FLOAT,
    vpz_mV FLOAT,
    vmx_mV FLOAT,
    vmz_mV FLOAT,

    ipx_mA FLOAT,
    ipy_mA FLOAT,
    ipz_mA FLOAT,
    imx_mA FLOAT,
    imz_mA FLOAT,

    tpx_C FLOAT,
    tpy_C FLOAT,
    tpz_C FLOAT,
    tmx_C FLOAT,
    tmz_C FLOAT
);
GO

CREATE TABLE BIRDS_Stg_weather (
    time_tag DATETIME2,
    kp_index FLOAT,
    ap FLOAT,
    sn FLOAT,
    fobs FLOAT,
    geomagnetic_level VARCHAR(50)
);
GO

CREATE TABLE BIRDS_Fact_eps_telemetry (
    birds_telemetry_id INT IDENTITY(1,1) PRIMARY KEY,

    satellite_id INT NOT NULL,
    date_id INT NOT NULL,
    time_id INT NOT NULL,
    spaceweather_id INT NULL,

    measurement_datetime DATETIME2 NOT NULL,
    time_offset_s FLOAT,
    sampling_mode VARCHAR(50),

    battery_voltage_V FLOAT,
    battery_current_mA FLOAT,
    battery_temperature_C FLOAT,
    battery_power_W FLOAT,
    battery_level_percent FLOAT,

    solar_power_W FLOAT,
    consumption_W FLOAT,
    energy_balance_W FLOAT,

    vpx_mV FLOAT,
    vpy_mV FLOAT,
    vpz_mV FLOAT,
    vmx_mV FLOAT,
    vmz_mV FLOAT,

    ipx_mA FLOAT,
    ipy_mA FLOAT,
    ipz_mA FLOAT,
    imx_mA FLOAT,
    imz_mA FLOAT,

    tpx_C FLOAT,
    tpy_C FLOAT,
    tpz_C FLOAT,
    tmx_C FLOAT,
    tmz_C FLOAT,

    CONSTRAINT FK_BIRDS_Fact_Satellite
        FOREIGN KEY (satellite_id)
        REFERENCES BIRDS_Dim_satellite(satellite_id),

    CONSTRAINT FK_BIRDS_Fact_Date
        FOREIGN KEY (date_id)
        REFERENCES BIRDS_Dim_date(date_id),

    CONSTRAINT FK_BIRDS_Fact_Time
        FOREIGN KEY (time_id)
        REFERENCES BIRDS_Dim_time(time_id),

    CONSTRAINT FK_BIRDS_Fact_Weather
        FOREIGN KEY (spaceweather_id)
        REFERENCES BIRDS_Dim_weather(spaceweather_id)
);
GO