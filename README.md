# timelapse_gif
creates day-long timelapse Gif of images captured over 15 minute intervals

Intended to be used with CRON;
Capture.sh will create images in ~/timelapse
lapse.sh will create GIF in ~/timelapse/gifs using files within ~/timelapse


(*/15 * * * * * /home/pi/.scripts/capture.sh) //captures picture every 15 mins
(0 0 * * * * /home/pi/.scripts/lapse.sh) //creates .gif of images for the last day
