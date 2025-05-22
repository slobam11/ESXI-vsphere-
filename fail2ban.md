Setting Up Fail2Ban (What I Did)
I started by updating my package list and installing Fail2Ban:
sudo apt update
sudo apt install fail2ban -y

After the installation, I checked the service status to make sure Fail2Ban was running:
sudo systemctl status fail2ban

Then, I created a local configuration file so I wouldn’t edit the default one directly:
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

In the jail.local file, I enabled the SSH jail and set the basic options:
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
maxretry = 5
bantime = 1h
findtime = 10m

After editing the file, I restarted the Fail2Ban service to apply the changes:
sudo systemctl restart fail2ban

Then, I enabled it to start automatically on boot:
sudo systemctl enable fail2ban

To verify that the SSH jail was working, I used the following command:
sudo fail2ban-client status sshd

Everything was working fine — bans were applied when I tested multiple failed SSH login attempts.

