class AddAvatarColumnsToUser < ActiveRecord::Migration
  
  def self.up
      add_attachment :users, :avatar
  end

   
  def self.down   
    drop_attached_file :users, :avatar   
  end 
end