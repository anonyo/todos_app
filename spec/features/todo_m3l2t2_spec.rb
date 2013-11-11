require 'spec_helper'

describe "In shared_todo_app - " do
  before do

    @t1 = Todo.create(todo_item: "Draw Money")
    @t2 = Todo.create(todo_item: "Buy Milk")
    @t3 = Todo.create(todo_item: "Pay bill")
  end

 describe "Should delete last todo - " do
    
    it "Click on 'Delete last todo' button, returning page should have content 
                  'Todo successfully deleted' and 'Back' button." do

      visit '/todos/index'
      click_on "Delete last todo"
      page.should have_content("Todo successfully deleted")
      click_on "Back"
    end
    
    it "On clicking Back button, on /todos/delete page, should return to index page and  
        should have deleted last todo, rest of todos should be present" do

      visit '/todos/index'
      click_on "Delete last todo"

      page.should have_content("Todo successfully deleted")

      click_on "Back"

      page.should have_selector('h1',
                  :text => "Shared Todo App")
      page.should have_selector('li',
                  :text => "Buy Milk")
      page.should have_selector('li',
                  :text => "Draw Money")
      page.should_not have_selector('li',
                  :text => "Pay bill")
      
    end



  end

end
