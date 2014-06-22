require 'spec_helper'

describe UsersController, :type => :controller do
  let!(:condo) { { condo_id: 1, code: "parcdesprinces", name: "Condomínio Parc des Princes", website: "http://www.parcdesprinces.com.br" } }
  let!(:vivento_account) { { email: "bla@bla.com", password: "123123", password_confirmation: "123123" } }
  describe "POST sign_up_with_vivento" do
    it "creates user and redirect_to complete profile" do
      post :sign_up_with_vivento, { condo: condo, vivento_account: vivento_account }
      expect(response).to redirect_to(new_person_path)
    end
  end
end
