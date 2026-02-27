read -p "机器人的QQ号" botid
read -p "管理者的QQ号" rootid
yes '' | pkg update
yes '' | pkg upgrade
yes '' | pkg install proot-distro
proot-distro install ubuntu
cp -r /sdcard/ncatbotPlugin /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/
chmod -R 755 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/ncatbotPlugin
echo "alias run='proot-distro login ubuntu -- bash -c \"bash run.sh\"'" >> .bashrc
source .bashrc


#在这里更改main.py的内容（bot菜单）
cat << EOF > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/ncatbotPlugin/main.py
from ncatbot.core import BotClient, GroupMessage, PrivateMessage, NoticeEvent, MessageArray
from ncatbot.utils import get_log, config

bot = BotClient()
_log = get_log()
ability = """我的能力：

📚 禁漫本子下载 (JmComicPlugin)
• /jm <本子ID> - 下载禁漫本子并发送PDF
• /jmzip <本子ID> - 下载禁漫本子并发送ZIP(失败回退PDF)
• 例如: /jm 114514

🎨 二次元图片 (Lolicon)
• /loli [数量] [标签] - 发送随机二次元图片
• /r18 [数量] [标签] - 发送R18图片(仅限私聊)
• 例如: /loli 3 萝莉、/loli 白丝
"""
@bot.on_group_message()
async def on_group_message(msg: GroupMessage):
    if msg.raw_message == "/菜单":
        menu_text = ability
        await msg.reply(text=menu_text)
@bot.on_private_message()
async def on_private_message(msg: PrivateMessage):
    if msg.raw_message == "/菜单":
        menu_text = ability
        await msg.reply(text=menu_text)
@bot.on_notice()
async def on_notice(event: NoticeEvent):
    notice = event.sub_type
    if notice == 'poke' and event.is_group_event(): # 群聊戳一戳消息            
        if event.target_id == event.self_id: 
            await bot.api.send_poke(user_id=event.user_id, group_id=event.group_id)
if __name__ == "__main__":
    bot.run(bt_uin="$botid", root = "$rootid") # 这里写 Bot 的 QQ 号
EOF
#这里也能更改QQ号，把bot用的QQ号（$botid）、控制bot的QQ号（$rootid）改成你自己的


cat << EOF > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/inbot.sh
yes '' | apt update
yes '' | apt upgrade
yes '' | apt install python3 python3-pip python3-venv
yes '' | apt-get update
yes '' | apt-get upgrade
yes '' | apt-get install curl sudo
python3 -m venv .venv
source .venv/bin/activate
cd ncatbotPlugin
pip install -r requirements.txt
bash install-cli.sh
python3 main.py --listen
EOF


cat << EOF > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/run.sh
pkill -f 'Napcat'
source .venv/bin/activate
cd ncatbotPlugin
python3 main.py --listen
EOF


chmod 755 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/ncatbotPlugin/main.py
chmod 755 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/inbot.sh
chmod 755 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/run.sh
proot-distro login ubuntu -- bash -c 'bash inbot.sh'