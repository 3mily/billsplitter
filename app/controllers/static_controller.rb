class StaticController < ApplicationController

  def test
  	@contacts = Contact.all  
  end

  # def contacts 
  # 	@contacts = Contacts.all
  # end 
end
