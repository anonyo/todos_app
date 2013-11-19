require 'spec_helper'

describe "In shared_todo_app - " do
  before do

    @t1 = Todo.create(todo_item: "Draw Money", completed: "true")
    @t2 = Todo.create(todo_item: "Buy Milk", completed: "true")
    @t3 = Todo.create(todo_item: "Pay bill", completed: "false")
  end

 describe "Should have a model named Todo - " do
    
    it "Should have db row with todo_item = Draw Money " do
         @t1.should be_an_instance_of Todo
         @t1.todo_item.should eql "Draw Money"
         @t1.completed.should eql true
    end

  end

 describe "Complete and Incomplete todos - " do

    it "Should have'Complete Todos' button" do 
        visit '/todos/index'
        page.should have_button('Complete Todos')
    end

    it "Completed todos should be striked and other todos should not be striked"  do 
      visit '/todos/index'
      page.should have_selector('strike', :text=> 'Draw Money')
      page.should have_selector('strike', :text=> 'Buy Milk')
      page.should_not have_selector('strike', :text=> 'Pay bill')
    end 
    
    it "Should be able to complete a pending todo, non striked to striked"  do
      visit '/todos/index'
      find(:css, "#todos_checkbox_[value='3']").set(true)
      click_on "Complete Todos"
      cur_todo = Todo.find(3)
      cur_todo.completed.should eql true  
    end

  
  end


end
