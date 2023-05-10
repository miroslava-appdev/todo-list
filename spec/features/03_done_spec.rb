require "rails_helper"

describe "The Done section" do
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
      within(:css, "form") do
        find("button", :text => /Move to In Progress/i ).click
      end
    end

    within(:css, "div.in_progress") do
      within(:css, "form") do
        find("button", :text => /Move to Done/i ).click
      end
    end

    expect(page).to have_tag("div.done") do     
      with_tag("ul") do
        with_tag("li", text: /Work on Todo List app/i)
      end
    end
  end
end

describe "The Done section" do
  it "displays the formatted updated at time for each todo item", points: 1 do
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
      within(:css, "div.next_up") do
        within(:css, "form") do
          find("button", :text => /Move to In Progress/i ).click
        end
      end
    end

    travel_to 12.hours.ago do
      updated_at = Time.current
      within(:css, "div.in_progress") do
        within(:css, "form") do
          find("button", :text => /Move to Done/i ).click
        end
      end
    end

    formatted_updated_at_time = updated_at.strftime("%l:%M%P on %d-%b-%Y")
    expect(page).to have_tag("div.done") do     
      with_tag("ul") do
        with_tag("li", text: /Completed at\s*#{formatted_updated_at_time}/i)
      end
    end
  end
end

describe "The Done section" do
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

    visit("/")

    within(:css, "div.next_up") do
      within(:css, "form") do
        find("button", :text => /Move to In Progress/i ).click
      end
    end

    visit("/")

    within(:css, "div.in_progress") do
      within(:css, "form") do
        find("button", :text => /Move to Done/i ).click
      end
    end

    visit("/")

    within(:css, "div.done li") do      
      find("a", :text => /Delete/i ).click
    end

    visit("/")
    
    expect(page).to_not have_content(/Work on Todo List app/i)
  end
end
