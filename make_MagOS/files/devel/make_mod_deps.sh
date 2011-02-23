#!/bin/bash

# Описание: Генерирует файлы с зависимостями пакетов модулей для MagOS
# дата: 04.11.2010
# Автор: Антон Горошкин 
 
MOD_NAMES_DIR=mod_names
MOD_ROOTFS_DIR=mod_rootfs

for mod in `ls -1 $MOD_NAMES_DIR/??-*` ;do 
    echo "Генерация файла зависимостей для модуля $(basename $mod)"

#--------------
   [ -f $MOD_NAMES_DIR/_deps_$(basename $mod) ]&&rm $MOD_NAMES_DIR/_deps_$(basename $mod)

    for pak in `cat $mod` ;do 
      echo -ne \\r "Добавляются зависимости пакета $pak         "\\r 
      urpmq -d $1 $pak >>$MOD_NAMES_DIR/deps_$(basename $mod)
    done
#--------------
    sort -u $MOD_NAMES_DIR/deps_$(basename $mod)>$MOD_NAMES_DIR/_deps_$(basename $mod)
    rm $MOD_NAMES_DIR/deps_*
    echo -ne \\n "---> OK."\\n
done