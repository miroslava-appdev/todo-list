require "rails_helper"

describe "The In Progress section" do
  it "displays todo items in a `<li>` element", points: 1 do
    visit("/user_sign_in")
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/user_sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      find("button", :text => /Sign in/i ).click
    end

    visit("/")

    within(:css, "form") do
      fill_in "Describe the task:", with: "Work on Todo List app"
      find("button", :text => /Add to Next Up/i ).click
    end

    within(:css, "div.next_up") do
      find("button", :text => /Move to In Progress/i ).click
    end

    expect(page).to have_tag("div.in_progress") do     
      with_tag("ul") do
        with_tag("li", text: /Work on Todo List app/i)
      end
    end
  end
end

describe "The In Progress section" do
  it "displays the formatted updated at time for each todo items", points: 1 do
    visit("/user_sign_in")
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/user_sign_in"

    created_at = Time.now

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      find("button", :text => /Sign in/i ).click
    end

    visit("/")

    within(:css, "form") do
      fill_in "Describe the task:", with: "Work on Todo List app"
      find("button", :text => /Add to Next Up/i ).click
    end

    updated_at = nil
    travel_to 1.day.ago do
      updated_at = Time.current
      within(:css, "div.next_up") do
        within(:css, "form") do
          find("button", :text => /Move to In Progress/i ).click
        end
      end
    end

    visit("/")

    formatted_updated_at_time = time_ago_in_words(updated_at)
    expect(page).to have_tag("div.in_progress") do     
      with_tag("ul") do
        with_tag("li", text: /Started #{formatted_updated_at_time} ago/i)
      end
    end
  end
end

describe "The In Progress section" do
  it "has a link to delete a todo item with the text 'Delete'", points: 1 do
    visit("/user_sign_in")
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/user_sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      find("button", :text => /Sign in/i ).click
    end

    visit("/")

    within(:css, "form") do
      fill_in "Describe the task:", with: "Work on Todo List app"
      find("button", :text => /Add to Next Up/i ).click
    end

    within(:css, "div.next_up") do
      within(:css, "form") do
        find("button", :text => /Move to In Progress/i ).click
      end
    end

    within(:css, "div.in_progress li") do      
      find("a", :text => /Delete/i ).click
    end
    
    expect(page).to_not have_content(/Work on Todo List app/i)
  end
end

describe "The In Progress section" do
  it "has buttons to move todos to the \"Done\" section", points: 2 do
    visit("/user_sign_in")
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/user_sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      find("button", :text => /Sign in/i ).click
    end

    visit("/")
    
    within(:css, "form") do
      fill_in "Describe the task:", with: "Work on Todo List app"
      find("button", :text => /Add to Next Up/i ).click
    end

    within(:css, "div.next_up") do
      find("button", :text => /Move to In Progress/i ).click
    end

    within(:css, "div.in_progress") do
      find("button", :text => /Move to Done/i ).click
    end

    in_progress_section_div = find("div.done")
    expect(in_progress_section_div).to have_text(/Work on Todo List app/i)
  end
end
