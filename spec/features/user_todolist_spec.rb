require 'rails_helper'

RSpec.feature "User adds to todolist" do
  scenario "User signs up" do
    visit new_user_registration_path
    expect(page).to have_content('Sign Up')
  end

  scenario "User visits their empty todolist page" do
    before do
      @john = User.create!(email: "john@example.com", password: "password")
      login_as(@john)
    end
    visit '/'
    expect(page).to have_content('Todo Lists')
  end

  scenario "User add a new task to their todolist" do
    before do
      @john = User.create!(email: "john@example.com", password: "password")
      login_as(@john)
    end
    visit '/'
    click_link "New Todo List"
    fill_in "Task", with: "Finish coding webapp"
    click_button "Create Todo list"

    expect(page).to have_content("Todo list was successfully created.")
    expect(page).to have_content("Task: Finish coding webapp")
  end
end
