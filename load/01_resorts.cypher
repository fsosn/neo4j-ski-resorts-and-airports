CREATE CONSTRAINT FOR (c:Country) REQUIRE c.name IS UNIQUE;
CREATE CONSTRAINT FOR (con:Continent) REQUIRE con.name IS UNIQUE;
CREATE CONSTRAINT FOR (r:Resort) REQUIRE r.name IS UNIQUE;
CREATE CONSTRAINT FOR (inf:Infrastructure) REQUIRE inf.name IS UNIQUE;
CREATE CONSTRAINT FOR (lt:LiftType) REQUIRE lt.name IS UNIQUE;
CREATE CONSTRAINT FOR (fe:Feature) REQUIRE fe.type IS UNIQUE;
CREATE CONSTRAINT FOR (m:Month) REQUIRE m.name IS UNIQUE;

LOAD CSV WITH HEADERS FROM "file:///resorts.csv" AS row
WITH row

MERGE (con:Continent {name: row.Continent})

MERGE (cou:Country {name: row.Country})

MERGE (cou)-[:PART_OF]->(con)

MERGE (r:Resort {name: row.Resort})
ON CREATE SET 
    r.location = point({latitude: toFloat(row.Latitude), longitude: toFloat(row.Longitude)}),
    r.skipass_price = toInteger(row.Price),
    r.highest_point = toInteger(row.`Highest point`),
    r.lowest_point = toInteger(row.`Lowest point`),
    r.beginner_slopes = toInteger(row.`Beginner slopes`),
    r.intermediate_slopes = toInteger(row.`Intermediate slopes`),
    r.difficult_slopes = toInteger(row.`Difficult slopes`),
    r.total_slopes = toInteger(row.`Total slopes`),
    r.longest_run = toInteger(row.`Longest run`),
    r.lift_capacity = toInteger(row.`Lift capacity`)

CREATE (r)-[:LOCATED_IN]->(cou)

FOREACH (count IN [c IN [toInteger(row.`Snow cannons`)] WHERE c > 0] |
    MERGE (inf:Infrastructure {name: 'Snow Cannons'})
    MERGE (r)-[h:HAS_INFRASTRUCTURE]->(inf)
    SET h.count = count
)

FOREACH (l IN [x IN [
    {n:'Surface Lift', c:toInteger(row.`Surface lifts`)},
    {n:'Chair Lift',   c:toInteger(row.`Chair lifts`)},
    {n:'Gondola Lift', c:toInteger(row.`Gondola lifts`)}
] WHERE x.c > 0] |
    MERGE (lt:LiftType {name: l.n})
    MERGE (r)-[h:HAS_LIFT]->(lt) SET h.count = l.c
)

FOREACH (f IN [x IN [
    {t:'Child Friendly', v:row.`Child friendly`},
    {t:'Snowpark',       v:row.Snowparks},
    {t:'Nightskiing',    v:row.Nightskiing},
    {t:'Summer Skiing',  v:row.`Summer skiing`}
] WHERE x.v = 'Yes'] |
    MERGE (fe:Feature {type: f.t})
    MERGE (r)-[:OFFERS_FEATURE]->(fe)
)

WITH r, row, ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] AS mList

UNWIND split(row.Season, ",") AS block
WITH r, mList, split(trim(block), "-") AS range
WHERE size(range) = 2

WITH r, mList, trim(range[0]) AS sName, trim(range[1]) AS eName

WITH r, mList,
     [i IN range(0, 11) WHERE mList[i] = sName | i][0] AS sIdx,
     [i IN range(0, 11) WHERE mList[i] = eName | i][0] AS eIdx

WHERE sIdx IS NOT NULL AND eIdx IS NOT NULL

UNWIND (CASE 
    WHEN sIdx <= eIdx THEN mList[sIdx..eIdx+1]
    ELSE mList[sIdx..12] + mList[0..eIdx+1] 
END) AS mName

MERGE (m:Month {name: mName})
MERGE (r)-[:OPEN_IN]->(m);