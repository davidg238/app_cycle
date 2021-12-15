// Copyright 2021 Ekorau LLC

import color_tft show *
import pixel_display show *
import pixel_display.true_color show WHITE BLACK get_rgb
import font show *

import font.x11_100dpi.sans.sans_24_bold as sans_24_bold

import gpio
import spi
import pubsub

class DisplayApp:

  bus := ?
  device := ?
  driver := ?
  tft := ?
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

    driver = ColorTft device 128 128
        --reset= null
        --backlight= null
        --x_offset= 0
        --y_offset= 0
        --flags= COLOR_TFT_16_BIT_MODE
        --invert_colors= false

    tft = TrueColorPixelDisplay driver

  run -> none:
    try:
      sans_big := Font [sans_24_bold.ASCII]
      sans_big_context := tft.context --landscape --color=(get_rgb 0xff 0x00 0x00) --font=sans_big

      clear_screen tft

      tft.text sans_big_context 20 60 "$name"
      tft.draw

      sleep --ms=2000
      print "... end $name"
      pubsub.publish "device:$next" "from_$name"
    finally:
      close_all

  close_all -> none:
      tft.close
      // driver.close
      // device.close
      bus.close

  clear_screen tft -> none:
      tft.remove_all
      tft.background = BLACK
      tft.draw
