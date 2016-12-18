sc config SharedAccess start= auto
netsh firewall set opmode ENABLE ENABLE
netsh firewall set logging c:\log.txt 8192 ENABLE
sc config TlntSvr start= demand
netsh firewall set icmpsetting 8 ENABLE
netsh firewall set portopening TCP 23 Telnet ENABLE ALL
net start telnet