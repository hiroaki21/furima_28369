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

* # テーブル設計

## users テーブル

| Column            | Type              | Options                 |
| ----------------- | ----------------- | ----------------------- |
| nickname          | string            | null: false             |
| email_address     | string            | null: false,unique: true|
| password          | string            | null: false             |
| last_name         | string            | null: false             |
| first_name        | string            | null: false             |
| last_name_kana    | string            | null: false             |
| first_name_kana   | string            | null: false             |
| birth_date        | date              | null: false             |

### Association
- has_many :items
- has_many :transactions

## items テーブル

| Column            | Type              | Options                        |
| ----------------- | ----------------- | ------------------------------ |
| title             | string            | null: false                    |
| introduce         | text              | null: false                    | 
| category_id       | integer           | null: false                    |
| status_id         | integer           | null: false                    |
| fee_burden_id     | integer           | null: false                    |
| ship_origin_id    | integer           | null: false                    |
| ship_date_id      | integer           | null: false                    |
| price             | integer           | null: false                    |
| user              | references        | null: false, foreign_key: true |

### Association
- has_one :transaction
- belongs_to :user
- has_one :address

## transactions テーブル

| Column               | Type            | Options                        |
| -------------------  | --------------- | ------------------------------ |
| item                 | references      | null: false, foreign_key: true |
| user                 | references      | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column               | Type            | Options                        |
| -------------------  | --------------- | ------------------------------ |
| postal_num           | string          | null: false                    |
| pref_id              | integer         | null: false                    |
| city                 | string          | null: false                    |
| house_num            | string          | null: false                    |
| building             | string          |                                |
| tel_num              | string          | null: false                    |
| item                 | references      | null: false, foreign_key: true |


### Association
- belongs_to :item