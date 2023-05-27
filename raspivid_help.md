#### Helpful list of command line functions for raspivid as seen in line 3 of recordVideo.sh, reccoc.sh, and recoxy.sh executable files

| Short Form | Long Form   | Notes                                                                                     |
|------------|-------------|-------------------------------------------------------------------------------------------|
| -?         | --help      | Populates screen with the help information below                                          |
| -w         | --width     | Set image width. Default 1920                                                             |
| -h         | --height    | Set image height. Default 1080                                                            |
| -b         | --bitrate   | Set bitrate. Use bits per second (e.g. 10MBits/s would be -b 10000000)                    |
| -o         | --output    | Output filename (to write to stdout, use '-o -')                                          |
| -v         | --verbose   | Output verbose information during run                                                     |
| -t         | --timeout   | Time (ms) before takes picture and shuts down. If not specified, set to 5s                |
| -d         | --demo      | Run a demo mode (cycle through range of camera options, no capture)                       |
| -fps       | --framerate | Specify the frames per second to record                                                   |
| -e         | --penc      | Display preview image *after* encoding (shows compression artifacts)                      |

#### Preview Parameter Commands

| Short Form | Long Form   | Notes                                                                                     |
|------------|-------------|-------------------------------------------------------------------------------------------|
| -p         | --preview   | Preview window settings                                                                   |
| -f         | --fullscreen| Fullscreen preview mode                                                                   |
| -n         | --nopreview | Do not display a preview window                                                           |

#### Image Parameter Commands

| Short Form | Long Form   | Notes                                                                                     |
|------------|-------------|-------------------------------------------------------------------------------------------|
| -sh        | --sharpness | Set image sharpness (-100 to 100)                                                         |
| -co        | --contrast  | Set image contrast (-100 to 100)                                                          |
| -br        | --brightness| Set image brightness (0 to 100)                                                           |
| -sa        | --saturation| Set image saturation (-100 to 100)                                                        |
| -ISO       | --ISO       | Set capture ISO                                                                           |
| -vs        | --vstab     | Turn on video stabilization                                                               |
| -ev        | --ev        | Set EV compensation                                                                       |
| -ex        | --exposure  | Set exposure mode (off, auto, night, nightpreview, backlight, spotlight, sports, snow, beach, verylong, fixedfps, antishake, fireworks)  |
| -awb       | --awb       | Set AWB mode (off, auto, sun, cloud, shade, tungsten, fluorescent, incandescent, flash, horizon)  |
| -ifx       | --imxfx     | Set image effect (none, negative, solarise, sketch, denoise, emboss, oilpaint, hatch, gpen, pastel, watercolour, film, blur, saturation, colourswap, washedout, posterise, colourpoint, colourbalance, cartoon) |
| -cfx       | --colfx     | Set colour effect (U:V)                                                                   |
| -mm        | --metering  | Set metering mode (average, spot, backlit, matrix)                                        |
| -rot       | --rotation  | Set image rotation (0-359)                                                                |
| -hf        | --hflip     | Set horizontal flip                                                                       |
| -vf        | --vflip     | Set vertical flip                                                                         |
