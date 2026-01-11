MATCH (r:Resort)-[:NEAR_AIRPORT]->(a:Airport)
WITH a, count(r) AS Num_of_resorts
RETURN
    a.name AS Airport,
    a.iata_code AS IATA,
    Num_of_resorts
ORDER BY Num_of_resorts DESC
LIMIT 3