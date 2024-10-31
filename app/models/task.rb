class Task < ApplicationRecord
has_many  :comments
has_one   :status

belongs_to :guest

  CATEGORY = Category.all

end
