WITH point({latitude: 49.1164, longitude: 20.2833}) AS center, 100000 AS radius
MATCH (r:Resort)
WHERE point.distance(r.location, center) <= radius AND r.skipass_price > 0
RETURN 
    count(r) AS NumberOfResorts,
    round(avg(r.skipass_price), 2) AS AveragePrice,
    min(r.skipass_price) AS CheapestPrice,
    max(r.skipass_price) AS MostExpensivePrice;