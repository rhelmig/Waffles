*** Settings ***
Documentation   	    Sample practice solutions against a Google Web Toolkit (GWT) app.
Library   	            SeleniumLibrary   5.0   5.0
Resource                Resources/GWTapp.robot

*** Variables ***
${Browser}   	        Chrome
${url}                  http://samples.gwtproject.org/samples/Showcase/Showcase.html

*** Test Cases ***
Set up
	Open Browser  	    ${url}   	${BROWSER}
    MAXIMIZE BROWSER WINDOW

Test Check Box
   	Check Box

Test Radio Buttons
	Radio Buttons

Test Buttons with Alert
	Alert Check

Test Custom Push Button
    Push Button

Test Toggle Button
    Toggle Button

Test File Upload
    upload file

Test List Box Multiple Select
    test list box multiple select

Test Rich Text Input
    rich text

Test Disclosure Panel
    panel

Test Popup Box
    pop up

Test Cell List
    update cell list

Test Flex Table
    flex table

End test
    close browser

