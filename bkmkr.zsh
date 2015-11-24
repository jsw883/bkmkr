#!/bin/zsh

usage() {
  echo "usage: \e[32mbkmkr \e[39m./path/to/bookmarks_MM_DD_YY.html [--formatted]"
  echo "    \e[34m-h, --help          usage"
  echo "    \e[34m-f, --formatted     use Markdown list formatting"
}

if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]
then
  usage;
  exit 1
fi

p=${1%/*}
o=${1%.html}.md

echo $1 |
awk -v f=$2 -F'[_.]' '{
  if (f=="-f"||f=="--formatted") {
    p="###";
    s=" ";
  }
  print p s "Google Chrome Bookmarks: Exported "$2"/"$3"/"$4"" s p;
}' > $o

cat $1 |
awk -v f=$2 -F'[><]' '{
  g=substr($1,0,(length($1)-4)/2);
  d=length(g)/2;
  split($4,a,"\"");
  if (f=="-f"||f=="--formatted") {
    p="* ";
    l="<"
    r=">";
  }
  if (d>0) {
    s=substr($4,0,2);
    if (s=="H3") {
      print g p toupper($5);
    } else if (s=="A "&&!match(a[2],"file")) {
      print g p l a[2] r;
    }
  }
}' >> $o