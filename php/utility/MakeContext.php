<?php
declare(strict_types=1);

// Techy SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class TechyMakeContext
{
    public static function call(array $ctxmap, ?TechyContext $basectx): TechyContext
    {
        return new TechyContext($ctxmap, $basectx);
    }
}
