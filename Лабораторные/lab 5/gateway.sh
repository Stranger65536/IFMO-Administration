iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -t nat -X
iptables -t mangle -X
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -p tcp --dport ssh -j ACCEPT
iptables -A PREROUTING -t nat -i eth2 -p tcp --dport 2222 -j DNAT --to 10.0.0.2:22
iptables -A FORWARD -p tcp -d 192.168.1.152 --dport 22 -j ACCEPT
iptables -A OUTPUT -p udp -o eth3 --dport 53 -d 192.168.248.21 -j ACCEPT
iptables -A INPUT -p udp -i eth3 --sport 53 -d 192.168.248.21 -j ACCEPT
iptables -A INPUT -i eth3 -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p tcp --dport 143 -d 194.85.160.50 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 143 -d 194.85.160.50 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -d 194.85.160.55 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 8080 -d 194.85.160.55 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 -d 194.85.160.60 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 21 -d 194.85.160.60 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth2 -d 10.10.11.173 -j DROP
iptables -A INPUT -i eth3 -d 10.10.11.173 -j DROP
iptables -A OUTPUT -d 10.10.11.173 -j DROP
iptables -A INPUT -i eth2 -p tcp --dport 22 -d 83.0.0.0/16 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth2 -p tcp --sport 22 -d 83.0.0.0/16 -m state --state ESTABLISHED -j ACCEPT
read
