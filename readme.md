使用方法：

wget -N --no-check-certificate https://raw.githubusercontent.com/jlw345/iptables/master/ban_iptables.sh && chmod +x ban_iptables.sh && bash ban_iptables.sh

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
