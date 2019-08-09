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
Get yout Tenancy OCID<br>

Access:<br>
Menu --> Administration --> Tenancy Details<br>
Get yout Tenancy OCID<br>

Access:<br>
Menu --> Identity --> Policies<br>
Change the compartment to (root)<br>
<b>Create Policy</b><br>
  Name: oke-policy<br>
  Description: Workshop Policy<br>
  Policy Versioning: Keep Policy current<br>
  Policy Statements
    Statement: allow service OKE to manage all-resources in tenancy
  <b>Create</b>


Update your file "userdata/config"<br>
