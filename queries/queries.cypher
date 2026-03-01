1)

MATCH (r:Run)-[:OF_GAME]->(g:Game)-[:HAS_STEAM_DATA]->(s:SteamGame)
RETURN g.name, count(r) AS runs
ORDER BY runs DESC
LIMIT 10;

MATCH (g:Game)-[:HAS_STEAM_DATA]->(:SteamGame)
WITH g
MATCH (r:Run)-[:OF_GAME]->(g)
RETURN g.name, count(r) AS runs
ORDER BY runs DESC
LIMIT 10;

2)

MATCH (r:Run)-[:ON_PLATFORM]->(p:Platform)
WHERE r.primaryTime IS NOT NULL
RETURN
  p.name,
  avg(r.primaryTime) AS avgTime,
  count(r) AS runs
ORDER BY runs DESC
LIMIT 10;

3)

WITH 1 AS _
CALL {
  MATCH (g:Game)-[:HAS_STEAM_DATA]->(:SteamGame)
  RETURN g.name AS game, "Steam" AS source
  LIMIT 5
}
RETURN game, source

UNION

WITH 1 AS _
CALL {
  MATCH (g:Game)
  WHERE NOT (g)-[:HAS_STEAM_DATA]->(:SteamGame)
  RETURN g.name AS game, "Non-Steam" AS source
  LIMIT 5
}
RETURN game, source;

4)

MATCH (g:Game)-[:HAS_STEAM_DATA]->(s:SteamGame)
WITH g, s,
     CASE
       WHEN s.price = 0 THEN "Free-to-play"
       WHEN s.price < 20 THEN "Budget"
       WHEN s.price < 60 THEN "Mid-price"
       ELSE "Premium"
     END AS segmentName
MERGE (m:MarketSegment {name: segmentName})
MERGE (g)-[:IN_MARKET_SEGMENT]->(m);

5)

MATCH (p:Player)-[:ACHIEVED]->(r:Run)-[:OF_GAME]->(g:Game)-[:HAS_STEAM_DATA]->(:SteamGame)
RETURN p.username, count(r) AS runs
ORDER BY runs DESC
LIMIT 10;

