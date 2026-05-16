-- Techy SDK error

local TechyError = {}
TechyError.__index = TechyError


function TechyError.new(code, msg, ctx)
  local self = setmetatable({}, TechyError)
  self.is_sdk_error = true
  self.sdk = "Techy"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function TechyError:error()
  return self.msg
end


function TechyError:__tostring()
  return self.msg
end


return TechyError
