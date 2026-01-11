CALL apoc.custom.installProcedure(
  'createResortHub(hubName :: STRING, pattern :: STRING) :: (hub :: NODE, connectedResorts :: LIST OF STRING)',
  'MERGE (h:ResortHub {name: $hubName})
   WITH h
   MATCH (r:Resort)
   WHERE r.name CONTAINS $pattern
   MERGE (r)-[:PART_OF_HUB]->(h)
   RETURN h AS hub, collect(r.name) AS connectedResorts',
  'neo4j',
  'write',
  'Creates Resort Hub and connects it with resort based pattern'
);