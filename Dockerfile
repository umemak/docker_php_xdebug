# PHPの公式イメージをベースにする
FROM php:apache-bullseye

# Apacheをインストール
# RUN apt-get update && apt-get install -y \
#     apache2 \
#     && rm -rf /var/lib/apt/lists/*

# Xdebugのインストール
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Apacheの有効化
RUN a2enmod rewrite

# Apacheの再起動
RUN service apache2 restart

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    vim \
    && rm -rf /var/lib/apt/lists/*

# コンテナ内のディレクトリを作成し、作業ディレクトリに設定する
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# コンテナ内のPHP設定ファイルをコピーする
COPY php.ini /usr/local/etc/php/conf.d/

# コンテナのポートを開放する（必要に応じて変更）
EXPOSE 80

# コンテナの起動時に実行されるコマンド
CMD ["apache2-foreground"]
# CMD ["apache2ctl", "-D", "FOREGROUND"]