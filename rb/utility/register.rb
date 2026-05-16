# Techy SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

TechyUtility.registrar = ->(u) {
  u.clean = TechyUtilities::Clean
  u.done = TechyUtilities::Done
  u.make_error = TechyUtilities::MakeError
  u.feature_add = TechyUtilities::FeatureAdd
  u.feature_hook = TechyUtilities::FeatureHook
  u.feature_init = TechyUtilities::FeatureInit
  u.fetcher = TechyUtilities::Fetcher
  u.make_fetch_def = TechyUtilities::MakeFetchDef
  u.make_context = TechyUtilities::MakeContext
  u.make_options = TechyUtilities::MakeOptions
  u.make_request = TechyUtilities::MakeRequest
  u.make_response = TechyUtilities::MakeResponse
  u.make_result = TechyUtilities::MakeResult
  u.make_point = TechyUtilities::MakePoint
  u.make_spec = TechyUtilities::MakeSpec
  u.make_url = TechyUtilities::MakeUrl
  u.param = TechyUtilities::Param
  u.prepare_auth = TechyUtilities::PrepareAuth
  u.prepare_body = TechyUtilities::PrepareBody
  u.prepare_headers = TechyUtilities::PrepareHeaders
  u.prepare_method = TechyUtilities::PrepareMethod
  u.prepare_params = TechyUtilities::PrepareParams
  u.prepare_path = TechyUtilities::PreparePath
  u.prepare_query = TechyUtilities::PrepareQuery
  u.result_basic = TechyUtilities::ResultBasic
  u.result_body = TechyUtilities::ResultBody
  u.result_headers = TechyUtilities::ResultHeaders
  u.transform_request = TechyUtilities::TransformRequest
  u.transform_response = TechyUtilities::TransformResponse
}
