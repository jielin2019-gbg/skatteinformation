*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/q&a_keywords.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Skatteinformation Website Is Open
Test Teardown                                   Log Out Forced
Suite Teardown                                  Logout And Close All

*** Variables ***
${BROWSER}                                      headless chrome

*** Test Cases ***
Q/A Page Shown
    [Tags]                                      TIPG-543 Test Q&A page loaded
    Given User logged in front page
     When Click Q/A button menu bar
     Then Q/A page is shown

Visa Button
    [Tags]                                      TIPG-549 Test Show button
    Given Begin at Q/A page
     When Click 'Visa' Button
     Then Verify answer is visible

Test on 'Collapse' button
    [Tags]                                      TIPG-545 Test Collapse button
    Given Begin at Q/A page
      And User is on QA paragraph
     When Collapse button is clicked
     Then Q/A paragraph disappear

Next Page
    [Tags]                                      TIPG-550 Test Next page button
    Given Begin at Q/A page
     When Click Next page button
     Then Next page is shown

Previous Page
    [Tags]                                      TIPG-550 Test Previous page button
    Given Begin at Q/A page
      And On Next page
     When Click Previous page button
     Then Previous page is shown

Link in QA Paragraph
    [Tags]                                      TIPG-554 Test link in paragraph

    Given Begin at search content page
      And Search for the Question 'AGI och redovisning av bilförmån'
     When Clicks the link in QA paragraph
     Then Corresponding website should appear

Selecting a filter category
    [Tags]                                      TIPG-555 Q/A page category selector
    Given Begin at Q/A page
     When Show more and selecting category      Förmåner
     Then Checkbox Selected                     Förmåner

Test mutiple filtering tags
    [Tags]                                      TIPG-567 Test funcionality of mutiple filtering tags
    Given Begin at Q/A page
     When User select more than one filetring tag
     Then Verify selected tags became marked

Test Selected Q&A are displayed
    [Tags]                                      TIPG-568 Test funcionality of chosen Q&A are displayed
    Given Begin at Q/A page
     When Check relevant Q&A are displayed
     Then Verify all Q&A are displayed

