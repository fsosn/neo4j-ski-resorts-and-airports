MATCH (r:Resort)
WHERE point.withinBBox(
  r.location, 
  point({latitude: 44.9011374, longitude: 5.5662216}),
  point({latitude: 50.7256448, longitude: 15.6067567})
)
RETURN 
  r.name,
  r.location.latitude AS Latitude, 
  r.location.longitude AS Longtidue