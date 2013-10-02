require 'spec_helper'

describe "Static pages" do

  # Modo de test simplificado
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
  
  describe "Home page" do 
  
    before { visit root_path } # This row eliminates the need for adding "Visit root_path" in each "it"
  
    let (:heading) { 'Sample App' }
    let (:page_title) { '' }
    
    it_should_behave_like "all static pages" 
    it { should_not have_selector 'title', text: '| Home|' }
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        #FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        #FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        31.times { FactoryGirl.create(:micropost, user: user)}
        sign_in user
        visit root_path   
      end
    
      it "should render the user's feed" do
        user.feed.paginate(page: 1).each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
      
      it "page should include the microposts count" do
        page.should have_selector('span', text: "microposts")
        page.should have_selector('span', text: user.microposts.count.to_s)
      end
      
      it "should paginate the microposts" do
        page.should have_selector("div.pagination")
      end
      
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end
          it { should have_link("0 following",  href: following_user_path(user)) }
          it { should have_link("1 follower",   href: followers_user_path(user)) }
      end
    end
  end
  
  describe "Help page" do
    
    before { visit help_path } # Esta línea elmina la necesidad de añadir "Visit help_path" en cada "it"
  
    let (:heading) { 'Help' }
    let (:page_title) { '' }
    
    it_should_behave_like "all static pages" 
    it { should have_selector 'title', text: '| Help' }
      
  end

  describe "About page" do
    before { visit about_path } # Esta línea elmina la necesidad de añadir "Visit about_path" en cada "it"
  
    let (:heading) { 'About' }
    let (:page_title) { '' }
    
    it_should_behave_like "all static pages" 
    it { should have_selector 'title', text: '| About' }
  
  end
  
  describe "Contact" do
    before { visit contact_path } # Esta línea elmina la necesidad de añadir "Visit contact_path" en cada "it"
  
    let (:heading) { 'Contact' }
    let (:page_title) { '' }
    
    it_should_behave_like "all static pages" 
    it { should have_selector 'title', text: '| Contact' }
  
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    page.should_not have_selector 'title', text: full_title('Home')
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should_not have_selector 'title', text: full_title('Home')
  end
  
end