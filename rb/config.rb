# Techy SDK configuration

module TechyConfig
  def self.make_config
    {
      "main" => {
        "name" => "Techy",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://techy-api.vercel.app",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "phrase" => {},
        },
      },
      "entity" => {
        "phrase" => {
          "fields" => [
            {
              "active" => true,
              "name" => "message",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "phrase",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/api/json",
                  "parts" => [
                    "api",
                    "json",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/api/text",
                  "parts" => [
                    "api",
                    "text",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    TechyFeatures.make_feature(name)
  end
end
