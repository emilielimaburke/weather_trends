SELECT year
	,city as location
    ,avg_temp
	,(AVG(avg_temp) OVER(ORDER BY year ROWS BETWEEN 7 PRECEDING AND CURRENT ROW))::float AS mov_avg_temp
FROM city_data
WHERE city = 'Raleigh'