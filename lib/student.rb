class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    self.send(:name=, student_hash[:name])
    self.send(:location=, student_hash[:location])
    self.send(:profile_url=, student_hash[:profile_url])
    @@all << self
  end

  def self.create_from_collection(students_array)

    students_array.each do |student|
      student = Student.new
    end

  end

  def add_student_attributes(attributes_hash)

    attributes_hash.each do |key, value|
      #iterate over the hash and assign the value of each key to the actual method
      self.send("#{key}=".to_sym, value)
    end

  end

  def self.all
    @@all 
  end
end
