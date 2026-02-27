将该压缩包内的所有文件移动至内部存储目录下（/sdcard/）(必须移动到内部存储根目录下，千万不要改ncatbotPlugin文件夹的名字)
(需要更改机器人菜单描述的打开inbot.sh更改，QQ号执行时会询问)
安装termux(融卡了的话一定要把应用移动到内部存储空间里)
打开
先执行termux-setup-storage授予termux存储权限
再执行termux-change-repo换源（建议换成清华源：Single mirror->mirrors.tuna.tsinghua.edu.cn）
最后执行bash /sdcard/inbot.sh（一定要保持网络连接通畅，否则容易下载失败）
（下次再想启动ncatbot的话，在termux里输入run回车就行）

