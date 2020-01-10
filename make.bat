xas99.py -R -S -L tix.lst src/tix.a99
@IF %ERRORLEVEL% NEQ 0 GOTO :end

xas99.py -R -i src/tix.a99 -o bin/TIX

java -jar tools/ea5tocart.jar bin/TIX "TIX" 0 16k > make.log

copy bin\TIX8.bin .\tix8.bin


IF EXIST obstacle.dsk GOTO :dskok
xdm99.py tix.dsk --initialize DSSD -n TIX
:dskok

rem xdm99.py tix.dsk -a LOAD
xdm99.py tix.dsk -a bin/TIX
xdm99.py tix.dsk -a bin/TIY

WHERE jar
@IF %ERRORLEVEL% NEQ 0 GOTO :end
jar -cvf tix.rpk tix8.bin layout.xml > make.log

:end