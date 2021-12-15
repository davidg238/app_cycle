// Copyright 2021 Ekorau LLC

import .displayapp show DisplayApp
import .printapp show PrintApp
import .busapp show BusApp

main:
  app := BusApp.named "app3" "app1"
  // app := PrintApp.named "app3" "app1"
  // app := DisplayApp.named "app3" "app1"
  app.run