# Techy SDK utility: make_context

from techy_sdk.core.context import TechyContext


def make_context_util(ctxmap, basectx):
    return TechyContext(ctxmap, basectx)
