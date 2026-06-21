USE SatelliteDW;
GO

DELETE FROM BIRDS_Fact_eps_telemetry;
GO

INSERT INTO BIRDS_Fact_eps_telemetry (
    satellite_id,
    date_id,
    time_id,
    spaceweather_id,
    latitude,
    longitude,
    altitude_km,

    measurement_datetime,
    time_offset_s,
    sampling_mode,

    battery_voltage_V,
    battery_current_mA,
    battery_temperature_C,
    battery_power_W,
    battery_level_percent,

    solar_power_W,
    consumption_W,
    energy_balance_W,

    vpx_mV,
    vpy_mV,
    vpz_mV,
    vmx_mV,
    vmz_mV,

    ipx_mA,
    ipy_mA,
    ipz_mA,
    imx_mA,
    imz_mA,

    tpx_C,
    tpy_C,
    tpz_C,
    tmx_C,
    tmz_C
)
SELECT
    sat.satellite_id,
    d.date_id,
    ti.time_id,
    sw.spaceweather_id,

    stg.latitude,
    stg.longitude,
    stg.altitude_km,

    stg.measurement_datetime,
    stg.time_offset_s,
    stg.sampling_mode,

    stg.battery_voltage_V,
    stg.battery_current_mA,
    stg.battery_temperature_C,
    stg.battery_power_W,
    stg.battery_level_percent,

    stg.solar_power_W,
    stg.consumption_W,
    stg.energy_balance_W,

    stg.vpx_mV,
    stg.vpy_mV,
    stg.vpz_mV,
    stg.vmx_mV,
    stg.vmz_mV,

    stg.ipx_mA,
    stg.ipy_mA,
    stg.ipz_mA,
    stg.imx_mA,
    stg.imz_mA,

    stg.tpx_C,
    stg.tpy_C,
    stg.tpz_C,
    stg.tmx_C,
    stg.tmz_C

FROM BIRDS_Stg_eps_telemetry stg

JOIN BIRDS_Dim_satellite sat
    ON sat.satellite_name = stg.satellite_name

JOIN BIRDS_Dim_date d
    ON d.date_ = stg.measurement_date

JOIN BIRDS_Dim_time ti
    ON ti.time_ = CAST(stg.measurement_time AS TIME(0))

OUTER APPLY (
    SELECT TOP 1 *
    FROM BIRDS_Dim_weather w
    WHERE w.time_tag <= stg.measurement_datetime
    ORDER BY w.time_tag DESC
) sw

WHERE stg.measurement_datetime IS NOT NULL;
GO
