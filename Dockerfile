FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY environment.yml .
COPY bot.py .

# 创建 conda 环境并安装依赖
RUN conda env create -f environment.yml

SHELL [ "conda", "run", "-n", "discord_upload_bot_env", "/bin/bash", "-c"]

RUN echo "Make sure discord is installed:"

RUN python -c "import discord"

ENTRYPOINT [ "conda", "run", "--no-capture-output", "-n", "discord_upload_bot_env", "python", "bot.py"]
