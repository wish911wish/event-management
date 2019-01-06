# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|

### Association
- has_many :events, through: :attend_states
- has_many :attend_states
- has_many :groups, through: :group_members


## events table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

### Association
- has_many :users, through: :attend_states
- has_many :attend_states

## attend_states table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|event_id|references|foreign_key: true|
|attend|integer||

### Association
- belongs_to :user
- belongs_to :event

## groups table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :users, through: :group_members

## group_members table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
