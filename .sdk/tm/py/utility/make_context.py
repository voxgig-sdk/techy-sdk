# Techy SDK utility: make_context

from core.context import TechyContext


def make_context_util(ctxmap, basectx):
    return TechyContext(ctxmap, basectx)
