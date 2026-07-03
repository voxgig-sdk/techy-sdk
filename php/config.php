<?php
declare(strict_types=1);

// Techy SDK configuration

class TechyConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Techy",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://techy-api.vercel.app",
                "auth" => [
                    "prefix" => "Bearer",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "phrase" => [],
                ],
            ],
            "entity" => [
        'phrase' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'message',
              'req' => true,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
          ],
          'name' => 'phrase',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/api/json',
                  'parts' => [
                    'api',
                    'json',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/api/text',
                  'parts' => [
                    'api',
                    'text',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 1,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return TechyFeatures::make_feature($name);
    }
}
