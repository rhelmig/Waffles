import pyautogui
import itertools
pyautogui.FAILSAFE = True


# A send keys solution via pyautogui
def send_keys():
    pyautogui.typewrite('TEST.txt')
    pyautogui.press('enter')


# Hack for injecting text inside an empty html body
def iframe_text_solution():
    for _ in itertools.repeat(None, 23):
        pyautogui.press('tab')
    pyautogui.typewrite('This is a test and only a test')


def iframe_text():
    pyautogui.press('tab')
    pyautogui.typewrite('This is a test and only a test')


# Moves the mouse to specified screen location and runs a simple draw pattern
def canvas():
    pyautogui.moveTo(800, 200)
    distance = 50
    while distance > 0:
        pyautogui.dragRel(distance, 0, duration=0.2)  # move right
        distance -= 5
        pyautogui.dragRel(0, distance, duration=0.2)  # move down
        pyautogui.dragRel(-distance, 0, duration=0.2)  # move left
        distance -= 5
        pyautogui.dragRel(0, -distance, duration=0.2)  # move up


def swirl():
    # Need to troubleshoot confirmation solution for the color match.
    pyautogui.moveTo(1500, 10, .3)
    pyautogui.moveTo(1700, 800, .6)
    pyautogui.moveTo(100, 70, .2)
    pyautogui.moveTo(150, 800, .4)
    pyautogui.moveTo(900, 400, .4)
    pyautogui.moveTo(900, 900, .5)
    im = pyautogui.screenshot()
    im.getpixel((900, 900))
#    pyautogui.pixelMatchesColor(900, 900, (199, 45, 38))
    print(im)


def drag_n_drop():
    for _ in itertools.repeat(None, 5):
        pyautogui.moveTo(995, 275)
        pyautogui.dragTo(760, 350, 1)
        pyautogui.dragRel(760, 350, 1)
    pyautogui.moveTo(995, 275)


def scroll():
    pyautogui.scroll(200)
