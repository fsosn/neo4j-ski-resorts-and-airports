LOAD CSV WITH HEADERS FROM 'file:///countries.csv' AS row
MERGE (c:Country {name: row.name})
ON MATCH SET c.code = row.code
ON CREATE SET c.code = row.code;