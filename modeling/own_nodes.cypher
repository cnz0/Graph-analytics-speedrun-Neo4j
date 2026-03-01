Free-to-play:

MATCH (s:SteamGame)
WHERE s.price = 0
MERGE (m:MarketSegment {name: "FreeToPlay"})
MERGE (s)-[:IN_SEGMENT]->(m);

Indie:

MATCH (s:SteamGame)
WHERE s.price > 0 AND s.price <= 15
MERGE (m:MarketSegment {name: "Indie"})
MERGE (s)-[:IN_SEGMENT]->(m);

AAA:

MATCH (s:SteamGame)
WHERE s.price >= 40 OR s.peakCCU > 50000
MERGE (m:MarketSegment {name: "AAA"})
MERGE (s)-[:IN_SEGMENT]->(m);

Early-Access:

MATCH (s:SteamGame)
WHERE s.positiveReviews + s.negativeReviews < 100
MERGE (m:MarketSegment {name: "EarlyAccess"})
MERGE (s)-[:IN_SEGMENT]->(m);

MATCH (g:Game)-[:HAS_STEAM_DATA]->(s:SteamGame)-[:IN_SEGMENT]->(m:MarketSegment)
MERGE (g)-[:TARGETS_SEGMENT]->(m);