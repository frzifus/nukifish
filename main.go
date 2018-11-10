// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

package main

import (
	"os"

	"github.com/therecipe/qt/core"
	"github.com/therecipe/qt/quick"
	"github.com/therecipe/qt/sailfish"

	"github.com/frzifus/nukifish/model"
)

func main() {
	core.QCoreApplication_SetAttribute(core.Qt__AA_EnableHighDpiScaling, true)

	app := sailfish.SailfishApp_Application(len(os.Args), os.Args)
	app.SetApplicationName("harbour-nukifish")

	view := sailfish.SailfishApp_CreateView()

	var nukiConfig = model.NewConfig(nil)
	nukiConfig.LoadConfig("access.json")
	// var nukiClient = model.NewClient(nil)

	// Setup context variables
	view.RootContext().SetContextProperty("NukiConfig", nukiConfig)
	// view.RootContext().SetContextProperty("NukiClient", nukiClient)

	view.SetSource(core.NewQUrl3("qrc:/qml/nuki.qml", 0))
	view.SetResizeMode(quick.QQuickView__SizeRootObjectToView)
	view.Show()

	app.Exec()
}
