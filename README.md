# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null:false, unique: true, index:true|
| password | string | null: false |
| frist name｜string｜null:false｜
| last name｜string｜null:false|
| family_name_kana｜string|null:false|
| first_name_kana｜string|null:false|
| dare_of_birth｜date|null:false|
<!-- ｜comments tableID｜references|
｜receiver's address tableID｜references|
｜credit_cards tableID｜references| -->

### Association

- has_many :comments
has_many :items,
has_one :receiver's address



## items table 

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| img   | references | null: false, foreign_key: true |
| name   | references | null: false, foreign_key: true | |category|string | null: false |
|introduction|text|null: false|
|details|string | null: false |
| condition|string | null: false |
| prefecture_code| string | null: false |
| preparation_day| string | null: false |
| Price| string | null: false |
| ship_cost | string | null: false |
| ship_date| string | null: false |

｜comments tableID|


### Association

- has_many :comments 
belongs_to :seller, class_name: "User"
belongs_to :buyer, class_name: "User"


## receiver's address table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code| integer(7)|null:false|
| prefecture_code    | integer | null: false|
| city    | string | null: false|
| house_number｜string|null:false|
| building_name|string|null:false|
| phone_number|integer|null:false|
| user|references	|null: false, foreign_key: true|
｜users tableID|references	|null: false, foreign_key: true|




### Association

- belongs_to :user

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment|	text	|null: false|
|user	|references	|null: false, foreign_key: true|
|item	|references	|null: false, foreign_key: true|
|created_at	|timestamp	|null: false|


### Association

belongs_to :user
belongs_to :item

<!-- ## credit_cards table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|card_number|	integer	|null:false, unique: true|
|expiration_year|	integer|	null:false|
|expiration_month	|integer|	null:false|
|security_code	|integer|	null:false|
|user|	references|	null: false, foreign_key: true|

### Association
- belongs_to :user -->
