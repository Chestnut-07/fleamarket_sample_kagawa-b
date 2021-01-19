# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|encrypted_password|string|null: false|
|email|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
- has_many :items, dependent: :destroy
- has_one :destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: foreign_key: { to_table: :users }|
|trading_status|integer|null: false|
|introduction|text|null: false|
|category|references|null: false, foreign_key: true|
|item_condition|integer|null: false|
|shipping_fee_payer|integer|null: false|
|prefecture|integer|null: false|
|preparation_day|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_one :item_image
- belongs_to :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index|

### Association
- has_many :items
- has_ancestry

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_token|string|null: false|
|card_token|string|null: false|

### Association
- belongs_to :user

## Destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|string|-|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## 以降は今後追加実装予定の項目である
### Usersテーブル
#### SNSでのログイン認証
|Column|Type|Options|
|------|----|-------|
|uid|string|unique: true|
|provider|string|-|
|username|string|-|

### Association
#### Bookmark機能
- has_many :bookmarks, dependent: :destroy
#### コメント機能
- has_many :comments, dependent: :destroy

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_image_id|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :brand
#### 商品出品機能Lv2（画像複数枚投稿）
- has_many :item_images, dependent: :destroy
#### Bookmark機能
- has_many :bookmarks, dependent: :destroy
#### コメント機能
- has_many :comments, dependent: :destroy

## Bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|
|-|timestamps|null: false|

### Association
- belongs_to :user
- belongs_to :item

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image2_url|string|-|
|image3_url|string|-|
|image4_url|string|-|
|image5_url|string|-|