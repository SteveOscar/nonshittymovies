require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "#{i+1} title",
                           :description => "#{i+1} description"})
    end
  end

  def test_new_task_creation
    visit("/")
    click_link("New Task")

    fill_in("task-title", with: "new task")
    fill_in("task-description", with: "new description")
    assert_equal "/tasks/new", current_path
    click_button("Create Task")
    assert_equal "/tasks", current_path

    within(".container") do
      assert page.has_content?("new task")
    end
  end

  def test_user_can_edit_a_task
    create_tasks(1)
    task = TaskManager.all.last

    visit "/tasks"
    click_link("edit")
    fill_in("task-title", with: "new task edited")
    fill_in("task-description", with: "new description edited")
    click_button("Update Task")

    assert_equal "/tasks/#{task.id}", current_path
    within(".container") do
      assert page.has_content?("new task edited")
    end
  end

  def test_user_can_delete_a_task
    create_tasks(1)

    visit "/tasks"
    click_button("delete")

    refute page.has_content?("new task")
  end

  def test_a_user_can_see_a_single_task
    create_tasks(1)
    task = TaskManager.all.last

    visit "/tasks"

    click_link("1 title")
    assert_equal "/tasks/#{task.id}", current_path
    assert page.has_content?("1 description")
  end

  def test_filter_task_index_by_param
    create_tasks(2)
    TaskManager.create({ :title       => "dogsitting",
                         :description => "Friday"})
    TaskManager.create({ :title       => "dogsitting",
                         :description => "Saturday"})

    visit "/tasks?title=dogsitting"

    selected_tasks = TaskManager.all.select { |task| task.title == "dogsitting"}

    selected_tasks.each do |task|
      save_and_open_page
      within(".task-#{task.id}") do
        assert page.has_content?("dogsitting")
      end
    end

    refute page.has_content?("1 title")
    refute page.has_content?("2 title")
  end
end
