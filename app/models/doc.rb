class Doc < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5}
	validates :body, presence: true
	belongs_to :user
end
