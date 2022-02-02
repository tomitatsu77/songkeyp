class Song < ApplicationRecord
  belongs_to :user
  def self.search1(keyword)
    where("song_name like?", "%#{keyword}%")
  end
  def self.search2(keyword)
    where("artist like?", "%#{keyword}%")
  end
end
