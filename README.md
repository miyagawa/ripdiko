# ripdiko

ripdiko rips radiko.jp streams. Metadata such as program title, station name and recording length is automatically determined by fetching the metadata via Radiko's (supposedly unofficial) API, and embedded in the output audio file.

## How to use

Set up environment variables:

- `RIPDIKO_OUTDIR`: Output directory to save ripped M4A files. Defaults to `~/Music/Radiko`

Run `ripdiko <station-id>` where station ID is `TBS`, `LFR`, `FMJ` etc. The script will end when the currently playing program ends (which is automatically figured out by using the API).

### Schedule and Buffer

You can run the script periodically with either crontab or Automator in iCal alarm.

Be sure to configure the server clock to be accurate. You *could* run the script up to one minute before the show (i.e. run the script on 1:59 for the program that starts on 2:00) if you're paranoid, but don't run it earlier than that, since this script has a one minute buffer for the recording by default (if you record a 2:00-2:30 show starting on 2:00, the recording will end on 2:31).

Because Radiko itself apparently buffers (delays) the first 10 to 15 second in the stream, it's actally safe to run the script on the exact time.

## Scripts

ripdiko supports calling your script once the recording is done. Save your script `recording_finished` in `~/.ripdiko/scripts/` as an executable, it will be called from ripdiko with the following environment variables:

- `RIPDIKO_PROGRAM_TITLE`
- `RIPDIKO_PROGRAM_STATION`
- `RIPDIKO_PROGRAM_DURATION`
- `RIPDIKO_PROGRAM_SUBTITLE`
- `RIPDIKO_PROGRAM_PERFORMER`
- `RIPDIKO_RECORDING_TIME`

Typical use of the scripts would be, but not limited to: send notifications, [generate Podcast feeds](http://github.com/miyagawa/dircaster) or import podcasts to iTunes.

## Requirements

Recommended to install the following with Homebrew (on Mac OS X) and bundler.

- Ruby 1.9
- Nokogiri
- rtmpdump
- ffmpeg

## Author

Tatsuhiko Miyagawa
