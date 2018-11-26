*** Settings ***
Library  SeleniumLibrary
Library  PyAssist.py


*** Keywords ***
Check Box
    [Documentation]  Checkbox acceptance with 2 confirmations
   	Wait Until Element Is Visible   	xpath=.//div[contains(@class, "GNHGC04CHJ")]
	Click Element   	                gwt-debug-cwCheckBox-Monday-input
	Click Element   	                gwt-debug-cwCheckBox-Tuesday-input
	Click Element   	                gwt-debug-cwCheckBox-Wednesday-input
	Click Element   	                gwt-debug-cwCheckBox-Thursday-input
   	checkbox should be selected   	    gwt-debug-cwCheckBox-Thursday-input
	Checkbox Should Not Be Selected   	gwt-debug-cwCheckBox-Friday-input

Radio Buttons
    [Documentation]  Radio Button accpetance with 2 confirmations
   	Click Element   	                xpath=(.//div[contains(@class, "GNHGC04CKF")])[3]
	Wait Until Element Is Visible   	xpath=.//div[contains(@class, "GNHGC04CHJ")]
	Click Element   	                gwt-debug-cwRadioButton-color-blue-input
	Click Element   	                gwt-debug-cwRadioButton-color-blue-input
	Click Element   	                gwt-debug-cwRadioButton-sport-Baseball-input
	Element Should Be Enabled   	    gwt-debug-cwRadioButton-color-blue-input
	Element Should Be Enabled   	    gwt-debug-cwRadioButton-sport-Baseball-input

Alert Check
    [Documentation]  Alert box solution. Clears the alert and logs the message.
	Click Element   	                xpath=(.//div[contains(@class, "GNHGC04CKF")])[4]
	Wait Until Element Is Visible   	xpath=.//div[contains(@class, "GNHGC04CHJ")]
	Click Button   	                    gwt-debug-cwBasicButton-normal
    ${message} =	Handle Alert
    element should be disabled          css:#gwt-debug-cwBasicButton-disabled
    log  ${message}

Push Button
    [Documentation]  Presses the button, holds it, then confirms the correct image is present.
    Click Element   	            xpath=(.//div[contains(@class, "GNHGC04CKF")])[5]
	Wait Until Element Is Visible   xpath=.//div[contains(@class, "GNHGC04CHJ")]
	mouse down   	                xpath=(.//img[contains(@class, "gwt-Image")])[3]
    page should contain image       //*[@id="gwt-debug-cwCustomButton-push-normal"]/img
    mouse up                        xpath=(.//img[contains(@class, "gwt-Image")])[3]

Toggle Button
    [Documentation]  Clicks the toggle then confirms corret image
    Click Image   	                xpath=(.//img[contains(@class, "gwt-Image")])[5]
    page should contain image       css=#gwt-debug-cwCustomButton-toggle-normal > img

Upload File
    [Documentation]  This is will upload a TEST.txt. (Note the sample file needs to be present in the user folder.)
    Click Element   	            xpath=(.//div[contains(@class, "GNHGC04CKF")])[6]
    Click Element   	            css=#gwt-debug-cwFileUpload
    sleep                           2s
    send keys                       # calls my python function
    sleep                           1s
    Click Button   	                xpath=.//button[contains(@class, "gwt-Button")]
    ${message} =  Handle Alert
    log  ${message}

Test List Box Multiple Select
    [Documentation]  Selects list item and then does multiple selects
    click element   	                css=#gwt-debug-mainMenu [aria-selected='false']:nth-of-type(2) [border]
	Wait Until Element Is Visible   	xpath=(.//div[contains(@class, "GNHGC04CKF")])[10]
	CLICK ELEMENT                       //*[@id="gwt-debug-mainMenu"]/div/div/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/div[2]
	Click Element   	                //select[@id='gwt-debug-cwListBox-multiBox']/option[@value='truck']
	Click Element   	                //select[@id='gwt-debug-cwListBox-multiBox']/option[@value='SUV']
	Click Element   	                //select[@id='gwt-debug-cwListBox-multiBox']/option[@value='sedan']

Rich Text
    [Documentation]  Python solution inputing text into a difficult to reach section of empty html body
    go to                               http://samples.gwtproject.org/samples/Showcase/Showcase.html#!CwRichText
    wait until element is visible       xpath=(.//img[contains(@class, "gwt-Image")])[3]
    Click Image   	                    xpath=(.//img[contains(@class, "gwt-Image")])[3]
    rich text box solution                # calls my python function


Panel
    [Documentation]  Inserts user info an additional closed panel
    click element                   //div[@id='gwt-debug-mainMenu']/div/div/div[1]/div[5]/div[@class='GNHGC04CHF GNHGC04CPF']/div//img[@src='http://samples.gwtproject.org/samples/Showcase/showcase/clear.cache.gif']
    wait until element is visible   css=#gwt-debug-mainMenu > div > div > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > div > div:nth-child(1) > div:nth-child(7) > div > div > div.GNHGC04CKF
    sleep  2s
    click element                   css=#gwt-debug-mainMenu > div > div > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > div > div:nth-child(1) > div:nth-child(7) > div > div > div.GNHGC04CKF
    click element                   //a[@id='gwt-debug-cwDisclosurePanel-header']/table//tr/td[1]/img[@src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAfklEQVR42mNgoDZITk4WosiAtLS0M6mpqb1Amp9cAy4B8X8gfpWenp5MiQEwfB6IbSgxAIaXArEcJQaA8Ddg+NQVFhZykmsADG8MDQ1lJseA5wQDFocBP0FRm5WVxUNOGGwEJi4VcmLhKtC5HuSkg8NA5+bjDCRCAG8UDUoAAIw8kVdwMG+3AAAAAElFTkSuQmCC']
    Input Text   	                xpath=(.//input[contains(@class, "gwt-TextBox")])[1]   	Bob
	Input Text   	                xpath=(.//input[contains(@class, "gwt-TextBox")])[2]   	tall
	Input Text   	                xpath=(.//input[contains(@class, "gwt-TextBox")])[last()]   	America!
    Click Element   	            css=.content [align='left']:nth-of-type(1) [type]

Pop up
    [Documentation]  Clicks a popup image and confirms
    go to                               http://samples.gwtproject.org/samples/Showcase/Showcase.html#!CwBasicPopup
    sleep  1s
    click image                         //*[@id="gwt-debug-cwBasicPopup-thumb"]
    Element Should Be Visible   	    xpath=(.//img[contains(@class, "gwt-Image")])[last()]

Flex Table
    [Documentation]  Adds new rows, deletes most, then confirms one of the results
    click element                   //div[@id='gwt-debug-mainMenu']/div/div/div[1]/div[6]/div[@class='GNHGC04CHF GNHGC04CPF']/div//img[@src='http://samples.gwtproject.org/samples/Showcase/showcase/clear.cache.gif']
    wait until element is visible   //div[@id='gwt-debug-mainMenu']/div/div/div[1]/div[6]/div[2]/div/div[1]/div[2]/div[@class='GNHGC04CHF']/div[@class='GNHGC04CHF GNHGC04CJF']/div[@class='GNHGC04CKF']
    click element                   //div[@id='gwt-debug-mainMenu']/div/div/div[1]/div[6]/div[2]/div/div[1]/div[2]/div[@class='GNHGC04CHF']/div[@class='GNHGC04CHF GNHGC04CJF']/div[@class='GNHGC04CKF']
    sleep  .5s                       # for viewing
    click button                    //*[@id="gwt-debug-cwFlexTable-0-1"]/table/tbody/tr[1]/td/button
    sleep  .5s                       # for viewing
    click button                    //*[@id="gwt-debug-cwFlexTable-0-1"]/table/tbody/tr[1]/td/button
    sleep  .5s                       # for viewing
    click button                    //*[@id="gwt-debug-cwFlexTable-0-1"]/table/tbody/tr[2]/td/button
    sleep  .5s                       # for viewing
    click button                    //*[@id="gwt-debug-cwFlexTable-0-1"]/table/tbody/tr[2]/td/button
    sleep  .5s                       # for viewing
    click button                    //*[@id="gwt-debug-cwFlexTable-0-1"]/table/tbody/tr[2]/td/button
    Element Should Not Be Visible   xpath=(.//img[contains(@class, "gwt-Image")])[5]

Update Cell List
    [Documentation]  Updates list with a new contact and confirms cell list count
    go to   http://samples.gwtproject.org/samples/Showcase/Showcase.html#!CwCellList
    wait until element is visible  //div[@id='gwt-debug-contentPanel']/div[2]/div/div[2]//div[@class='GNHGC04CHJ']
    Input Text   	xpath=(.//input[contains(@class, "gwt-TextBox")])[1]   	Test
	Input Text   	xpath=(.//input[contains(@class, "gwt-TextBox")])[last()]   	Test
	Input Text   	xpath=.//textarea[contains(@class, "gwt-TextArea")]   	Test Address
    Click Button   	xpath=(.//button[contains(@class, "gwt-Button")])[2]
    Page Should Contain   	0 - 30 : 251

