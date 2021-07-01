## 🖥　① 技術仕様（ローカル環境）

- **Ruby** Version 3.0.1
- **Ruby on Rails** Version 6.1.3.2
- **MySQL** Version 8.0.25
- **Docker** Version 20.10.7

## 🌏　② 技術仕様（本番環境）

- **Elastic Compute Cloud**
  - Region：アジア・パシフィック（ムンバイ）
  - インスタンスタイプ：t3a.nano
  - 予算：＄0.0031 × 720 時間 = ＄2.232 ≒ ￥247.29

- **Relational Database Service**
  - Region：米国西部（オレゴン）
  - インスタンスタイプ：db.t2.micro
    - 無料利用期間後は、db.t3.micro に変更する予定です。
  - 予算：＄0.017 × 720 時間 = ＄12.24 ≒ ￥1356.13
    - db.t3.micro の料金で、見積もりしています。 

- **Simple Storage Service**
- **Cloud Front**
- **Virtual Private Cloud**

## ⚙️　③ Dockerfile 備忘録

```Dockerfile
FROM ruby:3.0.1

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update && apt-get install -y vim nodejs \
    && npm install --global yarn && gem install rails -v '6.1.3.2'

WORKDIR /var/www/'アプリケーション名'

ADD . /
RUN bundle install
```

> ###### 🔗　参考資料
> [Docker を Compose しないで、ローカル環境を構築する。| Zenn](https://zenn.dev/hirano_tech/articles/68dbdc185dfb61)

## 🗄　④ データベース設計

### ● 都道府県データを管理するテーブル

|     Field    |       Type        | Null | Key | Default |     Extra      |
|:------------:|:-----------------:|:----:|:---:|:-------:|:--------------:|
|      id      | TINYINT UNSIGNED  |  NO  | PRI |  NULL   | auto_increment |
|     name     |   VARCHAR(255)    |  NO  |     |  NULL   |                |

```SQL
$mysql> CREATE TABLE IF NOT EXISTS 'テーブル名'(
  id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
) CHARACTER SET utf8mb4;
```

> ###### 🔗　参考資料
> [シーディング ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_Prefecture.rb)

### ● ジーユー 国内店舗一覧データを管理するテーブル

|     Field     |       Type        | Null | Key | Default |     Extra      |
|:-------------:|:-----------------:|:----:|:---:|:-------:|:--------------:|
|      id       | TINYINT UNSIGNED  |  NO  | PRI |  NULL   | auto_increment |
|     name      |   VARCHAR(255)    |  NO  |     |  NULL   |                |
| prefecture_id | TINYINT UNSIGNED  |  NO  | MUL |  NULL   |                |
|    address    |   VARCHAR(255)    |  NO  |     |  NULL   |                |
|     phone     |   VARCHAR(255)    |  NO  |     |  NULL   |                |

```SQL
$mysql> CREATE TABLE IF NOT EXISTS 'テーブル名'(
  id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  prefecture_id TINYINT UNSIGNED NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,

  FOREIGN KEY (prefecture_id) REFERENCES prefectures(id)
) CHARACTER SET utf8mb4;
```

> ###### 🔗　参考資料
> [シーディング ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_GU-Store.rb)

### ● ジーユー おしゃリスタ一覧データを管理するテーブル

|  Field   |       Type        | Null | Key | Default |     Extra      |
|:--------:|:-----------------:|:----:|:---:|:-------:|:--------------:|
|    id    | SMALLINT UNSIGNED |  NO  | PRI |  NULL   | auto_increment |
|   name   |   VARCHAR(255)    |  NO  |     |  NULL   |                |
|  gender  | TINYINT UNSIGNED  |  NO  |     |    1    |                |
|  height  | TINYINT UNSIGNED  |  NO  |     |  NULL   |                |
| staff_id |   VARCHAR(255)    |  NO  | UNI |  NULL   |                |
| store_id | SMALLINT UNSIGNED |  NO  | MUL |  NULL   |                |
| official | TINYINT UNSIGNED  |  NO  |     |    0    |                |

```SQL
$mysql> CREATE TABLE IF NOT EXISTS 'テーブル名'(
  id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  gender TINYINT UNSIGNED NOT NULL DEFAULT TRUE,
  height TINYINT UNSIGNED NOT NULL,
  staff_id VARCHAR(255) NOT NULL UNIQUE,
  store_id SMALLINT UNSIGNED NOT NULL,
  official TINYINT UNSIGNED NOT NULL DEFAULT FALSE,

  FOREIGN KEY (store_id) REFERENCES gu_stores(id)
) CHARACTER SET utf8mb4;
```

> ###### 🔗　参考資料
> [シーディング ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_GU-Osyalista.rb)
