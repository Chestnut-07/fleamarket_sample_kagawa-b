# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :sold_items, foreign_key: "seller_id", class_name: "Items"
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Items"
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|trading_status|integer|null: false|
|item_image|string|null: false|
|name|string|null: false|
|introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|shipping_fee_payer_id|references|null: false, foreign_key: true|
|shipping_area_id|references|null: false, foreign_key: true|
|preparation_day_id|references|null: false, foreign_key: true|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_tp :seller, class_name: "User"
- belongs_tp :buyer, class_name: "User"
- belongs_to :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :preparation_day

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false, add_index|

### Association
- has_many :products
- has_ancestry

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## Destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|string|-|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


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
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment|text|null: false|
|-|timestamps|null: false|

### Association
- belongs_to :user
- belongs_to :product

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
url|string|null: false|

### Association
- belongs_to :product