package voxgigtechysdk

import (
	"github.com/voxgig-sdk/techy-sdk/go/core"
	"github.com/voxgig-sdk/techy-sdk/go/entity"
	"github.com/voxgig-sdk/techy-sdk/go/feature"
	_ "github.com/voxgig-sdk/techy-sdk/go/utility"
)

// Type aliases preserve external API.
type TechySDK = core.TechySDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type TechyEntity = core.TechyEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type TechyError = core.TechyError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewPhraseEntityFunc = func(client *core.TechySDK, entopts map[string]any) core.TechyEntity {
		return entity.NewPhraseEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewTechySDK = core.NewTechySDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewTechySDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *TechySDK  { return NewTechySDK(nil) }
func Test() *TechySDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
