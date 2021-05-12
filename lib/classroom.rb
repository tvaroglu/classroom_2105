class Classroom
  attr_reader :subject, :capacity
  attr_accessor :students, :over_capacity, :wait_list

  def initialize(subject='Study Hall', capacity=5)
    @subject = subject.to_s
    @capacity = capacity.to_s.to_i
    @students = Array.new
    @wait_list = Array.new
    @over_capacity = false
  end

  def add_student(student)
    if self.students.length < self.capacity
      self.students << student
    else
      self.wait_list << student
      self.over_capacity = true
    end
  end

  def over_capacity?()
    return self.over_capacity
  end


  def yell_at_students()
    if self.students.length > 0
      students = self.students.map do |student|
        student.upcase
      end
    end

    if self.wait_list.length > 0
      wait_list = self.wait_list.map do |student|
        student.upcase
      end
    end

    if students && wait_list
      return students.concat(wait_list)
    elsif students
      return students
    end
  end


  def kick_out()
    if over_capacity?() == true
      self.students.shift

      if self.wait_list.length > 0
        self.students << self.wait_list.shift
      end

      if self.wait_list.length == 0
        self.over_capacity = false
      end
    end
  end


end
