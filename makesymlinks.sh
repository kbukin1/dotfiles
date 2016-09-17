#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old            # old dotfiles backup directory

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

NOT_DOT_FILES="cygwin.bat makesymlinks.sh"

for file in `ls $dir`; do
    NOT_DOT_FILE=0
    for not_dot in $NOT_DOT_FILES; do
        if [ $not_dot == $file ]
        then 
            NOT_DOT_FILE=1
            continue
        fi
    done

    if [ $NOT_DOT_FILE == '1' ] 
    then 
        echo Skipping $file
        continue
    fi

    #if [ -f $olddir/.$file ]
    #then 
    #    echo Skipping .$file
    #    continue
    #fi

    echo "Moving .$file from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to .$file in home directory."
    ln -s $dir/$file ~/.$file
done

