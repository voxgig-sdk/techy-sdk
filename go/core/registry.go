package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewPhrasEntityFunc func(client *TechySDK, entopts map[string]any) TechyEntity

