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

## items テーブル

| Column            | Type              | Options             |
| ----------------- | ----------------- | ------------------- |
| title             | string            | null: false         |
| introduce         | text              | null: false         |
| category_id       | integer           | null: false         |
| status_id         | integer           | null: false         |
| fee_burden_id     | integer           | null: false         |
| ship_origin_id    | integer           | null: false         |
| ship_date_id      | integer           | null: false         |
| price             | integer           | null: false         |

### Association
- belongs_to :user
- belongs_to :customer

## customers テーブル

| Column               | Type            | Options                        |
| -------------------  | --------------- | ------------------------------ |
| postal_num           | string          | null: false                    |
| pref_id              | integer         | null: false                    |
| city                 | string          | null: false                    |
| house_num            | string          | null: false                    |
| building             | string          |                                |
| tel_num              | integer         | null: false                    |
| user_id              | references      | null: false, foreign_key: true |
| card_id              | references      | null: false, foreign_key: true |

### Association
- has_one :item
- has_one :card

## cards テーブル

| Column        | Type       | Options                        |
| ------------- |  --------- | ------------------------------ |
| card_num      | integer    | null: false                    |
| exp_year      | integer    | null: false                    |
| exp_month     | integer    | null: false                    |
| sec_num       | integer    | null: false                    |

### Association
- belongs_to :customer
