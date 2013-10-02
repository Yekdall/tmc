class AddSuperadminToUser < ActiveRecord::Migration
  def up
    add_column :users, :superadmin, :boolean, 
                                    :null => false, 
                                    :default => false 
    User.create! do |r|
      r.email      = 'arriquitaun@gmail.com'
      r.password   = 'Madrid'
      r.superadmin = true
    end
  end

  def down
    remove_column :users, :superadmin
    User.find_by_email('arriquitaun@gmail.com').try(:delete)
  end

end
