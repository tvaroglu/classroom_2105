require 'pry'
require './lib/classroom'

RSpec.configure do |config|
  confit.default_formatter = 'doc'
end

RSpec.describe "Classroom Spec Harness" do
  before :each do
    @classroom = Classroom.new('History', 4)
  end

  describe 'Iteration 1' do
    it '1. Classroom Instantiation' do
      expect(Classroom).to respond_to(:new).with(2).argument
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it '2. Classroom Atributes' do
      expect(@classroom.subject).to eq('History')
      expect(@classroom.capacity).to eq(4)
      expect(@classroom.students).to eq([])
    end
  end

  describe 'Iteration 2' do
    it '1. Classroom add students' do
      @classroom.add_student('Mike')
      @classroom.add_student('Megan')
      @classroom.add_student('Mike')

      expect(@classroom.students).to eq(['Mike', 'Megan', 'Ian'])
    end

    it '2. Classroom Yell At Students' do
      @classroom.add_student('Mike')
      @classroom.add_student('Megan')
      @classroom.add_student('Mike')

      expect(@classroom.yell_at_students).to eq(['MIKE', 'MEGAN', 'IAN'])
    end
  end

  describe 'Iteration 3' do
    it '1. Classroom Over Capacity' do
      @classroom.add_student('Mike')
      @classroom.add_student('Megan')
      @classroom.add_student('Mike')
      
      expect(@classroom.over_capacity?).to eq(false)
      
      @classroom.add_student('Eve')
      
      expect(@classroom.over_capacity?).to eq(false)

      @classroom.add_student('Alice')

      expect(@classroom.over_capacity?).to eq(true)
    end
  end

  describe 'Iteration 4' do
    it '1. Classroom Kicks Out'  do
      @classroom.add_student('Mike')
      @classroom.add_student('Megan')
      @classroom.add_student('Mike')

      @classroom.kick_out

      expect(@classroom.students).to eq(['Megan', 'Ian'])

      @classroom.kick_out
      
      expect(@classroom.students).to eq(['Ian'])
    end
  end
end