require "rails_helper"

describe "The home page" do
  it "has an h1 element with the text \"Your todo list\"", points: 1 do
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
    
    expect(page).to have_tag("h1", :text => /Your todo list/i)
  end
end

describe "The home page" do
  it "has an h2 element with the text \"Add a new todo\"", points: 1 do
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
    
    expect(page).to have_tag("h2", :text => /Add a new todo/i)
  end
end

describe "The home page" do
  it "has a div element with the class \"next_up\"", points: 1 do
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

    expect(page).to have_css("div.next_up"),
      "Expected to find a <div> element with the a class attribute containing 'next_up', but didn't find one."
  end
end

describe "The home page" do
  it "has an h2 element with the text \"Next Up\"", points: 1 do
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
    
    expect(page).to have_tag("h2", :text => /Next Up/i)
  end
end

describe "The text within the div of class \"next_up\"" do
  it "is darkorange", js: true, points: 1 do
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
    next_up_div = find("div.next_up")

    # next_up_div.assert_matches_style( 'color' => 'darkorange')
    expect(next_up_div).to have_color("orange")

  end
end

describe "The home page" do
  it "has a div element with the class \"in_progress\"", points: 1 do
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

    expect(page).to have_css("div.in_progress"),
      "Expected to find a <div> of class 'in_progress', but didn't find one."
  end
end

describe "The home page" do
  it "has an h2 element with the text \"In Progress\"", points: 1 do
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
    
    expect(page).to have_tag("h2", :text => /In Progress/i)
  end
end

describe "The text within the div of class \"in_progress\"" do
  it "is darkgreen",js: true, points: 1 do
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
    in_progress_div = find("div.in_progress")

    expect(in_progress_div).to have_color("green")
  end
end

describe "The home page" do
  it "has a div element with the class \"done\"", points: 1 do
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

    expect(page).to have_css("div.done"),
      "Expected to find a <div> element with the a class attribute containing 'done', but didn't find one."
  end
end

describe "The home page" do
  it "has an h2 element with the text \"Done\"", points: 1 do
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
    
    expect(page).to have_tag("h2", :text => /Done/i)
  end
end

describe "The text within the div of class \"done\"" do
  it "is grey", js: true, points: 1 do
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
    done_section_div = find("div.done")

    # done_section_div.assert_matches_style( 'color' => 'grey')
    expect(done_section_div).to have_color("grey")
  end
end

describe "The home page" do
  it "has a button that adds a new item to the todo list", points: 1 do
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
    
    expect(page).to have_text(/Work on Todo List app/i)
  end
end

describe "The home page" do
  it "has a button that creates a todo item, and moves it to the \"Next Up\" section", points: 2 do
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
    
    expect(page).to have_text(/Work on Todo List app/i)
  end
end
