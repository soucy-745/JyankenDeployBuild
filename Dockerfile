FROM ubuntu:22.04

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libx11-6 \
    libxcursor1 \
    libxinerama1 \
    libxi6 \
    libxrandr2 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /app

# Godotサーバーバイナリをコピー
COPY builds/linux/server.x86_64 /app/server

# 実行権限を付与
RUN chmod +x /app/server

# ポート設定（Render.comが環境変数PORTを提供）
ENV PORT=9999
EXPOSE ${PORT}

# サーバー起動
CMD ["/app/server", "--headless"]