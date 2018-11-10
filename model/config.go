// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

package model

import (
	"encoding/json"
	"io/ioutil"

	"github.com/sirupsen/logrus"
	"github.com/therecipe/qt/core"
)

type conf struct {
	Wait  bool   `json:"wait"`
	IP    string `json:"ip"`
	Port  string `json:"port"`
	Token string `json:"token"`
}

// go:generate qtmoc
type Config struct {
	core.QObject

	logger *logrus.Logger

	_ func(key string, val string) `slot:"stringSet"`
	_ func(key string, val bool)   `slot:"boolSet"`
	_ func(key string) string      `slot:"stringValue"`
	_ func(key string) bool        `slot:"boolValue"`
	_ func()                       `slot:"defaults"`
	_ func()                       `slot:"save"`

	_ func() `constructor:"init"`
}

// Initialize config and setup slot connections
func (c *Config) init() {

	c.logger = logrus.New()

	// Connect slots
	c.ConnectStringSet(func(key string, val string) {
		c.SetString(key, val)
	})
	c.ConnectBoolSet(func(key string, val bool) {
		c.SetBool(key, val)
	})
	c.ConnectStringValue(func(key string) string {
		return c.GetString(key)
	})
	c.ConnectBoolValue(func(key string) bool {
		return c.GetBool(key)
	})
	c.ConnectSave(func() {
		c.save()
	})
	c.ConnectDefaults(func() {
		c.SetDefaults()
	})
}

// SetString values
func (c *Config) SetString(key string, val string) {
	var config = core.NewQSettings5(nil)
	config.SetValue(key, core.NewQVariant14(val))
}

// SetBbool values
func (c *Config) SetBool(key string, val bool) {
	var config = core.NewQSettings5(nil)
	config.SetValue(key, core.NewQVariant11(val))
}

// GetString value
func (c *Config) GetString(key string) string {
	var config = core.NewQSettings5(nil)
	return config.Value(key, core.NewQVariant14("")).ToString()
}

// GetBool values
func (c *Config) GetBool(key string) bool {
	var config = core.NewQSettings5(nil)
	return config.Value(key, core.NewQVariant11(false)).ToBool()
}

// SetDefault does initialize default values to access the nuki bridge
func (c *Config) SetDefaults() {
	var config = core.NewQSettings5(nil)
	config.SetValue("wait", core.NewQVariant11(false))
	config.SetValue("ip", core.NewQVariant14(""))
	config.SetValue("port", core.NewQVariant14(""))
	config.SetValue("token", core.NewQVariant14(""))
	config.Sync()
}

// LoadConfig reads a config from da json file
func (c *Config) LoadConfig(file string) error {

	var cfg conf
	c.logger.Printf("Read file %s\n", file)

	b, err := ioutil.ReadFile(file)
	if err != nil {
		return err
	}

	if err = json.Unmarshal(b, &cfg); err != nil {
		return err
	}

	var config = core.NewQSettings5(nil)
	config.SetValue("wait", core.NewQVariant11(cfg.Wait))
	config.SetValue("ip", core.NewQVariant14(cfg.IP))
	config.SetValue("port", core.NewQVariant14(cfg.Port))
	config.SetValue("token", core.NewQVariant14(cfg.Token))

	config.Sync()

	return nil
}

// save a json file as access.json
func (c *Config) save() {
	const file = "access.json"

	c.logger.Printf("Save file %s\n", file)

	cfg := conf{
		IP:    c.GetString("ip"),
		Port:  c.GetString("port"),
		Token: c.GetString("token"),
		Wait:  c.GetBool("wait"),
	}

	b, err := json.Marshal(cfg)
	if err != nil {
		c.logger.Error(err)
	}

	if err = ioutil.WriteFile(file, b, 0644); err != nil {
		c.logger.Error(err)
	}
}

// Sync
func (c *Config) Sync() {
	var config = core.NewQSettings5(nil)
	config.Sync()
}
