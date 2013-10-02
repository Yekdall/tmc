include ApplicationHelper

def test_content(request)
  
  if request == "not_signed_in"
    it { should_not have_link('Account', href: '#') }
    it { should_not have_link('Profile', href: user_path(user)) }
    it { should_not have_link('Settings', href: edit_user_path(user)) }
  
  else
  
    it { should have_selector('h1',    text: user.name) }      
    it { should have_selector('title', text: user.name) }
    it { should have_link('Sign out', href: signout_path) }
    it { should_not have_link('Sign in', href: signin_path) }
      
    if request == "authenticate"
      it { should have_link('Users', href: users_path) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
    
    elsif request == "create_user"
      it { should have_selector('div.alert.alert-success', text: "Welcome") }
    
    end

  end
    
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end