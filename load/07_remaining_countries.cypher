MATCH (eu:Continent {name: 'Europe'})
MATCH (c:Country) 
WHERE c.name IN ['Croatia', 'Jersey', 'Guernsey', 'Kosovo']
MERGE (c)-[:PART_OF]->(eu);

MATCH (as:Continent {name: 'Asia'})
MATCH (c:Country) 
WHERE c.name IN ['Kyrgyzstan', 'Syria']
MERGE (c)-[:PART_OF]->(as);