class DefaultUser < ActiveRecord::Migration
    def self.up
       if !User.find_by_login('admin')
         User.create(
           :login => 'admin', 
           :email => '123@123.com',
           :password => 'Bulldog.72',
           :password_confirmation => 'Bulldog.72' )
         end
     end

     def self.down
     end
  end
