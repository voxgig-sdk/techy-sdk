<?php
declare(strict_types=1);

// Techy SDK utility: result_body

class TechyResultBody
{
    public static function call(TechyContext $ctx): ?TechyResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
