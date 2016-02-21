## Task Manager

Simple task manager app built with Sinatra. <br>
Find project overview [here](https://github.com/JumpstartLab/curriculum/blob/master/source/projects/task_manager.markdown).

## Rachel's Notes

* big picture
* migrations
* know how to find answers
* we will run into LOTS of problems. so is life. 

```ruby
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/task_manager_development.sqlite3")
    end
  end
```
* skip all tests but first TaskManager test
* `gem 'sequel'`
* `gem 'sqlite3'`
* delete_all method in teardown

```ruby
DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/task_manager_test.sqlite3")}].strategy = :truncation

class Minitest::Test 
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
```

```ruby
  def self.create(task)
    database[:tasks].insert(task)
  end
```
