% GRAPH SCHEMA

CALL apoc.meta.schema()

% APOC BATCH-DIVIDED IMPORT

CALL apoc.periodic.iterate(
  "
  LOAD CSV WITH HEADERS FROM 'file:///runs-data-dropped.csv' AS row
  RETURN row
  ",
  "
  MERGE (r:RunTest {id: row.runId})
  SET
    r.primaryTime = toInteger(row.primaryTime),
    r.date = date(row.date),
    r.status = row.status
  ",
  {
    batchSize: 1000,
    parallel: false
  }
);

% SIMPLYFYING QUERIES WITH USE OF apoc.coll.frequencies()

% Without:

MATCH (p:Player)-[:ACHIEVED]->(r:Run)-[:ON_PLATFORM]->(pl:Platform)
WITH p, pl.name AS platform
WITH p, platform, count(*) AS cnt
WITH p, collect({platform: platform, count: cnt}) AS platformUsage
RETURN p.username, platformUsage
LIMIT 5;

% With:

MATCH (p:Player)-[:ACHIEVED]->(r:Run)-[:ON_PLATFORM]->(pl:Platform)
WITH p, collect(pl.name) AS platforms
RETURN p.username, apoc.coll.frequencies(platforms) AS platformUsage
LIMIT 5;