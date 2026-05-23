-- Agrégats journaliers pour analyse

with staging as (
    select * from {{ ref('stg_meteo_paris') }}
),

daily as (
    select
        measured_date,
        round(avg(temperature_c), 2)    as temp_moyenne_c,
        round(min(temperature_c), 2)    as temp_min_c,
        round(max(temperature_c), 2)    as temp_max_c,
        round(sum(precipitation_mm), 2) as precipitation_totale_mm,
        round(avg(windspeed_kmh), 2)    as vent_moyen_kmh,
        count(*)                         as nb_mesures

    from staging
    group by measured_date
    order by measured_date
)

select * from daily