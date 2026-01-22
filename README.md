# Neo4j Ski Resorts & Airports

This project explores the integration of global ski resort data with airport locations using the **Neo4j** graph database. It provides a tool for analyzing resort accessibility, infrastructure and real-time conditions.

---

## 🏔️ Project Overview
The project was developed for an Advanced Databases course. It centralizes data from several sources to allow for complex spatial and relational queries.

### Data Sources
* **Ski Resorts**: A dataset of 499 resorts containing 25 attributes, including location, pass prices, and slope details.
* **Airports**: Global data from OurAirports including airport types and scheduled service status.
* **Geography**: ISO country codes used to map airports to specific nations.

---

## 🛠️ Technology Stack
* **Database**: Neo4j.
* **Query Language**: Cypher.
* **Extensions**:
    * **APOC**: Used for spatial geocoding, external API calls, and data export.
    * **Graph Data Science (GDS)**: Applied for topology and connectivity analysis.
* **Custom Logic**: Procedures written in **Java** for complex reporting.

---

## 📊 Graph Model
The database initialy comprised **562 nodes** and **7 distinct labels**, expanding as relationships were built.

### Node Labels
* `Resort`: Contains technical data like slope lengths and highest points.
* `Airport`: Nodes filtered for regular scheduled flights.
* `Country` / `Continent`: Geographic grouping nodes[cite: 69, 74, 127].
* `Infrastructure` / `LiftType`: Details regarding lift systems (Gondolas, Chair Lifts, etc.).
* `Feature`: Unique resort traits like "Snowparks" or "Child Friendly".
* `Month`: Nodes representing operational months.
* `ResortHub`: A collective node created via `MERGE` to group neighboring resorts.

### Key Relationships
* `(:Resort)-[:NEAR_AIRPORT]->(:Airport)`: Distance-based link for transfers under **120km**.
* `(:Resort)-[:NEAR_TO]->(:Resort)`: Links neighboring resorts within **30km**.
* `(:Resort)-[:LOCATED_IN]->(:Country)-[:PART_OF]->(:Continent)`: Geographic hierarchy.
* `(:Resort)-[:OPEN_IN]->(:Month)`: Connectivity based on seasonality.

---

## 🔍 Analytical Features
* **Accessibility Discovery**: Identified resorts with the closest airport access
* **Budget Planning**: Comparison of European resort pass prices with nearby airport proximity
* **Topological Analysis**: Using **GDS** to find "Bridges" and "Articulation Points" to identify critical nodes in the transport network
* **Live Weather Integration**: Real-time temperature and snowfall depth fetched from the **Open Meteo API** using APOC
* **Geocoding**: Conversion of resort coordinates into human-readable addresses via OpenStreetMap

---

## 🚀 How to Run
1. **Plugins**: Ensure **APOC** and **GDS** are installed in your Neo4j `plugins` folder.
2. **Configuration**: Set `apoc.export.file.enabled=true` and allow unrestricted access for `apoc.*` and `custom.*` in `neo4j.conf`.
3. **Import**: Execute the provided Cypher export script via the Cypher shell:
   ```bash
   cat full_export.cypher | bin/cypher-shell.bat -d <your_db> -u <user> -p <password>
