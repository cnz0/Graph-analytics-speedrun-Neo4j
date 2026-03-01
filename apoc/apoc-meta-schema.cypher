{
  "de": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "OF_GAME": {
    "count": 4567080,
    "type": "relationship",
    "properties": {

    }
  },
  "Category": {
    "count": 170242,
    "relationships": {
      "OF_GAME": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Game"
        ]
      },
      "IN_CATEGORY": {
        "count": 1025,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Run"
        ]
      }
    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "id": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      },
      "numPlayers": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "ru": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "ACHIEVED": {
    "count": 4435965,
    "type": "relationship",
    "properties": {

    }
  },
  "Platform": {
    "count": 213,
    "relationships": {
      "AVAILABLE_ON": {
        "count": 461,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Game"
        ]
      },
      "ON_PLATFORM": {
        "count": 1025,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Run"
        ]
      }
    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "id": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      }
    },
    "labels": []
  },
  "IN_MARKET_SEGMENT": {
    "count": 9100,
    "type": "relationship",
    "properties": {

    }
  },
  "hr": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "FROM": {
    "count": 238084,
    "type": "relationship",
    "properties": {

    }
  },
  "hu": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "TARGETS_SEGMENT": {
    "count": 9805,
    "type": "relationship",
    "properties": {

    }
  },
  "MarketSegment": {
    "count": 9,
    "relationships": {
      "IN_SEGMENT": {
        "count": 1127,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "SteamGame"
        ]
      },
      "IN_MARKET_SEGMENT": {
        "count": 187,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Game"
        ]
      },
      "TARGETS_SEGMENT": {
        "count": 189,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Game"
        ]
      }
    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "us": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "Player": {
    "count": 459769,
    "relationships": {
      "FROM": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Country"
        ]
      },
      "ACHIEVED": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Run"
        ]
      }
    },
    "type": "node",
    "properties": {
      "location": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "id": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      },
      "username": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "AVAILABLE_ON": {
    "count": 20963,
    "type": "relationship",
    "properties": {

    }
  },
  "in": {
    "count": 1,
    "relationships": {

    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "Run": {
    "count": 4626227,
    "relationships": {
      "OF_GAME": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Game"
        ]
      },
      "ACHIEVED": {
        "count": 10611,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Player"
        ]
      },
      "IN_CATEGORY": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Category"
        ]
      },
      "ON_PLATFORM": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Platform"
        ]
      }
    },
    "type": "node",
    "properties": {
      "date": {
        "existence": false,
        "type": "DATE",
        "indexed": false,
        "unique": false
      },
      "id": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      },
      "primaryTime": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      },
      "status": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "ON_PLATFORM": {
    "count": 4396840,
    "type": "relationship",
    "properties": {

    }
  },
  "Game": {
    "count": 43663,
    "relationships": {
      "HAS_STEAM_DATA": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "SteamGame"
        ]
      },
      "OF_GAME": {
        "count": 961,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Category",
          "Run"
        ]
      },
      "AVAILABLE_ON": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "Platform"
        ]
      },
      "IN_MARKET_SEGMENT": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "MarketSegment"
        ]
      },
      "TARGETS_SEGMENT": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "MarketSegment"
        ]
      }
    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      },
      "createdAtSpeedrun": {
        "existence": false,
        "type": "DATE_TIME",
        "indexed": false,
        "unique": false
      },
      "id": {
        "existence": false,
        "type": "STRING",
        "indexed": true,
        "unique": false
      },
      "releaseDate": {
        "existence": false,
        "type": "DATE",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "IN_SEGMENT": {
    "count": 136163,
    "type": "relationship",
    "properties": {

    }
  },
  "SteamGame": {
    "count": 122658,
    "relationships": {
      "HAS_STEAM_DATA": {
        "count": 189,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Game"
        ]
      },
      "IN_SEGMENT": {
        "count": 0,
        "properties": {

        },
        "direction": "out",
        "labels": [
          "MarketSegment"
        ]
      }
    },
    "type": "node",
    "properties": {
      "requiredAge": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      },
      "estimatedOwners": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "price": {
        "existence": false,
        "type": "FLOAT",
        "indexed": false,
        "unique": false
      },
      "appId": {
        "existence": false,
        "type": "INTEGER",
        "indexed": true,
        "unique": false
      },
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "userScore": {
        "existence": false,
        "type": "FLOAT",
        "indexed": false,
        "unique": false
      },
      "negativeReviews": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      },
      "peakCCU": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      },
      "positiveReviews": {
        "existence": false,
        "type": "INTEGER",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "HAS_STEAM_DATA": {
    "count": 9253,
    "type": "relationship",
    "properties": {

    }
  },
  "Country": {
    "count": 14,
    "relationships": {
      "FROM": {
        "count": 551,
        "properties": {

        },
        "direction": "in",
        "labels": [
          "Player"
        ]
      }
    },
    "type": "node",
    "properties": {
      "name": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      },
      "location": {
        "existence": false,
        "type": "POINT",
        "indexed": false,
        "unique": false
      },
      "code": {
        "existence": false,
        "type": "STRING",
        "indexed": false,
        "unique": false
      }
    },
    "labels": []
  },
  "IN_CATEGORY": {
    "count": 4396838,
    "type": "relationship",
    "properties": {

    }
  }
}