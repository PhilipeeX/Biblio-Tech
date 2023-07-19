require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "should create author" do
    visit authors_url
    click_on "New author"

    fill_in "Bibliography", with: @author.bibliography
    fill_in "Biography", with: @author.biography
    fill_in "Birth date", with: @author.birth_date
    fill_in "Contacts", with: @author.contacts
    fill_in "Literary genre", with: @author.literary_genre
    fill_in "Nationality", with: @author.nationality
    fill_in "Nome", with: @author.nome
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "should update Author" do
    visit author_url(@author)
    click_on "Edit this author", match: :first

    fill_in "Bibliography", with: @author.bibliography
    fill_in "Biography", with: @author.biography
    fill_in "Birth date", with: @author.birth_date
    fill_in "Contacts", with: @author.contacts
    fill_in "Literary genre", with: @author.literary_genre
    fill_in "Nationality", with: @author.nationality
    fill_in "Nome", with: @author.nome
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "should destroy Author" do
    visit author_url(@author)
    click_on "Destroy this author", match: :first

    assert_text "Author was successfully destroyed"
  end
end
