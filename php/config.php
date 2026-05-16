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
                    "phras" => [],
                ],
            ],
            "entity" => [
        'phras' => [
          'fields' => [
            [
              'name' => 'message',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
          ],
          'name' => 'phras',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/api/json',
                  'parts' => [
                    'api',
                    'json',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
                [
                  'method' => 'GET',
                  'orig' => '/api/text',
                  'parts' => [
                    'api',
                    'text',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 1,
                ],
              ],
              'input' => 'data',
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
