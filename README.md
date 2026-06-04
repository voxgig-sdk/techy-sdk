# Techy SDK

Generate tech-savvy phrases on demand for placeholder copy, demos, or fun

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Techy

Techy is a tiny public API that returns randomly generated tech-savvy sounding phrases. It is hosted on Vercel at [techy-api.vercel.app](https://techy-api.vercel.app) and catalogued on [Free Public APIs](https://freepublicapis.com/techy).

What you get from the API:

- A single endpoint that returns one tech phrase per call, suitable for placeholder text, demos, jokes, or filler copy in UI mockups.

Operational notes: the API requires no authentication. Community monitoring on Free Public APIs has flagged reliability concerns and reports that CORS is not enabled, so calls from browsers may need to be proxied through a server.

## Try it

**TypeScript**
```bash
npm install techy
```

**Python**
```bash
pip install techy-sdk
```

**PHP**
```bash
composer require voxgig/techy-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/techy-sdk/go
```

**Ruby**
```bash
gem install techy-sdk
```

**Lua**
```bash
luarocks install techy-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { TechySDK } from 'techy'

const client = new TechySDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o techy-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "techy": {
      "command": "/abs/path/to/techy-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Phrase** | A randomly generated tech-savvy sounding phrase, retrieved via `GET /api/json`. | `/api/json` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from techy_sdk import TechySDK

client = TechySDK({})


# Load a specific phrase
phrase, err = client.Phrase(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'techy_sdk.php';

$client = new TechySDK([]);


// Load a specific phrase
[$phrase, $err] = $client->Phrase(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/techy-sdk/go"

client := sdk.NewTechySDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Techy_sdk"

client = TechySDK.new({})


# Load a specific phrase
phrase, err = client.Phrase(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("techy_sdk")

local client = sdk.new({})


-- Load a specific phrase
local phrase, err = client:Phrase(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = TechySDK.test()
const result = await client.Phrase().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = TechySDK.test(None, None)
result, err = client.Phrase(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = TechySDK::test(null, null);
[$result, $err] = $client->Phrase(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Phrase(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = TechySDK.test(nil, nil)
result, err = client.Phrase(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Phrase(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Techy

- Upstream: [https://techy-api.vercel.app](https://techy-api.vercel.app)

---

Generated from the Techy OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
