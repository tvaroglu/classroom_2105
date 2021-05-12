require 'rspec'
require './lib/classroom'

describe Classroom do
  context 'Attributes' do
    it 'is a classroom' do
      classroom = Classroom.new('History', 4)
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'has a subject' do
      classroom = Classroom.new('History', 4)
      expect(classroom.subject).to eq('History')
    end

    it 'has a capacity' do
      classroom = Classroom.new('History', 4)
      expect(classroom.capacity).to eq 4
    end

    it 'has no students by default' do
      classroom = Classroom.new('History', 4)
      expect(classroom.students).to eq []
    end
  end

  # Iteration 2

  context 'Students' do
    it 'returns a list of students' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.students).to eq ['Mike', 'Megan', 'Bob']
    end

    it 'returns a list of uppercased names' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.yell_at_students).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  # Iterations 3 & 4

  context 'Capacity and Wait List' do
    it 'returns a list of students and a wait list' do
      classroom = Classroom.new('Algebra', 5)
      expect(classroom.over_capacity?).to be(false)

      students = ['Kyle', 'Stan', 'Kenny', 'Eric', 'Craig', 'Butters']
      students.each do |student|
        classroom.add_student(student)
      end

      expect(classroom.over_capacity?).to be(true)
      expect(classroom.students).to eq(['Kyle', 'Stan', 'Kenny', 'Eric', 'Craig'])
      expect(classroom.wait_list).to eq(['Butters'])
      expect(classroom.yell_at_students).to eq(['KYLE', 'STAN', 'KENNY', 'ERIC', 'CRAIG', 'BUTTERS'])
    end

    it 'can remove a student to reach capacity' do
      classroom = Classroom.new('Biology', 6)
      expect(classroom.over_capacity?).to be(false)

      students = ['Kyle', 'Stan', 'Kenny', 'Eric', 'Craig', 'Butters', 'Wendy', 'Jason']
      students.each do |student|
        classroom.add_student(student)
      end

      expect(classroom.over_capacity?).to be(true)
      expect(classroom.students.length).to eq(6)
      expect(classroom.wait_list.length).to eq(2)

      classroom.kick_out

      expect(classroom.over_capacity?).to be(true)
      expect(classroom.students.length).to eq(6)
      expect(classroom.students.first).to eq('Stan')
      expect(classroom.students.last).to eq('Wendy')
      expect(classroom.wait_list.length).to eq(1)

      classroom.kick_out

      expect(classroom.over_capacity?).to be(false)
      expect(classroom.students.length).to eq(6)
      expect(classroom.students.first).to eq('Kenny')
      expect(classroom.students.last).to eq('Jason')
      expect(classroom.wait_list.length).to eq(0)

      classroom.kick_out

      expect(classroom.over_capacity?).to be(false)
      expect(classroom.students.length).to eq(6)
      expect(classroom.students.first).to eq('Kenny')
      expect(classroom.students.last).to eq('Jason')
      expect(classroom.wait_list.length).to eq(0)
    end
  end


end
