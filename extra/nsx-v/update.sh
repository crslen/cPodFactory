#!/bin/bash
#bdereims@vmware.com

curl -k -u ${CREDENTIALS} --header "Content-Type: text/xml; charset=UTF-8" -d @mtu.xml -X PUT -i https://nsxmgr-vr.budcca-demo.lab/api/2.0/vdn/switches
