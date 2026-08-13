# Techy SDK feature factory

from techy_sdk.feature.base_feature import TechyBaseFeature
from techy_sdk.feature.test_feature import TechyTestFeature


def _make_feature(name):
    features = {
        "base": lambda: TechyBaseFeature(),
        "test": lambda: TechyTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
