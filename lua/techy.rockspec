package = "voxgig-sdk-techy"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/techy-sdk.git"
}
description = {
  summary = "Techy SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["techy_sdk"] = "techy_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
