# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(name)
    @name = name
    self.first_name, self.last_name = name.split(' ')[0], name.split(' ')[1]
    @@all << self
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end

end

class Rating
  attr_accessor :score
  attr_reader :movie, :viewer

  @@all = []

  def initialize(score, movie, viewer)
    @score, @movie, @viewer = score, movie, viewer
    @@all << self
  end

  def self.all
    @@all
  end



end

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.detect {|movie| movie.title == title}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    self.ratings.collect {|rating| rating.viewer }
  end

  def average_rating
    scores = self.ratings.collect {|rating| rating.score}
    sum = scores.inject {|sum, score| sum + score}
    average = (sum.to_f / self.ratings.size.to_f).round(2)
  end

end
