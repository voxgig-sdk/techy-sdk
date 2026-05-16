<?php
declare(strict_types=1);

// Techy SDK utility: result_headers

class TechyResultHeaders
{
    public static function call(TechyContext $ctx): ?TechyResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
