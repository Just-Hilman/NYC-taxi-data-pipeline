CREATE OR REPLACE TABLE `pro-tracker-386404.nyc_taxi_data_engineering.analytic_table` AS (
SELECT
ft.trip_id,
ft.VendorID,
dt.tpep_pickup_datetime,
dt.tpep_dropoff_datetime,
pc.passenger_count,
td.trip_distance,
rc.rate_code_name,
pl.pickup_latitude,
pl.pickup_longitude,
dl.dropoff_latitude,
dl.dropoff_longitude,
pt.payment_type_name,
ft.fare_amount,
ft.extra,
ft.mta_tax,
ft.tip_amount,
ft.tolls_amount,
ft.improvement_surcharge,
ft.total_amount

FROM `pro-tracker-386404.nyc_taxi_data_engineering.fact_table` ft

JOIN `pro-tracker-386404.nyc_taxi_data_engineering.datetime_dim` dt ON ft.datetime_id = dt.datetime_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.passenger_count_dim` pc ON ft.passenger_count_id = pc.passenger_count_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.trip_distance_dim` td ON ft.trip_distance_id = td.trip_distance_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.rate_code_dim` rc ON ft.rate_code_id = rc.rate_code_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.pickup_location_dim` pl ON ft.pickup_location_id = pl.pickup_location_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.dropoff_location_dim` dl ON ft.dropoff_location_id = dl.dropoff_location_id
JOIN `pro-tracker-386404.nyc_taxi_data_engineering.payment_type_dim` pt ON ft.payment_type_id = pt.payment_type_id);