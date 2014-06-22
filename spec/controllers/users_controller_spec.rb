require 'spec_helper'

describe UsersController, :type => :controller do
  let!(:condo) { attributes_for(:condo) }
  let!(:vivento_account) { attributes_for(:vivento_account) }
  describe "POST sign_up_with_vivento" do
    it "creates user and redirect_to complete profile" do
      post :sign_up_with_vivento, { condo: condo, vivento_account: vivento_account }
      expect(response).to redirect_to(new_person_path)
    end
  end
end
