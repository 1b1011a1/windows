import ctypes
import time
import cv2
import numpy as np
from PIL import ImageGrab
from pywinauto.application import Application
import pyautogui

def open_uri(uri):
    ShellExecute = ctypes.windll.shell32.ShellExecuteW
    hinstance = ShellExecute(None, 'open', uri, None, None, 1)
    if hinstance <= 32:
        print(f"Failed to open {uri}")


def click(x, y):
    ctypes.windll.user32.SetCursorPos(x, y)
    ctypes.windll.user32.mouse_event(2, 0, 0, 0, 0)
    ctypes.windll.user32.mouse_event(4, 0, 0, 0, 0)


def find_and_click_target_image(template_path, match_threshold=0.8):
    template = cv2.imread(template_path)
    w, h, _ = template.shape[::-1]
    img = np.array(ImageGrab.grab())
    img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
    res = cv2.matchTemplate(img, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    if max_val > match_threshold:
        top_left = max_loc
        bottom_right = (top_left[0] + w, top_left[1] + h)
        target_x = top_left[0]
        target_y = top_left[1]
        click(target_x, target_y)
        return True
    else:
        return False

def scroll_down(scroll_amount=1):
    pyautogui.scroll(-scroll_amount)

def type_text(text):
    pyautogui.write(text, interval=0.1)

if __name__ == "__main__":
    open_uri("ms-settings:time-language")
    time.sleep(1)
    find_and_click_target_image('C:\1.png')
    time.sleep(2)
    find_and_click_target_image('C:\2.png')
    time.sleep(2)
    find_and_click_target_image('C:\3.png')
    time.sleep(1)
    scroll_down(300)
    time.sleep(2)
    find_and_click_target_image('C:\4.png')
    time.sleep(2)
    find_and_click_target_image('C:\5.png')
    time.sleep(2)
    find_and_click_target_image('C:\6.png')
    result = False
    while not result:
        result = find_and_click_target_image('C:\7.png')
