# Discord 上传机器人

这是一个简单的 Discord 机器人，用于将 Discord 频道中收到的图片上传到 Cloudflare Image 服务，并在 Discord 频道中返回上传结果。

## 功能

- 当在 Discord 频道中收到一张图片时，机器人将会将该图片上传到 Cloudflare Image 服务。
- 如果上传成功，机器人将在 Discord 频道中返回图片的 Cloudflare Image 服务地址。
- 如果上传失败，机器人将在 Discord 频道中返回一个错误消息，并包含了详细的失败信息。

## 使用方法

1. 在 Discord 开发者门户中创建一个新的应用程序，并将其添加到你的 Discord 服务器中。
2. 获取你的 Discord 机器人令牌（Bot Token）。
3. 登录到 Cloudflare 并获取你的 API 令牌，确保该 Token 具有上传图片到 Cloudflare Image 服务所需的权限。
4. 将你的 Discord 机器人令牌和 Cloudflare Image 服务的相关信息填写到代码中。
5. 在终端中运行机器人代码：`python bot.py`。
6. 在 Discord 中，看到你的机器人上线后，尝试在频道中发送一张图片。机器人应该会将图片上传到 Cloudflare Image 服务，并在 Discord 频道中返回结果。

## 注意事项

- 确保你的 Discord 机器人具有足够的权限来读取和发送消息，并且在 Discord 服务器中正确设置了角色和权限。
- 确保你的 Cloudflare API Token 具有足够的权限来上传图片到 Cloudflare Image 服务。
- 在生产环境中，你可能需要使用一个长时间运行的进程管理工具（如 `screen` 或 `tmux`）来确保你的机器人持续运行，并且考虑将机器人部署到一个稳定的服务器上。
