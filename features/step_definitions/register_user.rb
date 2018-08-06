require 'page-object/page_factory'
require_relative 'executors/sign_in.rb'
require_relative 'executors/register.rb'
require_relative 'executors/new_profile.rb'
require_relative 'executors/address.rb'
require_relative 'executors/confirm.rb'
require_relative 'executors/createoverview.rb'
require "rspec"
require 'rspec/expectations'

Given /^I am on (.+)$/ do |url|
	@browser.navigate.to url
end


When("Click on Register Button") do
	signin = SignInPage.new(@browser)
	signin.select_register()
end

When("Fill in {string} and {string} and click Create Account in Register Page") do |account_email, account_pwd|
  register = RegisterPage.new(@browser)
  account_email.sub! '{random}',rand(36**5).to_s(36)
  register.fill_email(account_email)
  register.fill_pwd(account_pwd)
  register.select_createaccount()
end

When("Fill in {string}-name and {string}-surname in New Profile Page") do |name, surname|
  profile = NewProfilePage.new(@browser)
  profile.fill_name(name)
  profile.fill_surname(surname)
end

When("Fill in {string}-{string}-{string} as the date of birth in New Profile Page") do |day,month,year|
  profile = NewProfilePage.new(@browser)
  profile.fill_dobyear(year)
  profile.fill_dobmonth(month)
  profile.fill_dobday(day)
end

When("Click on Create Profile in New Profile Page") do
  profile = NewProfilePage.new(@browser)
  profile.select_createprofile()
end

When("I fill in {string},{string},{string} in Address Page") do |street, houseno, postcode|
  address = AddressPage.new(@browser)
  address.fill_street(street)
  address.fill_houseno(houseno)
  address.fill_postcode(postcode)
end

When("I click on Create Address in Address Page") do
  address = AddressPage.new(@browser)
  address.select_create_address()
end

When("I click on Confirm in the confirmations Page") do
  confirmation = ConfirmationPage.new(@browser)
  confirmation.select_create_address()
end

Then("I should see success message {string} in CreateOverview Page") do |exp_success_message|
  createoverview = CreateOverviewPage.new(@browser)
  expect(createoverview.read_success_message()).to eq(exp_success_message)
end