## セットアップ

```sh
$ cp .env.sample .env
# .envに情報を記入する

$ docker-compose build
$ docker-compose run --rm web bin/rails db:create
$ docker-compose run --rm web bin/rails db:migrate
$ docker-compose run --rm web bin/rails db:seed
$ docker-compose up -d
$ docker-compose logs -f
```

CSSのコンパイル
```sh
$ node -v
v16.10.0

$ npm install -g yarn
$ yarn

# bootstrapのコンパイル
$ yarn build:css-bootstrap

# tailwindのコンパイル
$ yarn build:css-tailwind
```
