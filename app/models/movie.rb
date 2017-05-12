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
