# Rubyのバージョンを3.1.2に設定
FROM ruby:3.1.2-alpine

# 必要なパッケージをインストール
# RUN apk update && \
#     apk add --no-cache build-base \
#     postgresql-dev \
#     nodejs \
#     yarn

# 必要なパッケージをインストール(エラーなったのでコメントアウト)
RUN apk update && apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    tzdata \
    yarn \
    git
    
# 作業ディレクトリの設定
WORKDIR /abboo

# GemfileおよびGemfile.lockをコピー
COPY Gemfile /abboo//Gemfile
COPY Gemfile.lock /abboo//Gemfile.lock

# 必要なGemsをインストール
RUN bundle install

# アプリケーションのコードをコピー
COPY . /abboo/

#entrypointの設定
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s", "-p", "3001", "-b", "0.0.0.0"]
