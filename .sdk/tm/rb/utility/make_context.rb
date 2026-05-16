# Techy SDK utility: make_context
require_relative '../core/context'
module TechyUtilities
  MakeContext = ->(ctxmap, basectx) {
    TechyContext.new(ctxmap, basectx)
  }
end
