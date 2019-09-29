手里几台VPS配置iptables太繁琐，看到了朱哥的LNMP脚本里有一个自动配置iptables防火墙的脚本，借来改了一下，给需要的人用；
只提供常用端口的设置，如果你有特殊需求只需自行添加或减少相应的端口即可；


使用方法：
wget -N --no-check-certificate https://raw.githubusercontent.com/jlw345/iptables/master/iptables.sh && chmod +x iptables.sh && bash iptables.sh


./ban_iptables.sh banbt
# 封禁 BT、PT
 
./ban_iptables.sh banspam
# 封禁 SPAM（垃圾邮件）
 
./ban_iptables.sh banall
# 封禁 BT、PT+SPAM
 
./ban_iptables.sh unbanbt
# 解封 BT、PT
 
./ban_iptables.sh unbanspam
# 解封 SPAM（垃圾邮件）
 
./ban_iptables.sh unbanall
# 解封 BT、PT+SPAM
