# terraform-oke

Access:<br>
Menu --> Identity --> Users --> Your Admin User<br>
Add the PEM key to the API Keys (userdata/oci_api_key_public.pem)<br>
Get the API Key Fingerprint (2d:b9:0f:d1:0d:07:1c:a7:d2:ad:47:8e:fc:7c:18:80)<br>
Get yout User OCID

Access:<br>
Menu --> Identity --> Compartments<br>
<b>Create Compartment</b><br>
  Name: OKE-Workshop<br>
  Description: Workshop Compartment<br>
  Parent Compartment: (root)<br>
    <b>Create</b>

Access:<br>
Menu --> Administration --> Tenancy Details<br>
Get yout Tenancy OCID

Access:<br>
Menu --> Identity --> Policies<br>
Change the compartment to (root)<br>
<b>Create Policy</b><br>
  Name: oke-policy<br>
  Description: Workshop Policy<br>
  Policy Versioning: Keep Policy current<br>
  Policy Statements<br>
    Statement: allow service OKE to manage all-resources in tenancy<br>
    <b>Create</b>

Access:<br>
Menu --> Developer Services --> Container Clusters (OKE)<br>
Modify the compartment to "OKE-Workshop"<br>
<b>Create Cluster</b><br>
  Name: cluster-workshop<br>
  Kubernetes Version: v1.13.5<br>
  Quick Create<br>
  Shape: VM.Standard2.1<br>
  Quantity Per Subnet: 1<br>
    <b>Create</b>

Access:<br>
Menu --> Resource Manager --> Stacks<br>
<b>Create Stack</b><br>
  Upload the file "oke.zip" (or drag and drop)
  Name: bastion-stack<br>
  Description: Deploy a bastion host to manage Kubernetes<br>
    <b>Next</b><br>
  Use default configuration<br>
    <b>Next</b><br>
  Verify if the fields are filled<br>
    <b>Next</b>
 
Terraform Actions --> Plan<br>
  Use default configuration<br>
    <b>Plan</b>

Terraform Actions --> Apply<br>
  Use default configuration<br>
    <b>Apply</b>

Update your file "userdata/config"

Get the "bastion_ip" data from the Job Details log

Access the "vm-bastion":<br>
  Linux/MacOS: ssh opc@<ip_address> -i oci_api_key.pem<br>
  Windows PowerShell: ssh opc@<ip_address> -i oci_api_key.pem -L 8001:localhost:8001<br>
  Windows PuTTY:<br>
    Session<br>
      Host Name (or IP Address): <ip_address><br>
    Connection --> Data<br>
      Auto-login username: opc<br>
    Connection --> Data --> SSH --> Auth<br>
      Private key file for authentication: oci_api_key.ppk<br>
    Connection --> Data --> SSH --> Tunnels<br>
      Source port: 8001<br>
      Destination: localhost:8001<br>
        <b>Add</b>
    Session<br>
      Saved Sessions: OKE Workshop<br>
        <b>Save</b><br>
          <b>Open</b><br>

Command:
  git clone <your git repository><br>
  bash terraform-oke/script.sh<br>
