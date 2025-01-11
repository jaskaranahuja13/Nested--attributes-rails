class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user , optional: false
end
