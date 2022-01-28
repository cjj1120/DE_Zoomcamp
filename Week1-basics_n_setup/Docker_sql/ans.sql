-- Q3
SELECT
	CAST(tpep_pickup_datetime AS DATE) AS drop_off_date,
	COUNT(1) AS dropoff_count
FROM 
	yellow_taxi_trips
WHERE 
	CAST(tpep_pickup_datetime AS DATE) = '2021-01-15'
GROUP BY 
	CAST(tpep_pickup_datetime AS DATE) 	

-- Q4
SELECT
	CAST(tpep_pickup_datetime AS DATE) as "Day",
	MAX(tip_amount) as Tips
FROM 
	yellow_taxi_trips
WHERE 
	EXTRACT(MONTH FROM (CAST(tpep_pickup_datetime AS DATE))) = 1
GROUP BY 
	CAST(tpep_pickup_datetime AS DATE)
ORDER BY 
	Tips DESC 

--Q5
SELECT 
	z.service_zone,
	COUNT(1)
FROM yellow_taxi_trips y
	LEFT JOIN zones z
	ON y."PULocationID" = z."LocationID"
WHERE
	CAST(tpep_pickup_datetime AS DATE) = '2021-01-14' AND
	z."Zone" = 'Central Park'
GROUP BY 
	z.service_zone
 

-- Q6
SELECT 
	CONCAT(zpu."Zone", ' / ', zdo."Zone") AS "PU_DO_loc",
	AVG(total_amount)
FROM yellow_taxi_trips y
	LEFT JOIN zones zpu
	ON y."PULocationID" = zpu."LocationID"
	LEFT JOIN zones zdo
	ON y."DOLocationID" = zdo."LocationID"
GROUP BY 
	CONCAT(zpu."Zone", ' / ', zdo."Zone")
ORDER BY 
	AVG(total_amount) DESC
