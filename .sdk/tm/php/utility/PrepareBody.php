<?php
declare(strict_types=1);

// Techy SDK utility: prepare_body

class TechyPrepareBody
{
    public static function call(TechyContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
