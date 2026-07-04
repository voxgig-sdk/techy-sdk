# frozen_string_literal: true

# Typed models for the Techy SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Phrase entity data model.
#
# @!attribute [rw] message
#   @return [String]
Phrase = Struct.new(
  :message,
  keyword_init: true
)

# Match filter for Phrase#load (any subset of Phrase fields).
#
# @!attribute [rw] message
#   @return [String, nil]
PhraseLoadMatch = Struct.new(
  :message,
  keyword_init: true
)

