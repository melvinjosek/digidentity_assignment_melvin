Feature: Register User
	As a user i would like to register as a user to the portal.

Scenario: Successful Registeration
    Given I am on http://localhost:3000/sign_in
	When    Click on Register Button
		And Fill in 'testemail{random}@gmail.com' and 'test_pwd' and click Create Account in Register Page
		And Fill in 'Melvin'-name and 'Kuriakose'-surname in New Profile Page
		And Fill in '10'-'Jun'-'2013' as the date of birth in New Profile Page
		And Click on Create Profile in New Profile Page
		And I fill in "Ganzenstraat","33","1181TS" in Address Page
		And I click on Create Address in Address Page
		And I click on Confirm in the confirmations Page
	Then I should see success message "Successfully registered" in CreateOverview Page