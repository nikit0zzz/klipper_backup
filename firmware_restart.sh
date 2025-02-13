!#/usr/bin/bash

PRINTER_STATE=$(curl 127.0.0.1:80/printer/info | jq -r '.result.state')
if [[ "$PRINTER_STATE" == "ready" ]]
  then
    exit
fi
curl --fail --silent --request POST --data '{"jsonrpc": "2.0","method": "printer.firmware_restart","id": 8463}' localhost:7125/printer/firmware_restart | jq -r '.result'