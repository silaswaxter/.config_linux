#Patches special keys for asus rog g14
#Should be moved to "/etc/udev/hwdb.d/90-g14-mod.hwdb"
#Maps fn+up to pgup, fn+down pgdown, fn+left home, fn+right end,
#     fn+left_audio to keyboardbrightnessdown, 
#     fn+right_audio keyboardbrightnessup,
#     and fixes mute button
#https://www.reddit.com/r/ZephyrusG14/comments/k69zjm/linux_new_daily_driver/
evdev:input:b0003v0B05p1866*
  KEYBOARD_KEY_c00b6=kbdillumdown
  KEYBOARD_KEY_c00b5=kbdillumup
  KEYBOARD_KEY_ff3100c5=pagedown
  KEYBOARD_KEY_ff3100c4=pageup
  KEYBOARD_KEY_ff3100b2=home
  KEYBOARD_KEY_ff3100b3=end
  KEYBOARD_KEY_ff31007c=f20
