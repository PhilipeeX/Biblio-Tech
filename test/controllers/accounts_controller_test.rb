require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create accounts" do
    assert_difference("Account.count") do
      post accounts_url, params: { account: { bank: @account.bank, number: @account.number, supplier_id: @account.supplier_id } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show accounts" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update accounts" do
    patch account_url(@account), params: { account: { bank: @account.bank, number: @account.number, supplier_id: @account.supplier_id } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy accounts" do
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
