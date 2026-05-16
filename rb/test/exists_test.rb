# Techy SDK exists test

require "minitest/autorun"
require_relative "../Techy_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = TechySDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
