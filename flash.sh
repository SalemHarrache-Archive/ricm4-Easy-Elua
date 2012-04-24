#!/bin/bash
#
# Flash a easy-Elua program to the board
#
# Authors : Salem Harrache
#           Elizabeth Paz
#
# Syntaxe: # ./flash.sh [myprogram.lua]"
#
#################################

STFLASH="$(pwd)/env/utils/st-flash"
COMMAND="sudo $STFLASH write elua_lua_stm32f407vg.bin 0x08000000"

flash() {
    source activate_env.sh
    if test ! -d "elua"; then
        echo Erreur: Vous devez installer elua
        exit 1
    fi
    if test ! -f "arduino_wraper/arduino_wraper.lua"; then
        echo Erreur: il manque le fichier arduino_wrapper/arduino_wrapper.lua
        exit 1
    fi
    cp ./arduino_wrapper/arduino_wrapper.lua ./elua/romfs/arduino_wrapper.lua
    cd elua
    scons board=STM32F4DSCY prog
    echo $COMMAND
    $COMMAND
    cd ../
}

## Begin
if [ $# -ne 1 ]; then
    flash
else
    file=$1
    if test ! -f $file; then
        echo Erreur: $file "n'est pas un fichier"
        exit 1
    fi
    cp $file ./elua/romfs/autorun.lua
    flash
fi

echo 'we are done....'

