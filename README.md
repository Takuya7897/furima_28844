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
| frist_name ｜string｜null:false｜
| last_name ｜string｜null:false|
| family_name_kana ｜string|null:false|
| first_name_kana ｜string|null:false|
| dare_of_birth ｜date|null:false|


### Association

-has_many :items,
-has_one :customer, dependent: :destroy



## items table 

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| img   | references | null: false, foreign_key: true |
| name   | string | null: false| 
｜category|integer | null: false |
|introduction|text|null: false|
|details|string | integer: false |
| condition|string | integer: false |
| prefecture_code| integer | null: false |
| preparation_day| integer | null: false |
| price| integer | null: false |
| ship_cost | integer | null: false |
| ship_date| integer | null: false |



### Association

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


## customer table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
｜user |references|null: false, foreign_key: true
|item |references|null: false, foreign_key: true
### Association
- belongs_to :item
- belongs_to :user
- has_one : address 