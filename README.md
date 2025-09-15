Building an ESXi Data Center: 
Step-by-Step Guide

Full Procedure: Add ESXi Hosts to Nagios & View in Nagstamon
Goal: Monitor three ESXi hosts in Nagios and surface the results in Nagstamon, with version-controlled configuration on GitHub.


0) Environment & Assumptions

OS: Ubuntu (service named nagios with binary nagios4)
Nagios Core pathing (adjust if your install differs):
Main config: /usr/local/nagios/etc/nagios.cfg
Objects dir: /usr/local/nagios/etc/objects/
Runtime cache: /usr/local/nagios/var/objects.cache
Plugins (Debian/Ubuntu): /usr/lib/nagios/plugins/
Plugins (source install): /usr/local/nagios/libexec/
Resource macros: /usr/local/nagios/etc/resource.cfg (defines $USER1$)


1) Inventory (we monitor 3 ESXi hosts)
Hostname (Nagios host_name)	Display	IP Address
esxi01	ESXi 192.168.1.5	
esxi02	ESXi 192.168.1.8	
esxi03	ESXi 192.168.1.7	

host_name must be unique; the actual ESXi system hostname can differ. IP is set via address.

Create a dedicated objects file

Create esxi.cfg for ESXi-related hosts/services and include it from nagios.cfg.

2.1 Create/edit the file
sudo nano /usr/local/nagios/etc/objects/esxi.cfg
2.2 Include it in the main config Append to /usr/local/nagios/etc/nagios.cfg:
cfg_file=/usr/local/nagios/etc/objects/esxi.cfg
Without this line, Nagios won’t load esxi.cfg.

Validate before restarting
Always run a config check first to pinpoint errors:
nagios4 -v /usr/local/nagios/etc/nagios.cfg
If validation is OK, restart the service:
sudo systemctl restart nagios
Useful to confirm which config file the daemon uses:
Inspect how objects were actually loaded : 
grep -A20 "host esxi01" /usr/local/nagios/var/objects.cache

7) Configure Nagstamon
Open Nagstamon → Settings → Servers → Add.
Select server type: Nagios.
Enter the monitoring server URL and credentials.
Test connection → on success, Nagstamon will display your esxi01–03 and their services.

Ensure commands & plugins exist
If validation throws Service check command '...' not defined, make sure corresponding command definitions exist in objects/commands.cfg and plugins are present.
8.1 Check if commands are defined
grep -RIn "define command" /usr/local/nagios/etc/objects/commands.cfg | egrep "check_(ping|ssh|tcp)"

Verify plugin path
ls -l /usr/lib/nagios/plugins/check_ping /usr/lib/nagios/plugins/check_ssh /usr/lib/nagios/plugins/check_tcp
# or if built from source:
ls -l /usr/local/nagios/libexec/check_*
<img width="1666" height="802" alt="image" src="https://github.com/user-attachments/assets/75388ebe-960e-46ec-9228-841d96039372" /> this is IP adrress for a demo project there are not public . 

I have my robust datacenter, I just want you to show you how can i add , you can do yourself and that is note a problem at all. You have help with Ai,google ,forums . ext ..

# Author # 
Slobodan Milojevic  


systemctl status nagios | sed -n 's/.*ExecStart=//p'

Inspect how objects were actually loaded (post-start):
