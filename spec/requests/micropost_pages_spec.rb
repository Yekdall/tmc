require 'spec_helper'

describe "MicropostPages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "micropost creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      it "should not create a micropost" do
        expect { click_button "Post" }.should_not change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.should change(Micropost, :count).by(1)
      end
    end
  end
    
  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a micropost" do
        expect { click_link "delete" }.should change(Micropost, :count).by(-1)
      end
    end
    
    describe "as another user" do
      let(:another_user) { FactoryGirl.create(:user) }
      before { FactoryGirl.create(:micropost, user: another_user) }
      before {visit user_path(another_user)}
      
      it "should not have a delete link" do
        expect { should_not have_link('delete') }
      end
      
      it "should not be able to delete another user micropost" do
        expect { delete micropost_path(FactoryGirl.create(:micropost, user: another_user)) }.should_not change(Micropost, :count).by(-1)
      end
    end
  end
  
end