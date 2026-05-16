# ProjectName SDK exists test

import pytest
from techy_sdk import TechySDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = TechySDK.test(None, None)
        assert testsdk is not None
