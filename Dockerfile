FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY environment.yml .

# 创建 conda 环境并安装依赖
RUN conda env create -f environment.yml

RUN echo source activate discord_upload_bot_env > ~/.bashrc
ENV PATH /opt/conda/envs/discord_upload_bot_env/bin:$PATH

COPY . .

# 执行 bot.py
CMD ["python", "bot.py"]
