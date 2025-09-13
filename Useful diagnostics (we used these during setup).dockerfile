# Show file exists & perms
ls -l /usr/local/nagios/etc/objects/esxi.cfg


# Validate configuration
nagios4 -v /usr/local/nagios/etc/nagios.cfg


# Service status / ExecStart (to see -d <path>)
systemctl status nagios | sed -n 's/.*ExecStart=//p'


# Restart after successful validation
sudo systemctl restart nagios


# Find duplicate host definitions
grep -RIn "host_name\s\+esxi0[1-3]" /usr/local/nagios/etc/objects


# Confirm commands exist
grep -RIn "define command" /usr/local/nagios/etc/objects/commands.cfg | egrep "check_(ping|ssh|tcp)"


# Convert Windows CRLF -> Unix LF if needed
sudo dos2unix /usr/local/nagios/etc/objects/esxi.cfg


# Fix ownership & perms
sudo chown nagios:nagios /usr/local/nagios/etc/objects/esxi.cfg
sudo chmod 644 /usr/local/nagios/etc/objects/esxi.cfg


# Verify loaded objects after start
grep -A20 "host esxi01" /usr/local/nagios/var/objects.cache