# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>
#
# Thanks to: Onse <http://goo.gl/Qubl8>

## Configuration start

# no X output
out_to_x no
# don't create own window
own_window no
# print to console
out_to_console yes
# shorten units
short_units yes
update_interval 1.0
total_run_times 0
background no
double_buffer yes
default_bar_size 50 5
default_gauge_size 20 20
imlib_cache_size 0
draw_shades no
no_buffers yes
uppercase no
cpu_avg_samples 2
override_utf8_locale yes
# font
#use_xft yes
#xftfont DejaVu Sans:size=8

## Configuration end
TEXT

# i3bar JSON
[
  {
    "full_text": "${freq_g}GHz ${acpitemp}C",
    "min_width": 80,
    "align": "center",
    "color":
      ${if_match ${acpitemp}>65}
        "\#E84F4F"
      ${else}
        "\#4E9FB1"
      ${endif}
  },

  {
    "full_text": "${memperc}%",
    "min_width": 30,
    "align": "center",
    "color":
      ${if_match ${memperc}>85}
        "\#E84F4F"
      ${else}
        ${if_match ${swapperc}>0}
          "\#E84F4F"
        ${else}
          "\#4E9FB1"
        ${endif}
      ${endif}
  },

  {
    "full_text": "${uptime_short}",
    "min_width": 40,
    "align": "center",
    "color": "\#4E9FB1"
  },

  {
    "full_text":
      ${if_existing /proc/net/route wlan0}
        "${wireless_essid wlan0}[${wireless_link_qual_perc wlan0}%][${addr wlan0}] d: ${downspeed wlan0}/s u: ${upspeed wlan0}/s"
      ${else}
        "↓ ${downspeed eth0}/s ↑ ${upspeed eth0}/s"
      ${endif},
    "min_width":
      ${if_existing /proc/net/route wlan0}
        300
      ${else}
        140
      ${endif},
    "align": "center",
    "color": "\#4E9FB1"
  },

  {
    "full_text": "V: ${exec amixer get Master | grep "Mono:" | awk '{print $4}' | sed 's:^.\(.*\).$:\1:'}",
    "min_width": 20,
    "align": "center",
    "color": "\#4E9FB1"
  },

  {
    "full_text": "${time %a, %d. %b %I:%M %P}",
    "min_width": 135,
    "align": "center",
    "color": "\#4E9FB1"
  },
  {
    "full_text": ""
  }
],
