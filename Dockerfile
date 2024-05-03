FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY . /app

# 创建 conda 环境并安装依赖
RUN conda env create -f environment.yml

# 激活 conda 环境
SHELL ["conda", "run", "-n", "discord_upload_bot_env", "/bin/bash", "-c"]

# 启动 bot.py
CMD ["python", "bot.py"]
