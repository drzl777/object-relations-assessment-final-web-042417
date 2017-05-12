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
