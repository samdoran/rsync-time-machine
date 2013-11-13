## rsync-time-machine

Backup mimicking Time Machine from Mac OS X using rsync

### How to get up and running

Define the `$SOURCE` and `$DESTINATION` variables using absolute paths and any exclusions in `$EXCLUDE`. Schedule it to run using `cron` or `launchd`, or run it manually. **Remember that trailing slashes matter to `rsync`.**

The  `$SOURCE` and `$DESTINATION` variables could be defined as `$1` and `$2`, respectively, if you want to pass in those parameters each time. This could be used to create backups of different sources to different destinations or a remote host without having to create duplicate copies of `rsync-time-machine.sh`.

Define files you want excluded from the backups in `$SOURCE/.rsync/exclusions` with one exclusion pattern per line.

### What it does

Snapshot folders are created in `$DESTINATION/$DATE_FORMAT` according to the time the snapshot was created. A symlink to the most recent snapshot is created at `$DESTINATION/Latest`. The `--link-dest` parameter of `rsync` is used so that only files that have changed since the last snapshot are copied, keeping the snapshot sizes small.

`rsync-time-machine.sh` keeps all backups from the current month and monthly backups for one year.

### Where can I use this?

I have tested this on RHEL 5, RHEL 6, and OS X 10.8. Since BSD `date` varies quite a bit from GNU `date`, I added some logic to check the OS and run the command using the appropriate parameters. This is potentially the most precarious part of the program, so I encourage you to review and test the "Remove old backups" section thoroughly on your particular OS before putting it into production. I created [`empty-snapshots.sh`](https://gist.github.com/samdoran/5346072#file-empty-snapshots-sh) to aid in testing.

### License

Copyright (c) 2013 Sam Doran

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

