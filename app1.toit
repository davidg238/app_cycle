// Copyright 2021 Ekorau LLC

import .displayapp show DisplayApp
import .printapp show PrintApp
import .busapp show BusApp

main:
  app := BusApp.named "app1" "app2"
  // app := PrintApp.named "app1" "app2"
  // app := DisplayApp.named "app1" "app2"
  app.run