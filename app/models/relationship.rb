class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  #存在しないクラスを参照するのを防ぐ。
end
