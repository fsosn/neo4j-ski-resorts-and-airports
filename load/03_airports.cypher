CREATE CONSTRAINT FOR (a:Airport) REQUIRE a.iata_code IS UNIQUE;

LOAD CSV WITH HEADERS FROM "file:///airports.csv" AS row
WITH row 
WHERE row.iata_code IS NOT NULL 
AND row.scheduled_service = 'yes'
AND row.type IN ['small_airport', 'medium_airport', 'large_airport']


MERGE (a:Airport {iata_code: row.iata_code})
ON CREATE SET 
    a.iata_code = row.iata_code,
    a.name = row.name,
    a.type = row.type,
    a.location = point({latitude: toFloat(row.latitude_deg), longitude: toFloat(row.longitude_deg)})