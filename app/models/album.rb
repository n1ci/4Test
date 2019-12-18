class Album < ApplicationRecord
    has_many :songs, dependent: :restrict_with_error
    validates_presence_of :band
    validates_presence_of :title
end
