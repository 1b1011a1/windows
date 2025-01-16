import ctypes
import time
import cv2
import numpy as np
from PIL import ImageGrab
from pywinauto.application import Application
import pyautogui

def open_uri(uri):
    """
    使用 ShellExecute 打开指定的 URI
    :param uri: 要打开的 URI
    """
    ShellExecute = ctypes.windll.shell32.ShellExecuteW
    hinstance = ShellExecute(None, 'open', uri, None, None, 1)
    if hinstance <= 32:
        print(f"Failed to open {uri}")


def click(x, y):
    """
    模拟鼠标点击操作
    :param x: 点击位置的 x 坐标
    :param y: 点击位置的 y 坐标
    """
    ctypes.windll.user32.SetCursorPos(x, y)
    ctypes.windll.user32.mouse_event(2, 0, 0, 0, 0)  # 鼠标左键按下
    ctypes.windll.user32.mouse_event(4, 0, 0, 0, 0)  # 鼠标左键释放


def find_and_click_target_image(template_path, match_threshold=0.8):
    """
    查找并点击目标图像
    :param template_path: 目标图像模板的文件路径
    :param match_threshold: 匹配阈值，默认为 0.8
    """

    # 读取目标元素的模板图像
    template = cv2.imread(template_path)
    w, h, _ = template.shape[::-1]

    # 获取全屏截图
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
        print(f"已找到目标,X={target_x} Y={target_y}")
        return True
    else:
        print("未找到目标")
        return False

def scroll_down(scroll_amount=1):
    """
    此函数使用 pyautogui 实现鼠标滚轮向下滚动
    :param scroll_amount: 滚动的格数，默认为 1
    """
    pyautogui.scroll(-scroll_amount)

def type_text(text):
    """
    此函数使用 pyautogui 输入文本
    :param text: 要输入的文本内容
    """
    pyautogui.write(text, interval=0.1)

if __name__ == "__main__":
    open_uri("ms-settings:time-language")
    time.sleep(1)
    find_and_click_target_image('1.png')
    time.sleep(2)
    find_and_click_target_image('2.png')
    time.sleep(2)
    find_and_click_target_image('3.png')
    time.sleep(1)
    scroll_down(300)
    time.sleep(2)
    find_and_click_target_image('4.png')
    time.sleep(2)
    find_and_click_target_image('5.png')
    time.sleep(2)
    find_and_click_target_image('6.png')
    result = False
    while not result:
        result = find_and_click_target_image('7.png')
    ctypes.windll.user32.ExitWindowsEx(0, 0)