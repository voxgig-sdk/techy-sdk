package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewPhraseEntityFunc func(client *TechySDK, entopts map[string]any) TechyEntity

