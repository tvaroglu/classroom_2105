require 'rspec'
require './lib/classroom'

describe Classroom do
  context 'Attributes' do
    xit 'is a classroom' do
      classroom = Classroom.new('History', 4)
      expect(classroom).to be_an_instance_of(Classroom)
    end

    xit 'has a subject' do
      classroom = Classroom.new('History', 4)
      expect(classroom.subject).to eq('History')
    end

    xit 'has a capacity' do
      classroom = Classroom.new('History', 4)
      expect(classroom.capacity).to eq 4
    end

    xit 'has no students by default' do
      classroom = Classroom.new('History', 4)
      expect(classroom.students).to eq []
    end
  end

  # Iteration 2

  context 'Students' do
    xit 'returns a list of students' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.students).to eq ['Mike', 'Megan', 'Bob']
    end

    xit 'returns a list of uppercased names' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.yell_at_students).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end
end