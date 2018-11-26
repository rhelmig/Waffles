from selenium import webdriver
from selenium.webdriver import ActionChains
from pytest import mark
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec
import pyautogui
import time

'''
Sample JQuery Solutions

pytest -v -s --html=report.html --tb=short

NOTES:  Action chains on jquery's running in sequence on a single browser were showing inconsistent results. 
        Resulted in StaleElementReferenceException's despite having acceptable webdriverwaits in place.
        Running them individually showed no issues. Need to review solutions.
    
'''

# driver = webdriver.Chrome()
# driver.get('http://jqueryui.com/')
# driver.maximize_window()
# driver.implicitly_wait(10)


# Drag jqeury item inside of a frame down to the bottom right corner
@mark.drag
@mark.smoke
def test_drag(driver):
    # go to the page
    driver.get('http://jqueryui.com/draggable/')
    # switch to frame
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    # grab the drag and drop it in lower right
    source = driver.find_element_by_xpath("/html//div[@id='draggable']")
    WebDriverWait(driver, 10).until(ec.element_to_be_clickable((By.XPATH, "/html//div[@id='draggable']")))
    action_chains = ActionChains(driver)
    action_chains.drag_and_drop_by_offset(source, 460, 290).perform()


# drag n drop from inside a frame.
@mark.dnd
@mark.smoke
def test_drag_n_drop(driver):
    driver.get('http://jqueryui.com/droppable/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    pyautogui.click(750, 600)
    pyautogui.dragTo(960, 600, 1)
    target = driver.find_element_by_xpath("/html//div[@id='droppable']")
    assert target.text == 'Dropped!'


# Resize the element.  Get the 'style' Attribute and then confirm the correct size.
@mark.re
@mark.smoke
def test_resize(driver):
    driver.get('http://jqueryui.com/resizable/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    source = driver.find_element_by_xpath('//*[@id="resizable"]/div[3]')
    action_chains = ActionChains(driver)
    action_chains.drag_and_drop_by_offset(source, 200, 200).perform()
    size = driver.find_element_by_xpath('//*[@id="resizable"]').get_attribute('style')
    print(size)
    assert size == 'width: 350px; height: 350px;'


# select multiple items
# then verify that the last selected items class name changed to the correct attribute
@mark.sel
def test_multi_select(driver):
    driver.get('http://jqueryui.com/selectable/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    WebDriverWait(driver, 10).until(
        ec.element_to_be_clickable((By.XPATH, "//ol[@id='selectable']/li[.='Item 3']")))
    action_chains = ActionChains(driver)
    action_chains.click_and_hold(driver.find_element_by_xpath("//ol[@id='selectable']/li[.='Item 3']")).perform()
    action_chains.move_to_element(driver.find_element_by_xpath("//ol[@id='selectable']/li[.='Item 5']")).perform()
    check = driver.find_element_by_xpath("//ol[@id='selectable']/li[.='Item 5']").get_attribute('class')
    print(check)
    assert check == 'ui-widget-content ui-selectee ui-selecting'


# Sort item #7 into position #2. Then verify that #6 is now positioned in slot 7.
@mark.sort
def test_sort(driver):
    driver.get('http://jqueryui.com/sortable/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    source = driver.find_element_by_css_selector("#sortable > li:nth-child(7)")
    target = driver.find_element_by_css_selector("#sortable > li:nth-child(2)")
    WebDriverWait(driver, 10).until(ec.element_to_be_clickable((By.CSS_SELECTOR, "#sortable > li:nth-child(7)")))
    action_chains = ActionChains(driver)
    action_chains.click_and_hold(source).move_to_element(target).release().perform()
    chk = driver.find_element_by_xpath('//*[@id="sortable"]/li[7]')
    print(chk.text)
    assert chk.text == 'Item 6'


# Click through accordions, verify section 3 is the final visible result via attribute setting.
@mark.acc
def test_accordion(driver):
    driver.get('http://jqueryui.com/accordion/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    WebDriverWait(driver, 10).until(ec.element_to_be_clickable((By.CSS_SELECTOR, "[aria-controls='ui-id-8']")))
    driver.find_element_by_css_selector("[aria-controls='ui-id-8']").click()
    time.sleep(.5)
    driver.find_element_by_css_selector("[aria-controls='ui-id-4']").click()
    time.sleep(.5)
    driver.find_element_by_css_selector("[aria-controls='ui-id-2']").click()
    time.sleep(.5)
    driver.find_element_by_css_selector("[aria-controls='ui-id-6']").click()
    check = driver.find_element_by_xpath("//div[@id='accordion']/h3[3]").get_attribute('aria-expanded')
    print(check)
    assert check == 'true'


# Need an assert/verify solution here
@mark.ac
def test_autocomplete(driver):
    driver.get('http://jqueryui.com/autocomplete/')
    driver.switch_to.frame(driver.find_element_by_css_selector('#content > iframe'))
    WebDriverWait(driver, 10).until(ec.element_to_be_clickable((By.CSS_SELECTOR, "[autocomplete='off']")))
    driver.find_element_by_css_selector("[autocomplete='off']").send_keys('a')
    time.sleep(1)
    pyautogui.press('down')
    pyautogui.press('down')
    pyautogui.press('down')
    pyautogui.press('down')
    pyautogui.press('enter')
