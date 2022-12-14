#! /bin/bash
# forked from https://gitlab.com/dwt1/dotfiles/-/blob/master/baraction.sh

hdd() {
  hdd="$(df -h | awk 'NR==5{print $4}')"
  echo -e "$hdd"
}

mem() {
  mem=`free -h | awk '/Mem/ {printf "%sB/%sB",$3,$2}'`
  echo -e "$mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  temp=`sensors -A | grep Tctl | awk '{print $2}'`
  echo -e "CPU: $cpu% +@fg=1;+@fg=0; "${temp:1}
}

vol() {
    vol=`pamixer --get-volume`
    echo -e "$vol%"
}

net() {
  INTERFACE=wlp4s0
  d1=$(grep $INTERFACE /proc/net/dev|awk '{print $2}')
  u1=$(grep $INTERFACE /proc/net/dev|awk '{print $10}')
  sleep 0.2
  d2=$(grep $INTERFACE /proc/net/dev|awk '{print $2}')
  u2=$(grep $INTERFACE /proc/net/dev|awk '{print $10}')
  down=$((($d2-$d1)*5))
  up=$((($u2-$u1)*5))
  down_unit='B'
  up_unit='B'
  if [ $down -gt 1000 ]; then
    down=$(($down/1000))
    down_unit='Kb'
    if [ $down -gt 1000 ]; then
      down=$(($down/1000))
      down_unit='Mb'
    fi
  fi
  if [ $up -gt 1000 ]; then
    up=$(($up/1000))
    up_unit='Kb'
    if [ $up -gt 1000 ]; then
      up=$(($up/1000))
      up_unit='Mb'
    fi
  fi
  echo -e "+@fg=1;+@fg=0;  "$up$up_unit"/s  +@fg=1;+@fg=0;  "$down$down_unit"/s"
}

battery() {
  state=`acpi | grep 0: | awk '{print $3}' | sed 's/.$//'`
  percentage=`acpi | grep 0: | awk '{print $4}'`
  if [ $state == 'Full' ]; then
    percentage=$((${percentage%?}))
  else
    percentage=$((${percentage%??}))
  fi
  icon=''
  if [ $state == 'Charging' ]; then
    icon=' '
  fi
  if [ $percentage -lt 10 ]; then
      icon=$icon
  elif [ $percentage -lt 30 ]; then
      icon=$icon
  elif [ $percentage -lt 50 ]; then
      icon=$icon
  elif [ $percentage -lt 90 ]; then
      icon=$icon
  elif [ True ]; then
    icon=$icon
  fi
  if [ $state == 'Full' ]; then
    icon=
  fi
  echo -e '+@fg=1;'$icon' +@fg=0;'$percentage%
}

time_date() {
  date "+%a, %b%e, %H:%M"
}


SLEEP_SEC=0.5

while :; do
    echo " +@fg=1;+@fg=0;  $(hdd)  $(net)  +@fg=1;+@fg=0;  $(mem)  +@fg=1; +@fg=0;$(vol)  $(battery)  +@fg=1;  +@fg=0;$(time_date)"
	sleep $SLEEP_SEC
done

