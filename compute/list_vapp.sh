#!/bin/bash
#bdereims@vmware.com

. ./env

PS_SCRIPT=list_vapp.ps1

SCRIPT_DIR=/tmp/scripts
SCRIPT=/tmp/scripts/$$.ps1

mkdir -p ${SCRIPT_DIR} 
cp ${COMPUTE_DIR}/${PS_SCRIPT} ${SCRIPT} 

sed -i -e "s/###VCENTER###/${VCENTER}/" \
-e "s/###VCENTER_ADMIN###/${VCENTER_ADMIN}/" \
-e "s/###VCENTER_PASSWD###/${VCENTER_PASSWD}/" \
-e "s/###VCENTER_DATACENTER###/${VCENTER_DATACENTER}/" \
-e "s/###VCENTER_CLUSTER###/${VCENTER_CLUSTER}/" \
${SCRIPT}

echo "List vApp."
#docker run --rm -it --dns=10.50.0.3 -v ${SCRIPT_DIR}:${SCRIPT_DIR} vmware/powerclicore:ubuntu14.04 powershell -NoLogo ${SCRIPT} 
docker run --rm --dns=10.50.0.3 -v ${SCRIPT_DIR}:${SCRIPT_DIR} vmware/powerclicore:ubuntu14.04 powershell -NoLogo ${SCRIPT} 

rm -fr ${SCRIPT}
