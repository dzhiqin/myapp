class BlogTag < ApplicationRecord
  belongs_to :blog, :optional => true
  belongs_to :tag, :optional => true
end
