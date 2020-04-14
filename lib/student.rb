class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    #extract each piece of information from the hash

    student_hash[:location]
    student_hash[:profile_url]
    #send this information to the corresponding attr accessor method
    self.send(:name, student_hash[:name])
    @@all << self
  end

  def self.create_from_collection(students_array)

    students_array.each do |student|
      student = Student.new
    end

  end

  def add_student_attributes(attributes_hash)


  end

  def self.all

  end
end
