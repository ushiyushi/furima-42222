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


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_sei           | string | null: false               |
| name_mei           | string | null: false               |
| kana_sei           | string | null: false               |
| kana_mei           | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| introduction      | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| fee_id            | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_time_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building        | string     | null: false                    |
| phone           | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
