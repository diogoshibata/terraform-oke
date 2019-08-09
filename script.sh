#!/bin/bash
mkdir -p ~/.oci
cp terraform-oke/userdata/oci_api_key.pem ~/.oci/oci_api_key.pem
cp terraform-oke/userdata/config ~/.oci/config
oci setup repair-file-permissions --file ~/.oci/oci_api_key.pem
oci setup repair-file-permissions --file ~/.oci/config