# 在安卓设备上使用ncatbot

ncatbot -- 一个基于 [Ncatbot](https://github.com/liyihao1110/Ncatbot) 框架的多功能机器人，集成了多个实用插件
ncatbotPlugin -- 来源于[ncatbotPlugin](https://github.com/FunEnn/ncatbotPlugin)
[查看详细文档](./ncatbotPlugin/README.md)

**使用方式**
- 下载Reseales里的压缩包
- 将该压缩包内的所有文件移动至内部存储目录下（/sdcard/）(必须移动到内部存储根目录下，千万不要改ncatbotPlugin文件夹的名字)
- (需要更改机器人菜单描述的打开inbot.sh更改，QQ号执行时会询问)
- 安装termux(融卡了的话一定要把应用移动到内部存储空间里)
- 打开
- 先执行`termux-setup-storage`授予termux存储权限
- 再执行`termux-change-repo`换源（建议换成清华源：Single mirror->mirrors.tuna.tsinghua.edu.cn）
- 最后执行`bash /sdcard/inbot.sh`（一定要保持网络连接通畅，否则容易下载失败）
- （下次再想启动ncatbot的话，在termux里输入`run`回车就行）

## 🙏 鸣谢

- [NcatBot](https://github.com/liyihao1110/NcatBot) - 机器人框架
- [JMComic-Crawler-Python](https://github.com/hect0x7/JMComic-Crawler-Python) - 禁漫爬虫
- [Lolicon API](https://docs.api.lolicon.app/) - 二次元图片API 
- [ncatbotPlugin](https://github.com/FunEnn/ncatbotPlugin) - ncatbotPlugin提供
