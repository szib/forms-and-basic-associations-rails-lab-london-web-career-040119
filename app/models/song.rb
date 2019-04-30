class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name
    genre ? genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      notes << Note.create(content: content) unless content.empty?
    end
  end
end
