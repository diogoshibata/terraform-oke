!#/bin/bash
sudo mkdir -p ~/.oci
sudo cp terraform-oke/userdata/oci_api_key.pem ~/.oci/oci_api_key.pem
sudo cp terraform-oke/userdata/config ~/.oci/config

sudo oci setup repair-file-permissions --file ~/.oci/oci_api_key.pem
sudo oci setup repair-file-permissions --file ~/.oci/config