*** Settings ***
Documentation                           Test if the name change effects the login name
Library                                 SeleniumLibrary
Library                                 ImapLibrary2
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/browser_variables.robot
Resource                                ../Resources/teardown_keywords.robot

Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =    chrome

*** Test Cases ***
