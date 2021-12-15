// Copyright 2021 Ekorau LLC

import .displayapp show DisplayApp
import .printapp show PrintApp
import .busapp show BusApp

main:
  app := BusApp.named "app2" "app3"
  // app := PrintApp.named "app2" "app3"
  // app := DisplayApp.named "app2" "app3"
  app.run