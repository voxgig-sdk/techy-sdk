<?php
declare(strict_types=1);

// Techy SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

TechyUtility::setRegistrar(function (TechyUtility $u): void {
    $u->clean = [TechyClean::class, 'call'];
    $u->done = [TechyDone::class, 'call'];
    $u->make_error = [TechyMakeError::class, 'call'];
    $u->feature_add = [TechyFeatureAdd::class, 'call'];
    $u->feature_hook = [TechyFeatureHook::class, 'call'];
    $u->feature_init = [TechyFeatureInit::class, 'call'];
    $u->fetcher = [TechyFetcher::class, 'call'];
    $u->make_fetch_def = [TechyMakeFetchDef::class, 'call'];
    $u->make_context = [TechyMakeContext::class, 'call'];
    $u->make_options = [TechyMakeOptions::class, 'call'];
    $u->make_request = [TechyMakeRequest::class, 'call'];
    $u->make_response = [TechyMakeResponse::class, 'call'];
    $u->make_result = [TechyMakeResult::class, 'call'];
    $u->make_point = [TechyMakePoint::class, 'call'];
    $u->make_spec = [TechyMakeSpec::class, 'call'];
    $u->make_url = [TechyMakeUrl::class, 'call'];
    $u->param = [TechyParam::class, 'call'];
    $u->prepare_auth = [TechyPrepareAuth::class, 'call'];
    $u->prepare_body = [TechyPrepareBody::class, 'call'];
    $u->prepare_headers = [TechyPrepareHeaders::class, 'call'];
    $u->prepare_method = [TechyPrepareMethod::class, 'call'];
    $u->prepare_params = [TechyPrepareParams::class, 'call'];
    $u->prepare_path = [TechyPreparePath::class, 'call'];
    $u->prepare_query = [TechyPrepareQuery::class, 'call'];
    $u->result_basic = [TechyResultBasic::class, 'call'];
    $u->result_body = [TechyResultBody::class, 'call'];
    $u->result_headers = [TechyResultHeaders::class, 'call'];
    $u->transform_request = [TechyTransformRequest::class, 'call'];
    $u->transform_response = [TechyTransformResponse::class, 'call'];
});
