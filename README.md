## 💭　① この Web サービスをツクろうと考えた背景

<img src='https://camo.qiitausercontent.com/f3c03bbbbf963d18cfbf8248b121e3f85d2cf15a/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3630333237392f35353730346361332d396366342d383466362d623138362d3539356433303232323733632e706e67' alt='【J-WAVE】 GROOVE LINE' title='プラットフォーム別の影響領域' alt='【画像】 プラットフォーム別の影響領域' width='40%' />

  1. 洋服を購入するきっかけが、これまではテレビ，雑誌 などのメディアに掲載されたものを見て、店舗にご来店されることが主流でした。
  2. 現在では 容姿の整った有名人ではなく、Instagram，YouTube などの一般人の着こなしを見て、店舗にご来店されるお客様がだんだんと増えてくるようになりました。
  3. この流れを感じとり、[GU（ジーユー）](https://www.gu-global.com/jp/ja/styling/?gender=women) や [UNITED ARROWS](https://store.united-arrows.co.jp/shop/ua/styling) は、店舗で働く販売員の着こなしを SNS のように公開することでお客様がご自身の年齢・容姿に近い人の着こなしを参考にしていただけるような取り組みをおこなっています。
  4. この取り組みにより、販売員の中にはお客様から直接 接客して欲しいという問い合わせをいただくなど、新規顧客の獲得に成功しています。
  5. 私は、これから廃れゆくと言われている '販売員' の新たな活躍の場であると感じ、開発しています。

> ###### 🔗　参考資料
> > [“売りにつながる” ソーシャルメディアとインフルエンサーの実態調査 | 株式会社トライバルメディアハウス](https://www.tribalmedia.co.jp/news/13629)

---

## 🖥　② 技術仕様（ローカル環境）

- **Ruby** Version 3.0.1
- **Ruby on Rails** Version 6.1.3.2
- **MySQL** Version 8.0.25
- **Docker** Version 20.10.7

##### ❔ Q＆A：なぜ、開発環境に Docker を使っているの？

  - Docker は、Linux 環境（及び、CUI コマンド）に慣れるためです。

## 🌏　③ 技術仕様（本番環境）

- **Elastic Compute Cloud**
  - Region：アジア・パシフィック（大阪）
  - インスタンスタイプ：t2.micro（無料利用枠）
  - URL：http://13.208.151.178
    - スマートフォンからの閲覧を推奨します。
    - 事前に、ジーユー（[iOS](https://apps.apple.com/us/app/%E3%82%B8%E3%83%BC%E3%83%A6%E3%83%BC/id504542019)，[Android](https://play.google.com/store/apps/details?id=com.osharemaker)）ネイティブアプリケーションのインストールをお勧めします。

- **Relational Database Service**
  - Region：米国西部（オレゴン）
  - インスタンスタイプ：db.t2.micro（無料利用枠）

- **Simple Storage Service**
- **Cloud Front**
- **Virtual Private Cloud**

##### ❔ Q＆A：なぜ、別リージョンに配置しているのですか？

  - 基本的に利用料金 最安値構成にしています。  
[別アプリケーション | GitHub](https://github.com/Hirano-Tech/Piston2438_DJ-MIX) にて、EC2 インスタンスを個人利用しているため、RDS インスタンスは現在 無料利用枠ですが、費用面で最安値となる国外を採択しています。

## ⚙️　④ Dockerfile 備忘録

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
> > ● [Docker を Compose しないで、ローカル環境を構築する。| Zenn](https://zenn.dev/hirano_tech/articles/68dbdc185dfb61)

## 🗄　⑤ データベース設計

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
> > ● [都道府県データ Seeds ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_Prefecture.rb)

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
> > ● [ジーユー 国内店舗一覧データ Seeds ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_GU-Store.rb)

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

- `staff_id` カラムは、各おしゃリスタページの URL（`https://www.gu-global.com/jp/ja/styling/staff/`）に割り振られている値を格納しているため、外部キーではなく **一意性** です。

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
> > ● [おしゃリスタ一覧データ Seeds ファイル](https://github.com/Hirano-Tech/Seeding-Vault/blob/master/Ruby_GU-Osyalista.rb)

## 🔍　⑥ おしゃリスタ検索 処理の流れ

```Ruby
def create
    if search_params[:ladies].blank? && search_params[:mens].blank?
      # もし、性別欄のチェックボックスが男女ともにチェックが外されていた場合は、検索フォームに戻す。
      redirect_to staff_searches_path
    elsif search_params[:ladies] == 'true' && search_params[:mens] == 'true'
      @osyalista = Osyalista.readonly.order(gender: :DESC, height: :ASC).includes(gu_store: :prefecture)
        # 取得した検索結果から上書き保存させることはないので、.readonly（読み取り専用）として読み込む。
        # おしゃリスタの情報から、所属店舗も読み込む必要があるために、.includes で N+1 になることを避ける。
    elsif search_params[:ladies] == 'true'
      @osyalista = Osyalista.readonly.where(gender: true).order(height: :ASC).includes(gu_store: :prefecture)
    elsif search_params[:mens] == 'true'
      @osyalista = Osyalista.readonly.where(gender: false).order(height: :ASC).includes(gu_store: :prefecture)
    end

    unless search_params[:store].blank?
      # もし、検索フォームで店舗を指定していた場合は、次の処理を実行する。
      @osyalista = @osyalista.select { |osyalista| osyalista.store_id == search_params[:store].to_i }
        # 事前に、取得したレコードの配列の中の 'store_id' カラムがフォームで指定した店舗と同じものを抽出する。
    end

    render action: :index, osyalista: @osyalista
  end

  private
  def search_params
    params.permit(:ladies, :mens, :store)
      # 受信したパラメータから必要な項目のみ取得する。
  end
```

---

## 🔜　⑦ これから、実装予定の機能

1. 期限付き Cookie を使用した気になるおしゃリスタの一時保存機能  
● 誰でも気軽に利用してもらいたいため、できる限り 認証機能は使わずにブックマーク機能を実装する。

2. Instagram グラフ API を使用し、GU公認スタッフインフルエンサーアカウントの情報取得  

- GU公認スタッフインフルエンサー 備忘録
  - [Moena | パワーモール前橋みなみ店](https://www.gu-global.com/jp/ja/styling/staff/31f2bd7bd00f450491b9e9ea309a185c)
  - [Haru | 郡山八山田店](https://www.gu-global.com/jp/ja/styling/staff/b3cfe95deda8a8733e81a698634ed0d3)
  - [Rikako | 銀座店](https://www.gu-global.com/jp/ja/styling/staff/cfa973461ff2efe679613a4296f8d492)
  - [mika | 東金店](https://www.gu-global.com/jp/ja/styling/staff/594d39914b575d9b8d699b0f17992797)
  - [kozue | 富士店](https://www.gu-global.com/jp/ja/styling/staff/a3852599700d6ddce64d8a845ee8e729) 
  - [Ryoko | 心斎橋店](https://www.gu-global.com/jp/ja/styling/staff/110d0136606abcd2fe3ed270ef3802f8)
  - [aki | イオンモール堺北花田店](https://www.gu-global.com/jp/ja/styling/staff/3ad9bbef4e203cca178dcc73740247eb)
  - [yuko | 西宮浜店](https://www.gu-global.com/jp/ja/styling/staff/2634826eb62569f8b708a9244d140e76)
  - [Kai | イオンモール新居浜店](https://www.gu-global.com/jp/ja/styling/staff/e166b68d21bdcc8a96ea9d57abe07bc0)
  - [Satomi | ヨドバシ博多店](https://www.gu-global.com/jp/ja/styling/staff/ce22f6d46f1dad725beece0b2e0bea64)

---

## 👨🏻‍💻 ⑧ 開発者プロフィール

- Wantedly：[Wantedly](https://www.wantedly.com/id/Hirano_Tech)（要 ログイン）
- GitHub：[GitHub](https://github.com/Hirano-Tech)
  - [現在 個人開発している別のアプリケーション | GitHub](https://github.com/Hirano-Tech/Piston2438_DJ-MIX)
- Twitter：[@Hirano_Tech](https://twitter.com/Hirano_Tech)
- Zenn：[Zenn](https://zenn.dev/hirano_tech)
