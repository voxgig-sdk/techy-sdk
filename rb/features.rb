# Techy SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module TechyFeatures
  def self.make_feature(name)
    case name
    when "base"
      TechyBaseFeature.new
    when "test"
      TechyTestFeature.new
    else
      TechyBaseFeature.new
    end
  end
end
