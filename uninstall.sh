#!/bin/bash
# - ELIMINAR ZiVPN -
clear
echo -e "Desinstalando ZiVPN ..."
systemctl stop zivpn.service 1> /dev/null 2> /dev/null
systemctl stop zivpn_backfill.service 1> /dev/null 2> /dev/null
systemctl disable zivpn.service 1> /dev/null 2> /dev/null
systemctl disable zivpn_backfill.service 1> /dev/null 2> /dev/null
rm /etc/systemd/system/zivpn.service 1> /dev/null 2> /dev/null
rm /etc/systemd/system/zivpn_backfill.service 1> /dev/null 2> /dev/null
killall zivpn 1> /dev/null 2> /dev/null
rm -rf /etc/zivpn 1> /dev/null 2> /dev/null
rm /usr/local/bin/zivpn 1> /dev/null 2> /dev/null
if pgrep "zivpn" >/dev/null; then
  echo -e "Servidor en ejecución"
else
  echo -e "Servidor detenido"
fi
file="/usr/local/bin/zivpn" 1> /dev/null 2> /dev/null
if [ -e "$file" ] 1> /dev/null 2> /dev/null; then
  echo -e "Aún quedan archivos, inténtalo de nuevo"
else
  echo -e "Eliminado Exitosamente"
fi
echo "Cleaning Cache & Swap"
echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3
swapoff -a && swapon -a
echo -e "LISTO ."
