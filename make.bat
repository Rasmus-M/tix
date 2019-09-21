xas99.py -R -L tix.lst src/tix.a99

xas99.py -R -i src/tix.a99 -o bin/TIX

java -jar tools/ea5tocart.jar bin/TIX "TIX" 0 16k > make.log

copy bin\tix8.bin .