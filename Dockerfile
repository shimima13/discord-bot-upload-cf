FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY . /app

# 创建 conda 环境并安装依赖
RUN conda env create -f environment.yml && \
    echo "source activate discord_upload_bot_env" > ~/.bashrc && \
    /bin/bash -c "source activate discord_upload_bot_env"

# 启动 bot.py
CMD ["python", "bot.py"]
