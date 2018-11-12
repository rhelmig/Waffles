*** Settings ***
Documentation   	Test automations against HTML5
Library   	        SeleniumLibrary   15.0   5.0
Library             ..//Resources/PyAssist.py

*** Variables ***
${Browser}   	        Chrome

*** Test Cases ***
Start html5 review
	Open Browser  	http://www.worldtreesoftware.com/apps/examples5947/index.html   	${BROWSER}
    MAXIMIZE BROWSER WINDOW


Test Simple Task List
	Click Link   	xpath=.//a[contains(normalize-space(.), 'Example 1.1')]
	Input Text   	new-task-name   	Demo Task
	Press Key   	new-task-name   	\\13
    Input Text   	new-task-name   	Demo Task 1
	Press Key   	new-task-name   	\\13
    Input Text   	new-task-name   	Demo Task 2
	Press Key   	new-task-name   	\\13
    Input Text   	new-task-name   	Demo Task 3
	Press Key   	new-task-name   	\\13
    page should contain  Demo Task 3

Test Task with Sort
    [Documentation]         Inputs the tasks, then re-sorts them, and confirms the correct task is in the correct spot.
    go to                   http://www.worldtreesoftware.com/apps/examples5947/example1.2/taskAtHand.html
    input text              id=new-task-name    test 1
    press key               id=new-task-name    \\13
    input text              id=new-task-name    test 2
    press key               id=new-task-name    \\13
    click button            xpath=(.//*[normalize-space(text()) and normalize-space(.)='X'])[2]/following::button[1]
    element text should be  css=#task-list .task:nth-of-type(1) span  test 2


Test Canvas Draw
    [Documentation]     Sample mouse control using PyAutoGUI
    go to               http://www.worldtreesoftware.com/apps/examples5947/example4.1/canvasPad.html
    sleep  1s
    canvas

Test Piano
    go to  http://www.worldtreesoftware.com/apps/examples5947/example6.2/piano.html
    sleep  1s
    Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[1]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[4]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[7]
	sleep  .4
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[8]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[10]
    SLEEP  .3s
    Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[10]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[7]
	sleep  .5
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[1]
    sleep  .2s
    Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[7]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[8]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[10]
    sleep  .5s
    Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[10]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[6]
	Click Element   	xpath=(.//div[contains(normalize-space(@class), "piano-key white")])[7]

Test Gradient Cycle
    [Documentation]     pyautogui control for reference
    go to               https://html5demos.com/canvas-grad/
    sleep  1s
    swirl

Test Drag and Drop
    [Documentation]     Drags and drops all items into a bin then confirms last item is gone.
    go to               https://html5demos.com/drag/
    sleep  1s
    drag n drop
	Page Should Not Contain   	five

