require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "#{i+1} title",
                           :description => "#{i+1} description"})
    end
  end

  def test_it_creates_a_task
    create_tasks(1)
    task = TaskManager.find(TaskManager.all.first.id)

    assert_equal "1 title", task.title
    assert_equal "1 description", task.description
    assert_equal TaskManager.all.first.id, task.id
  end

  def test_it_finds_all_tasks
    create_tasks(2)

    assert_equal 2, TaskManager.all.count
  end

  def test_it_finds_a_task_by_id
    create_tasks(2)

    assert_equal "1 title", TaskManager.find(TaskManager.all.first.id).title
  end

  def test_it_updates_a_task
    create_tasks(1)

    TaskManager.update(TaskManager.all.first.id, {title: "new title", description: "new description"})

    task = TaskManager.find(TaskManager.all.first.id)

    assert_equal "new title", task.title
    assert_equal "new description", task.description
  end

  def test_it_deletes_a_task
    create_tasks(3)
    total = TaskManager.all.count

    TaskManager.delete(TaskManager.all.first.id)

    assert_equal (total - 1), TaskManager.all.count
  end
end
