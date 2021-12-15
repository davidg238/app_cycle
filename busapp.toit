// Copyright 2021 Ekorau LLC

import gpio
import spi
import pubsub

class BusApp:

  bus := ?
  device := ?

  name := ?
  next := ?

  constructor.named .name/string .next/string:

    bus = spi.Bus
        --mosi= gpio.Pin 25
        --clock= gpio.Pin 19

    device = bus.device
        --cs= gpio.Pin 22
        --dc= gpio.Pin 21
        --frequency= 1_000_000 * 20

  run -> none:
    try:
      print "$name"
      sleep --ms=2000
      pubsub.publish "device:$next" "from_$name"
    finally:
      close_all

  close_all -> none:
    device.close
    bus.close