### Graph Analytics & Data Integration – Neo4j ###
- This project presents a large-scale graph modeling and analytical workflow implemented in Neo4j.

### The graph integrates two datasets: ###
- Speedrun.com dataset (games, runs, players, categories, platforms)
- Steam metadata dataset (price, engagement, review statistics)

The objective was to design a scalable graph schema, optimize bulk ingestion, enrich the graph with external metadata, and execute multi-hop analytical queries efficiently.

### Scope ###
- Bulk CSV ingestion using LOAD CSV
- Index-aware MERGE strategy
- Batched imports (CALL { ... } IN TRANSACTIONS)
- Cross-dataset enrichment (Speedrun + Steam)
- Rule-based market segmentation
- Graph denormalization for traversal optimization
- Spatial modeling using point()
- APOC-based structural inspection
- ETL preprocessing in Python

### Graph Model ###
Core nodes:
- Game
- Run
- Player
- Category
- Platform
- SteamGame
- MarketSegment
- Country
Core relationships:
- (Player)-[:ACHIEVED]->(:Run)
- (:Run)-[:OF_GAME]->(:Game)
- (:Run)-[:IN_CATEGORY]->(:Category)
- (:Run)-[:ON_PLATFORM]->(:Platform)
- (:Game)-[:HAS_STEAM_DATA]->(:SteamGame)
- (:SteamGame)-[:IN_SEGMENT]->(:MarketSegment)
- (:Game)-[:TARGETS_SEGMENT]->(:MarketSegment)
- (:Player)-[:FROM]->(:Country)

Graph size (approximate, via APOC meta-schema):
- ~4.6M Run nodes
- ~459k Player nodes
- ~43k Game nodes
- ~4.4M ACHIEVED relationships

(See apoc/apoc-meta-schema.cypher)

### Import Strategy & Performance ###
Indexes are created before data ingestion
```
CREATE INDEX game_id IF NOT EXISTS FOR (g:Game) ON (g.id);
CREATE INDEX run_id IF NOT EXISTS FOR (r:Run) ON (r.id);
CREATE INDEX player_id IF NOT EXISTS FOR (p:Player) ON (p.id);
```

This ensures MERGE operations use NodeIndexSeek instead of NodeByLabelScan.\br
Large CSV files are processed using batched transactions:
```
:auto
LOAD CSV WITH HEADERS ...
CALL {
  WITH row
  MERGE (...)
} IN TRANSACTIONS OF 1000 ROWS;
```
This approach prevents memory pressure and enables scalable ingestion of multi-million-row datasets.\br
(See pre-import/indexes.cypher and import/imports.cypher)

### Cross-Dataset Enrichment ###
Steam metadata is imported and linked to existing Game nodes via HAS_STEAM_DATA.\br
Market segments are assigned using rule-based classification over Steam properties:
- FreeToPlay
- Indie
- AAA
- EarlyAccess

Games inherit segment relationships (TARGETS_SEGMENT) for faster analytical traversal.\br
(See modeling/own_nodes.cypher)

### Analytical Queries ###
The project includes multi-hop analytical queries such as:
- Most popular games by run count
- Platform-based performance aggregation
- Steam vs non-Steam game comparison
- Player activity ranking
- Market segmentation per game
All analytical entry points rely on indexed properties.\br
(See queries/queries.cypher)

### Modeling Decisions ###
- Index-First Import Strategy
- Indexes were created before ingestion to optimize MERGE performance.
- Controlled Denormalization
- Additional relationships (e.g., Game -> MarketSegment) were introduced to reduce traversal depth in frequently executed queries.
- Materialized Metrics
- Certain aggregations were stored as node properties to avoid repeated computation.

### Spatial Modeling ###
Countries are modeled as spatial nodes using Neo4j point():
```
SET c.location = point({latitude: ..., longitude: ...});
```
This enables geographic extensions and potential distance-based queries.\br
(See spatial/geographical-data.cypher)

### ETL Preprocessing (Python) ###
- Raw CSV files required preprocessing before import:
- Column removal using pandas
- Custom cleaning for Steam metadata
- Type normalization
(See etl/col-remover.py and etl/col-remover-v2.py)

### APOC Usage ###
APOC procedures were used for:
- Schema inspection (apoc.meta.schema)
- Batch processing (apoc.periodic.iterate)
- Collection frequency analysis
(See apoc/apoc-calls.cypher)

### Project Structure ###
neo4j/\br
|\br
|-- apoc/\br
|-- etl/\br
|-- import/\br
|-- modeling/\br
|-- pre-import/\br
|-- queries/\br
|-- spatial/\br
|-- README.md\br

### Key Takeaways ###
- Designing graph schemas aligned with traversal patterns
- Using indexes to optimize large-scale MERGE ingestion
- Scaling CSV import via batched transactions
- Integrating heterogeneous datasets in a unified graph
- Applying segmentation and structural analytics
- Combining ETL preprocessing with graph modeling
