# Instructions
* Fork this Repository
* Clone your forked repo
* Complete the activity Below
* Push your solution to your repo
* Submit a Pull Request from your repo to this repo
* Put your name in your PR!

# Iteration 1

For iteration 1, we have created all of the tests you will need
unskip tests one by one by removing the x in front of it and make each pass before
moving on to the next test. The tests will model the following interaction pattern:

```ruby
pry(main)> require './lib/classroom'
#=> true

pry(main)> classroom = Classroom.new('History', 4)
=> #<Classroom:0x00007fed7c11dbd8 @capacity=4, @subject="History", @students=[]>

pry(main)> classroom.subject
=> "History"

pry(main)> classroom.capacity
=> 4

pry(main)> classroom.students
=> []
```

# Iteration 2
For iteration 2, we have created all of the tests you will need  
unskip tests one by one, making each pass before moving on the the next test.
The tests will model the interaction pattern below.

`yell_at_students` should return an array of students with their names in call caps

```ruby
pry(main)> require './lib/classroom'
#=> true

pry(main)> classroom = Classroom.new('History', 4)
=> #<Classroom:0x00007fed7c11dbd8 @capacity=4, @subject="History", @students=[]>

pry(main)> classroom.add_student('Mike')
pry(main)> classroom.add_student('Megan')
pry(main)> classroom.add_student('Ian')

pry(main)> classroom.students
=> ["Mike", "Megan", "Ian"]

classroom.yell_at_students
=> ["MIKE", "MEGAN", "IAN"]

```

# Iteration 3
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The method `over_capacity` will return true or false if the classroom has more students
than the capacity

```ruby
pry(main)> require './lib/classroom'
#=> true

pry(main)> classroom = Classroom.new('History', 4)
=> #<Classroom:0x00007fed7c11dbd8 @capacity=4, @subject="History", @students=[]>

pry(main)> classroom.add_student('Mike')
pry(main)> classroom.add_student('Megan')
pry(main)> classroom.add_student('Bob')

pry(main)> classroom.over_capacity?
=> false

pry(main)> classroom.add_student('Eve')
pry(main)> classroom.add_student('Alice')

pry(main)> classroom.over_capacity?
=> true

```


# Iteration 4
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The `kick_out` method will remove a student from the classroom.

```ruby
pry(main)> require './lib/classroom'
#=> true

pry(main)> classroom = Classroom.new('History', 4)
=> #<Classroom:0x00007fed7c11dbd8 @capacity=4, @subject="History", @students=[]>k

pry(main)> classroom.add_student('Mike')
pry(main)> classroom.add_student('Megan')
pry(main)> classroom.add_student('Bob')
pry(main)> classroom.add_student('James')
pry(main)> classroom.add_student('Cat')
pry(main)> classroom.add_student('Alice')

pry(main)> classroom.kick_out

pry(main)> classroom.over_capacity?
=> true

pry(main)> classroom.kick_out

pry(main)> classroom.over_capacity?
=> false

pry(main)> classroom.students
["Bob", "James", "Cat", "Alice"]

```
