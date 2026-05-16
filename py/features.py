# Techy SDK feature factory

from feature.base_feature import TechyBaseFeature
from feature.test_feature import TechyTestFeature


def _make_feature(name):
    features = {
        "base": lambda: TechyBaseFeature(),
        "test": lambda: TechyTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
