<?php
declare(strict_types=1);

// Techy SDK utility: feature_add

class TechyFeatureAdd
{
    public static function call(TechyContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
