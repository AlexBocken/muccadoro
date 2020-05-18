:tomato: Implementation of the [Pomodoro Technique][wikipedia] using [`figlet(6)`][],
[`cowsay(1)`][], and optionally [`lolcat`][] :cow:

Personal version to work together with dwmblocks display for daily minutes. Also removes
cowsay during the timer. See https://github.com/AlexBocken/dotfiles/blob/master/.local/bin/statusbar/getpomminutes for my bodged implementation of this statusbar feature. (It's ugly, I know)

![Screenshot of muccadoro](/../media/screenshot.png?raw=true "MOO!")

[wikipedia]: https://en.wikipedia.org/wiki/Pomodoro_Technique
[`figlet(6)`]: http://www.figlet.org/figlet-man.html
[`cowsay(1)`]: https://linux.die.net/man/1/cowsay
[`lolcat`]: https://github.com/busyloop/lolcat

## Features
*   Sends desktop notifications.
*   Can't stop.  [SIGTSTP][] (<kbd>Ctrl</kbd>-<kbd>Z</kbd>) is trapped.  Pomodoros are
    uninterruptible.
*   Traps [SIGINT][] to make <kbd>Ctrl</kbd>-<kbd>C</kbd> abandon pomodoros.
*   Silly mode (or is it stern?) is enabled with `-s` (can be specified multiple times).
*   Avoids using `clear` so the terminal doesn't flash.
*   Hides the cursor.
*   Disables echoing of stdin.
*   Keeps the cow at the bottom of your terminal.
*   Prints some stats when exiting: when pomodoros started and ended and the length of
    breaks ([can be redirected to a file](#saving-summaries-to-a-file)).
*   Seconds are very slightly longer than customary (subject to the speed of your
    computer; maybe adds 10 seconds to a 25 minute pomodoro).
*   Two pomodoro timers possible, second one can be used via setting `$2` to `f` (for freetime
    in this case)
*   Easily able to display time in your statusbar
*   Added small scripts for easy execution of timer with a log-file

[SIGTSTP]: https://www.gnu.org/software/libc/manual/html_node/Job-Control-Signals
[SIGINT]: https://www.gnu.org/software/libc/manual/html_node/Termination-Signals

## Installation

adapt the install path in the `Makefile` to your liking and run
```bash
make install
```


### Manual

Put `muccadoro` inside some directory in your `PATH`, e.g. `~/bin/` (or `~/.local/bin/`):

```bash
curl -fLo ~/bin/muccadoro https://raw.githubusercontent.com/AlexBocken/muccadoro/master/muccadoro
```

### Notes

I recommend creating an alias such as

```bash
alias pomo='muccadoro | tee -ai ~/pomodoros.txt'
```

See "[Saving summaries to a file](#saving-summaries-to-a-file)" for details.

## Usage notes

The first positional argument is the amount of minutes one pomodoro should take (default:
25).  If you want 20-minute pomodoros, use `muccadoro 20`, for example.  The program exits
after four pomodoros have been completed and a longer break should be taken.

### Saving summaries to a file

You may want to keep a record of how many pomodoros you did and when (and for how long)
you took breaks.  This is supported by simply redirecting stdout:

```bash
muccadoro >> ~/pomodoros.txt
```

If you want to save the summary but also have it printed to stdout, use:

```bash
muccadoro | tee -ai ~/pomodoros.txt
```

The `-i` (`--ignore-interrupts`) flag of `tee` makes sure the summary is correctly
processed in case the pipeline was killed with <kbd>Ctrl</kbd>-<kbd>C</kbd> (which is the
intended way to quit when doing less than four pomodoros).

<!-- vim: set tw=90 sts=-1 sw=4 et spell: -->
