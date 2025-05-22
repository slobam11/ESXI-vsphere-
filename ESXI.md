So , this is a lab text which had errors and fixed. 

Building an esxi data center 

Here are some steps i did : 

Preparing the ESXi Host:
Make sure that the ESXi host is already installed and that you can access it through the vSphere web interface (ESXi host's IP address in the browser).

1. Check available resources:
RAM: Leave a minimum of 2 GB for the ESXi system (allocate the rest for the VCSA).
Disk: Ensure you have at least 50 GB of free space (for starters).

2. Downloading the VCSA OVF Template:
Download the vCenter Server Appliance ISO from the official VMware website.
Mount the ISO on your computer and locate the OVF template for deployment.

3. . Starting the Installation:
In the ESXi web interface:
Click on Create/Register VM.
Select the option Deploy a virtual machine from an OVF or OVA file.
Upload the downloaded OVF file.

4.  Configuring Resources for VCSA:
CPU: Set to 2 vCPU.
RAM: Set to 6 GB of RAM (leave 2 GB for the ESXi host).
Disk: Choose Thin Provisioning to minimize physical disk usage.

5. Entering Network Parameters:
IP Address Family: IPv4.
Network Mode: STATIC.
IP Address: For example, 192.168.0.50 (from the ESXi host's network).
Prefix: 24 (for subnet mask 255.255.255.0).
Default Gateway: For example, 192.168.0.1.
DNS Servers: 8.8.8.8, 8.8.4.4 (Google DNS).
Host Identity: For example, vcenter.local.

6. For DHCP NETWORK PARAMETERS:
IP Address Family: IPv4.
Network Mode: DHCP (instead of STATIC).
IP Address: Leave it blank or remove it, as DHCP will automatically assign an IP address.
Prefix - Leave it blank or remove it, as DHCP does not require this value.
Default Gateway: Leave it blank (if using DHCP, the gateway will be automatically assigned).
DNS Servers: Leave it blank (if using DHCP, the DNS servers will be automatically assigned).
Host Identity: For example, vcenter.local (this can remain the same, as it is the host name, not a network parameter).

7.  Starting VCSA:
After the installation is complete, the vCenter will start automatically. Access it through the browser using the static IP address you set.

8. . Additional Tips:
If you notice that performance is not optimal, you can reduce the load:
Reduce the number of active virtual machines on the ESXi host.
Regularly check disk and RAM usage.

so that is how i install and configure esxi host : ESXI is a bare-metal hypervizor which is working along with vCenter. 