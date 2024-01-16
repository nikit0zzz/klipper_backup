!#/usr/bin/bash
mkdir -p $HOME/klipper_backup/printer/config $HOME/klipper_backup/printer/macros $HOME/klipper_backup/printer/timelapse $HOME/klipper_backup/printer/klipper_macro $HOME/klipper_backup/os
#cat $HOME/moonraker-timelapse/klipper_macro/timelapse.cfg > $HOME/klipper_backup/printer/klipper_macro/timelapse.cfg
#cat $HOME/printer_data/config/telegram.conf > $HOME/klipper_backup/printer/config/telegram.cfg
#cat $HOME/printer_data/config/printer.cfg > $HOME/klipper_backup/printer/config/printer.cfg
#cat $HOME/printer_data/config/macros.cfg > $HOME/klipper_backup/printer/config/macros.cfg
#cat $HOME/printer_data/config/moonraker.conf > $HOME/klipper_backup/printer/config/moonraker.cfg
#cat $HOME/printer_data/config/crowsnest.conf > $HOME/klipper_backup/printer/config/crowsnest.cfg

cd $HOME/printer_data/config
for cfg in *.cfg
  do
    cat $cfg > $HOME/klipper_backup/printer/config/$cfg
  done

cd $HOME/printer_data/config/macros
for cfg in *.cfg
  do
    cat $cfg > $HOME/klipper_backup/printer/macros/$cfg
  done

apt list > $HOME/klipper_backup/os/apt.list

cd $HOME/klipper_backup
git add --all
git commit -m "klipper backup"
git push
