# terraform-oke
<h2>Cloud Console</h2>

<h3>Get the needed information of your account and create the neede logical resources</h3>

Access:<br>
Menu --> Identity --> Users --> Your Admin User<br>
Add the PEM key to the API Keys (userdata/oci_api_key_public.pem)<br>
<u>Get the API Key Fingerprint</u> (2d:b9:0f:d1:0d:07:1c:a7:d2:ad:47:8e:fc:7c:18:80)<br>
<u>Get your Object Storage Namespace</u>

Access:<br>
Menu --> Identity --> Compartments<br>
<b>Create Compartment</b><br>
	Name: OKE-Workshop<br>
	Description: Workshop Compartment<br>
	Parent Compartment: (root)<br>
		<b>Create</b>

Access:<br>
Menu --> Administration --> Tenancy Details<br>
<u>Get your Tenancy OCID</u>
<u>Get your </u>

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


<h3>Create the Oracle Container Engine for Kubernetes</h3>

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


<h3>Create the Oracle Autonomous Database </h3>

Access:<br>
Menu --> Autonomous Transaction Proscessing<br>
Modify the compartment to "OKE-Workshop"<br>
<b>Create Autonomous Database</b><br>
	Display name: atp-workshop<br>
	Display name: atp<br>
	Choose a workload type: Transaction Processing<br>
	Choose a deployment type: Serverless<br>
	CPU core count: 1<br>
	Storage (TB): 1<br>
	Password: OracleCloud#123<br>
	Confirm password: OracleCloud#123<br>
	Choose a license type: Bring Your Own Licence<br>
		<b>Create Autonomous Database</b>

<b>DB Connection</b><br>
Download Client Credentials (Wallet)<br>
	<b>Download</b><br>
		Password: OracleCloud#123<br>
		Confirm password: OracleCloud#123<br>
		<b>Download</b><br>


<h3>Create the Bastion VM with Resource Manager</h3>

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
 
<b>Terraform Actions --> Plan</b><br>
	Use default configuration<br>
		<b>Plan</b>

<b>Terraform Actions --> Apply</b><br>
	Use default configuration<br>
		<b>Apply</b>

<u>Get the "bastion_ip" data from the Job Details log</u>


<h3>Configure the files to access Oracle Cloud from Bastion VM</h3>

Access:<br>
	Menu --> Developer Services --> Container Clusters (OKE)<br>
	<b>cluster-workshop</b><br>
	<b>Access Kubeconfig</b><br>
	<u>Copy and paste the commands 1. and 2. and set your KUBECONFIG environment variable.</u>

<u>Update your file "userdata/config"</u>


<h2>Bastion VM</h2>

Access the "vm-bastion":<br>
	Linux/MacOS: ssh opc@'<i>ip_address</i>' -i '<i>key path</i>'/oci_api_key.pem<br>
	Windows PowerShell: ssh opc@'<i>ip_address</i>' -i '<i>key path</i>'/oci_api_key.pem -L 8001:localhost:8001<br>
	Windows PuTTY:<br>
		Session<br>
			Host Name (or IP Address): '<i>ip_address</i>'<br>
		Connection --> Data<br>
			Auto-login username: opc<br>
		Connection --> Data --> SSH --> Auth<br>
			Private key file for authentication: '<i>key path</i>'/oci_api_key.ppk<br>
		Connection --> Data --> SSH --> Tunnels<br>
			Source port: 8001<br>
			Destination: localhost:8001<br>
				<b>Add</b><br>
		Session<br>
			Saved Sessions: OKE Workshop<br>
				<b>Save</b><br>
					<b>Open</b><br>

Commands:<br>
	sudo su
	git clone '<i>your git repository</i>'<br>
	mkdir -p ~/.oci<br>
	cp terraform-oke/userdata/oci_api_key.pem ~/.oci/oci_api_key.pem<br>
	cp terraform-oke/userdata/config ~/.oci/config<br>
	oci setup repair-file-permissions --file ~/.oci/oci_api_key.pem<br>
	oci setup repair-file-permissions --file ~/.oci/config<br>
	<u>Use Access Kubeconfig information</u><br>
	kubectl get nodes<br>
	kubectl get pods<br>
	kubectl get services<br>
	//get the token needed to connect to Kubernetes dashboard<br>
	cat ~/.kube/config | grep token<br>
	//initiate the proxy to connect to Kubernetes dashboard<br>
	kubectl proxy<br>
