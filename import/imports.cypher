LOAD CSV WITH HEADERS FROM 'file:///platforms-data.csv' AS row
MERGE (p:Platform {id: row.platformId})
ON CREATE SET
  p.name = row.name;

LOAD CSV WITH HEADERS FROM 'file:///games-data.csv' AS row
MERGE (g:Game {id: row.gameId})
ON CREATE SET
  g.name = row.gameName,
  g.releaseDate = date(row.releaseDate),
  g.createdAtSpeedrun = datetime(row.createdDate);

LOAD CSV WITH HEADERS FROM 'file:///categories-data-dropped.csv' AS row
MERGE (c:Category {id: row.categoryId})
ON CREATE SET
  c.name = row.categoryName,
  c.numPlayers = toInteger(row.numPlayers);

LOAD CSV WITH HEADERS FROM 'file:///categories-data-dropped.csv' AS row
MATCH (c:Category {id: row.categoryId})
MATCH (g:Game {id: row.parentGameId})
MERGE (c)-[:OF_GAME]->(g);

LOAD CSV WITH HEADERS FROM 'file:///users-data.csv' AS row
MERGE (p:Player {id: row.userId})
ON CREATE SET
  p.username = row.username,
  p.location = row.location;


:auto
LOAD CSV WITH HEADERS FROM 'file:///runs-data-dropped.csv' AS row
CALL {
  WITH row
  MERGE (r:Run {id: row.runId})
  ON CREATE SET
    r.primaryTime = toInteger(row.primaryTime),
    r.date = date(row.date),
    r.status = row.status
} IN TRANSACTIONS OF 1000 ROWS;

:auto
LOAD CSV WITH HEADERS FROM 'file:///games-data.csv' AS row
CALL {
  WITH row
  MATCH (g:Game {id: row.gameId})
  MATCH (p:Platform {id: row.platforms})
  MERGE (g)-[:AVAILABLE_ON]->(p)
} IN TRANSACTIONS OF 1000 ROWS;

:auto
LOAD CSV WITH HEADERS FROM 'file:///runs-data-dropped.csv' AS row
CALL {
  WITH row
  MATCH (r:Run {id: row.runId})
  MATCH (g:Game {id: row.gameId})
  MATCH (c:Category {id: row.categoryId})
  MATCH (p:Platform {id: row.platform})
  MERGE (r)-[:OF_GAME]->(g)
  MERGE (r)-[:IN_CATEGORY]->(c)
  MERGE (r)-[:ON_PLATFORM]->(p)
} IN TRANSACTIONS OF 1000 ROWS;

:auto
LOAD CSV WITH HEADERS FROM 'file:///runs-data-dropped.csv' AS row
CALL {
  WITH row
  MATCH (r:Run {id: row.runId})
  MATCH (p:Player {id: row.players})
  MERGE (p)-[:ACHIEVED]->(r)
} IN TRANSACTIONS OF 1000 ROWS;

:auto
LOAD CSV WITH HEADERS FROM 'file:///steam-games-clean.csv' AS row
WITH
  row,
  toInteger(row.AppID) AS appId
WHERE appId IS NOT NULL
CALL {
  WITH row, appId
  MERGE (s:SteamGame {appId: appId})
  ON CREATE SET
    s.name = row.Name,
    s.estimatedOwners = row.`Estimated owners`,
    s.peakCCU = toInteger(row.`Peak CCU`),
    s.requiredAge = toInteger(row.`Required age`),
    s.price = toFloat(row.Price),
    s.metacriticScore =
      CASE
        WHEN row.`Metacritic score` IN ['True','False']
        THEN NULL
        ELSE toInteger(row.`Metacritic score`)
      END,
    s.userScore = toFloat(row.`User score`),
    s.positiveReviews = toInteger(row.Positive),
    s.negativeReviews = toInteger(row.Negative)
} IN TRANSACTIONS OF 1000 ROWS;

:auto
LOAD CSV WITH HEADERS FROM 'file:///steam-games-clean.csv' AS row
WITH
  row,
  toInteger(row.AppID) AS appId
WHERE appId IS NOT NULL
CALL {
  WITH row, appId
  MATCH (g:Game {name: row.Name})
  MATCH (s:SteamGame {appId: appId})
  MERGE (g)-[:HAS_STEAM_DATA]->(s)
} IN TRANSACTIONS OF 1000 ROWS;


