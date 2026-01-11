MATCH (con:Continent {name: 'Europe'})<-[:PART_OF]-(c:Country)<-[:LOCATED_IN]-(r:Resort)
MATCH (r)-[:NEAR_AIRPORT]->(a:Airport)
WHERE r.skipass_price > 0
WITH c, avg(r.skipass_price) AS AveragePrice
RETURN 
    c.name AS Country, 
    round(AveragePrice, 2) AS Average_Skipass_Price_EUR
ORDER BY Average_Skipass_Price_EUR ASC;