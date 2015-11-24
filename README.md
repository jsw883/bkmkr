bkmkr
-----

Bash script for converting Google Chrome bookmarks from `html` to either `txt` or `md`. The script uses [awk](http://www.gnu.org/software/gawk/manual/gawk.html) to parse the nested directory structure of the bookmarks, and correctly retains directory names and nesting. Indented text with only the links copied is the default formatting, but Markdown list formatting can be specified by the command line flag `--formatted`.

While the awk operations are specific to the `html` exported by Google Chrome, you could easily tweak the operations to work for Safari or Firefox instead. I may eventually modify the script to take another command line flag specifiying the browser type, but this isn't a priority.

### Usage ###

    chmod +x bkmkr.sh
    ./bkmkr.sh ./path/to/bookmarks_MM_DD_YY.html
    ./bkmkr.sh ./path/to/bookmarks_MM_DD_YY.html --formatted