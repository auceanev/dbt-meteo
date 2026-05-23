# dbt Météo

Modélisation de données météo Paris avec dbt et DuckDB.
Transforme les données brutes du pipeline ETL en modèles analytiques documentés et testés.

## Architecture
```
meteo_source (SQLite) → stg_meteo_paris (staging) → mart_meteo_daily (marts)
```
## Stack

- dbt 1.11 · DuckDB · Python

## Installation

```bash
python3 -m venv venv
source venv/bin/activate
pip install dbt-duckdb numpy pandas
```

Configurer `~/.dbt/profiles.yml` puis :

```bash
cd dbt_meteo
dbt run
dbt test
dbt docs generate && dbt docs serve --port 8081
```

## Modèles

| Modèle | Couche | Description |
|---|---|---|
| `stg_meteo_paris` | staging | Nettoyage et typage de la donnée brute |
| `mart_meteo_daily` | marts | Agrégats journaliers — temp min/max/moy, vent, pluie |

## Tests

7 tests dbt sur les colonnes clés — `not_null` et `unique`.



### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
