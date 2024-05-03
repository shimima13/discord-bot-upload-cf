import discord
import requests
import os

# 获取 Discord Bot Token 和 Cloudflare 相关配置
BOT_TOKEN = os.environ.get('DISCORD_BOT_TOKEN')
CLOUDFLARE_API_TOKEN = os.environ.get('CLOUDFLARE_API_TOKEN')
CLOUDFLARE_ZONE_ID = os.environ.get('CLOUDFLARE_ZONE_ID')

# 初始化 Discord 客户端
client = discord.Client(intents=discord.Intents.default())

# Cloudflare Image 服务的 API 地址
CLOUDFLARE_IMAGE_API_URL = f"https://api.cloudflare.com/client/v4/zones/{CLOUDFLARE_ZONE_ID}/images/v1"

# 上传图片到 Cloudflare Image 服务
def upload_to_cloudflare(image_url):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {CLOUDFLARE_API_TOKEN}"
    }
    data = {
        "url": image_url
    }
    response = requests.post(CLOUDFLARE_IMAGE_API_URL, json=data, headers=headers)
    return response.json()

# 当机器人准备就绪时
@client.event
async def on_ready():
    print(f"We have logged in as {client.user}")

# 当机器人收到消息时
@client.event
async def on_message(message):
    # 如果消息是一个图片
    if message.attachments:
        image_url = message.attachments[0].url
        # 上传图片到 Cloudflare Image 服务
        cloudflare_image_response = upload_to_cloudflare(image_url)
        if "success" in cloudflare_image_response and cloudflare_image_response["success"]:
            await message.channel.send(f"上传成功！图片地址：{cloudflare_image_response['result']['url']}")
        else:
            await message.channel.send("上传失败，请稍后重试。详细信息：" + json.dumps(cloudflare_image_response))

# 运行机器人
client.run(BOT_TOKEN)
