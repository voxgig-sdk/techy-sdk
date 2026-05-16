package voxgigtechysdk

import (
	"github.com/voxgig-sdk/techy-sdk/core"
	"github.com/voxgig-sdk/techy-sdk/entity"
	"github.com/voxgig-sdk/techy-sdk/feature"
	_ "github.com/voxgig-sdk/techy-sdk/utility"
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
	core.NewPhrasEntityFunc = func(client *core.TechySDK, entopts map[string]any) core.TechyEntity {
		return entity.NewPhrasEntity(client, entopts)
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
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
