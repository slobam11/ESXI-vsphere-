define host{
name generic-host
notifications_enabled 1
event_handler_enabled 1
flap_detection_enabled 1
process_perf_data 1
retain_status_information 1
retain_nonstatus_information 1
max_check_attempts 10
check_interval 5
retry_interval 1
check_period 24x7
contact_groups admins
notification_interval 30
notification_period 24x7
notification_options d,u,r
register 0
}