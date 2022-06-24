TLDR:       You want to set a default screen layout;  You want the display manager to use  
            this layout.  Short answer don't.
See:        https://askubuntu.com/questions/63681/how-can-i-make-xrandr-customization-permanent

# Note to self after trying:
1) Dont use Xorg multiheading as it leads to complications:
    - at login manager, the config will load regardless of  
      if there is an hdmi1 connection
    - even though eDP-1 display can be scaled using a  
      matrix transformation, the i3bar is not properly  
      scaled.
