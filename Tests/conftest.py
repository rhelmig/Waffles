from selenium import webdriver
from pytest import fixture


@fixture(scope='session')
def driver():
    driver = webdriver.Chrome()
    # driver.get('http://www.teachmeselenium.com/automation-practice/')
    driver.implicitly_wait(15)
    driver.maximize_window()
    yield driver

    # Teardown
    print("  --> teardown complete")
