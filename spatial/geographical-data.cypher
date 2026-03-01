MERGE (c:Country {code: "us"})
SET c.name = "United States",
    c.location = point({latitude: 38.9072, longitude: -77.0369});

MERGE (c:Country {code: "de"})
SET c.name = "Germany",
    c.location = point({latitude: 52.5200, longitude: 13.4050});

MERGE (c:Country {code: "hu"})
SET c.name = "Hungary",
    c.location = point({latitude: 47.1625, longitude: 19.5033});

MERGE (c:Country {code: "hr"})
SET c.name = "Croatia",
    c.location = point({latitude: 45.1000, longitude: 15.2000});

MERGE (c:Country {code: "in"})
SET c.name = "India",
    c.location = point({latitude: 20.5937, longitude: 78.9629});

MERGE (c:Country {code: "ru"})
SET c.name = "Russia",
    c.location = point({latitude: 61.5240, longitude: 105.3188});

MERGE (c:Country {code: "gb/eng"})
SET c.name = "Great Britain: England",
    c.location = point({latitude: 52.3555, longitude: -1.1743});

MERGE (c:Country {code: "pl"})
SET c.name = "Poland",
    c.location = point({latitude: 52.2297, longitude: 21.0122});

MERGE (c:Country {code: "br"})
SET c.name = "Brazil",
    c.location = point({latitude: -14.2350, longitude: -51.9253});

MERGE (c:Country {code: "ca"})
SET c.name = "Canada",
    c.location = point({latitude: 56.1304, longitude: -106.3468});

MERGE (c:Country {code: "nl"})
SET c.name = "Netherlands",
    c.location = point({latitude: 52.1326, longitude: 5.2913});

MERGE (c:Country {code: "cz"})
SET c.name = "Czech Republic",
    c.location = point({latitude: 49.8175, longitude: 15.4730});

MERGE (c:Country {code: "ua"})
SET c.name = "Ukraine",
    c.location = point({latitude: 48.3794, longitude: 31.1656});

MERGE (c:Country {code: "hk"})
SET c.name = "Hong Kong",
    c.location = point({latitude: 22.3193, longitude: 114.1694});