!#/usr/bin/bash

PRINTER_STATE=$(curl 127.0.0.1:80/printer/info | jq -r '.result.state')
if [[ "$PRINTER_STATE" == "ready" ]]
  then
    exit
fi

mkdir -p $HOME/klipper_backup/printer/config $HOME/klipper_backup/printer/macros $HOME/klipper_backup/printer/timelapse $HOME/klipper_backup/printer/klipper_macro $HOME/klipper_backup/os $HOME/klipper_backup/spoolman $HOME/klipper_backup/database
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

cat $HOME/printer_data/moonraker.asvc > $HOME/klipper_backup/moonraker.asvc 
cat $HOME/printer_data/database/moonraker-sql.db|base64 > $HOME/klipper_backup/database/moonraker-sql.db.base64
cat $HOME/.local/share/spoolman/spoolman.db|base64 > $HOME/klipper_backup/spoolman/spoolman.db.base64

cd $HOME/klipper_backup
git add --all
git commit -m "klipper backup"
git push
