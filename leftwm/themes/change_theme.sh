#! /bin/bash
spath=~/.config/leftwm/themes
cd $spath
if [ -d current ]; 
then
	current=$(readlink current)
	rm current
	flag=0	
	for theme in $(ls -d */); do
		theme=${theme%?}
		if [ $flag -eq 1 ]; then
			ln -s $theme current
			flag=0
		fi
		if [ $current == $theme ]; then
			flag=1
		fi	
	done
	if [ $flag -eq 1 ];
	then
		ls=$(ls -d */)
		ls=(${ls})
		temp=${ls[0]}
		ln -s ${temp%?} current
		leftwm-command SoftReload
	fi
else
	ln -s clean_desktop current
	leftwm-command SoftReload
fi
leftwm-command SoftReload &
