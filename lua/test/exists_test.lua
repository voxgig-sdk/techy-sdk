-- Techy SDK exists test

local sdk = require("techy_sdk")

describe("TechySDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
