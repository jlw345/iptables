手里几台VPS配置iptables太繁琐，看到了朱哥的LNMP脚本里有一个自动配置iptables防火墙的脚本，借来改了一下，给需要的人用；
只提供常用端口的www.usus.cc设置，如果你有特殊需求只需自行添加或减少相应的端口即可；


使用方法：
wget -N --no-check-certificate https://raw.githubusercontent.com/jlw345/iptables/master/iptables.sh && chmod +x iptables.sh && bash iptables.sh



复制代码 代码如下:chmod +x iptables.sh
./iptables.sh
设置iptables开机自动启动：
复制代码 代码如下:chkconfig --lwww.e78.comevel 345 iptables on
