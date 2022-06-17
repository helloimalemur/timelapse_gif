# timelapse_gif
creates timelapse Gif of images captured


Intended to be used with CRON;
Capture.sh will create images in ~/timelapse
lapse.sh will create GIF in ~/timelapse/gifs using files within ~/timelapse


(*/15 * * * * * /home/pi/.scripts/capture.sh)
(0 0 * * * * /home/pi/.scripts/lapse.sh)
