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


### Association

- has_many :comments
has_many :items,
belongs_to: customer



## items table 

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| img   | references | null: false, foreign_key: true |
| name   | references | null: false, foreign_key: true | 
｜category|integer | null: false |
|introduction|text|null: false|
|details|string | null: false |
| condition|string | null: false |
| prefecture_code| integer | null: false |
| preparation_day| integer | null: false |
| Price| integer | null: false |
| ship_cost | integer | null: false |
| ship_date| integer | null: false |



### Association

- has_many :comments 
- has_one :customer




## address table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code|string|null:false|
| prefecture_code    | integer | null: false|
| city    | string | null: false|
| house_number｜string|null:false|
| building_name|string|
| phone_number|string|null:false|





### Association

- belongs_to : customer

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



## customer table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
user_id
item_id
### Association
- has_many :item
- has_many :user
- has_one : address 
