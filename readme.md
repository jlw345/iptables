手里几台VPS配置iptables太繁琐，看到了朱哥的LNMP脚本里有一个自动配置iptables防火墙的脚本，借来改了一下，给需要的人用；
只提供常用端口的设置，如果你有特殊需求只需自行添加或减少相应的端口即可；


使用方法：
wget -N --no-check-certificate https://raw.githubusercontent.com/jlw345/iptables/master/iptables.sh && chmod +x iptables.sh && bash iptables.sh

使用说明
进入下载脚本的目录并运行脚本：

./ban_iptables.sh
然后选择你要执行的选项即可。

 iptables防火墙 封禁管理脚本 [vX.X.X]
 -- Toyo | doub.io/shell-jc2 --
 
 0. 查看 当前封禁列表
————————————
 1. 封禁 BT、PT
 2. 封禁 SPAM(垃圾邮件)
 3. 封禁 BT、PT+SPAM
 4. 封禁 自定义 端口
 5. 封禁 自定义关键词
————————————
 6. 解封 BT、PT
 7. 解封 SPAM(垃圾邮件)
 8. 解封 BT、PT+SPAM
 9. 解封 自定义 端口
10. 解封 自定义关键词
11. 解封 所有  关键词
————————————
12. 升级脚本
 
请输入数字 [0-11]:


其他操作
为了方便，我也做了几个快捷的命令，不需要进入菜单去选择对应的选项，直接就能封禁/解封。
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
