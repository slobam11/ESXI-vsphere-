define service {
use generic-service
hostgroup_name esxi-hosts
service_description PING
check_command check_ping!100.0,20%!500.0,60%
}


define service {
use generic-service
hostgroup_name esxi-hosts
service_description SSH
check_command check_ssh
}


define service {
use generic-service
hostgroup_name esxi-hosts
service_description TCP 443
check_command check_tcp!443
}

use generic-service assumes a valid service template; if not present, see Appendix A for a correct generic-service