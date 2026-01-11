CREATE POINT INDEX resort_location_idx FOR (r:Resort) ON (r.location);
CREATE POINT INDEX airport_location_idx FOR (a:Airport) ON (a.location);
CREATE INDEX resort_price_idx FOR (r:Resort) ON (r.skipass_price);
CREATE TEXT INDEX resort_name_idx FOR (r:Resort) on (r.name);
CREATE TEXT INDEX airport_name_idx FOR (a:Airport) ON (a.name);