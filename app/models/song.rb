class Song < ApplicationRecord
  belongs_to :user
  validates :song_name, presence: true
  def self.search1(keyword)
    where("song_name like?", "%#{keyword}%")
  end
  def self.search2(keyword)
    where("artist like?", "%#{keyword}%")
  end
end
