# Techy SDK configuration


def make_config():
    return {
        "main": {
            "name": "Techy",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://techy-api.vercel.app",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "phrase": {},
            },
        },
        "entity": {
      "phrase": {
        "fields": [
          {
            "active": True,
            "name": "message",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "phrase",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/api/json",
                "parts": [
                  "api",
                  "json",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/api/text",
                "parts": [
                  "api",
                  "text",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
