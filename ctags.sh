#!/bin/sh
find . -name '*.py' \
         -o -name '*.go' \
         -o -name '*.lua' \
         -o -name '*.c' \
         -o -name '*.h' \
         -o -name '*.cpp' \
         -o -name '*.hpp'  \
         -o -name '*.cc' \
         -o -name '*.hh' \
         > cscope.files

# -b: just build
# -q: create inverted index
cscope -bkq -i cscope.files
ctags -R --fields=+iaS --extra=+q *
