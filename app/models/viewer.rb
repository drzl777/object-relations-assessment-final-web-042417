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
