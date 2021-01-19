class Todo < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{due_date.to_s(:short)} #{todo_text} #{completed ? "[X]" : "[ ]"}"
  end
end
