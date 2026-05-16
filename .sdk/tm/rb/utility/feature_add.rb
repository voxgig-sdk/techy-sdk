# Techy SDK utility: feature_add
module TechyUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
