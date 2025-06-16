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
| name               | string | null: false               |
| kananame           | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| fee             | string     | null: false                    |
| region          | string     | null: false                    |
| delivery_time   | string     | null: false                    |
| price           | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :adress


## adresses テーブル

| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| post_code      | string     | null: false        |
| prefecture     | string     | null: false        |
| city           | string     | null: false        |
| street_adress  | string     | null: false        |
| building       | string     | null: false        |
| phone          | string     | null: false        |

### Association

- belongs_to :purchase
