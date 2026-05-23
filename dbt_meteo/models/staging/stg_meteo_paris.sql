-- Nettoyage de la donnée brute météo

with source as (
    select * from meteo_source.meteo_paris
),


cleaned as (
    select
        timestamp::timestamp    as measured_at,
        date::date              as measured_date,
        heure::integer          as hour_of_day,
        temperature_c::float    as temperature_c,
        precipitation_mm::float as precipitation_mm,
        windspeed_kmh::float    as windspeed_kmh,
        ressenti::varchar       as feels_like

    from source
    where temperature_c is not null
      and precipitation_mm is not null
      and windspeed_kmh is not null
)

select * from cleaned