require "rails_helper"

RSpec.describe SupplierAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/supplier_accounts").to route_to("supplier_accounts#index")
    end

    it "routes to #new" do
      expect(get: "/supplier_accounts/new").to route_to("supplier_accounts#new")
    end

    it "routes to #show" do
      expect(get: "/supplier_accounts/1").to route_to("supplier_accounts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/supplier_accounts/1/edit").to route_to("supplier_accounts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/supplier_accounts").to route_to("supplier_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/supplier_accounts/1").to route_to("supplier_accounts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/supplier_accounts/1").to route_to("supplier_accounts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/supplier_accounts/1").to route_to("supplier_accounts#destroy", id: "1")
    end
  end
end
