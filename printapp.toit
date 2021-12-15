// Copyright 2021 Ekorau LLC

import pubsub

class PrintApp:

  name := ?
  next := ?

  constructor.named .name/string .next/string:

  run -> none:
    try:
      print "$name"
      sleep --ms=2000
      pubsub.publish "device:$next" "from_$name"
    finally:
      close_all

  close_all -> none:

