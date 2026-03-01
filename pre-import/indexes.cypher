CREATE INDEX player_id IF NOT EXISTS
FOR (p:Player) ON (p.id);

CREATE INDEX game_id IF NOT EXISTS
FOR (g:Game) ON (g.id);

CREATE INDEX category_id IF NOT EXISTS
FOR (c:Category) ON (c.id);

CREATE INDEX run_id IF NOT EXISTS
FOR (r:Run) ON (r.id);

CREATE INDEX platform_id IF NOT EXISTS
FOR (p:Platform) ON (p.id);

CREATE INDEX steam_app_id IF NOT EXISTS
FOR (s:SteamGame)
ON (s.appId);

CREATE INDEX game_name_idx IF NOT EXISTS
FOR (g:Game)
ON (g.name);