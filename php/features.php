<?php
declare(strict_types=1);

// Techy SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class TechyFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new TechyBaseFeature();
            case "test":
                return new TechyTestFeature();
            default:
                return new TechyBaseFeature();
        }
    }
}
