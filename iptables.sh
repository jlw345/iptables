#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
function support_distro(){
if [ -z "`egrep -i "centos" /etc/issue`" ];then
echo "Sorry,iptables script only support centos system now."
exit 1
fi
}
support_distro
echo "============================iptables configure============================================"
# Only support CentOS system
# 获取SSH端口
if grep "^Port" /etc/ssh/sshd_config>/dev/null;then
sshdport=`grep "^Port" /etc/ssh/sshd_config | sed "s/Port\s//g" `
else
sshdport=22
fi
# 获取DNS服务器IP
if [ -s /etc/resolv.conf ];then
nameserver1=`cat /etc/resolv.conf |grep www.usus.ccnameserver |awk 'NR==1{print $2 }'`
nameserver2=`cat /etc/resolv.conf |grep nameserver |awk 'NR==2{print $2 }'`
fi
IPT="/sbin/iptables"
# 删除已有规则
$IPT --delete-chain
$IPT --flush
# 禁止进,允许出,允许回环网卡
$IPT -P INPUT DROP   
$IPT -P FORWARD DROP 
$IPT -P OUTPUT ACCEPT
$IPT -A INPUT -i lo -j ACCEPT
# 允许已建立的或相关连接的通行
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# 限制80端口单个IP的最大连接数为10
$IPT -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 10 -j DROP
# 允许80(HTTP)/873(RSYNC)/443(HTTPS)/20,21(FTPwww.e78.com)/25(SMTP)端口的连接
$IPT -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
$IPT -A INPUT -p tcp -m tcp --dport 873 -j ACCEPT
$IPT -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
$IPT -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
$IPT -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
$IPT -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
# 允许SSH端口的连接,脚本自动侦测目前的SSH端口,否则默认为22端口
$IPT -A INPUT -p tcp -m tcp --dport $sshdport -j ACCEPT
# 允许ping
$IPT -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT 
$IPT -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
# 允许DNS
[ ! -z "$nameserver1" ] && $IPT -A OUTPUT -p udp -m udp -d $nameserver1 --dport 53 -j ACCEPT
[ ! -z "$nameserver2" ] && $IPT -A OUTPUT -p udp -m udp -d $nameserver2 --dport 53 -j ACCEPT
# 保存规则并重启IPTABLES
service iptables save
service iptables restart
echo "============================iptables configure completed============================================"
