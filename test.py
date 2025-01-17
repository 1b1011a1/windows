import ctypes
import time
import cv2
import numpy as np
from PIL import ImageGrab
from pywinauto.application import Application
import pyautogui

def open_uri(uri):
    """
    ʹ�� ShellExecute ��ָ���� URI
    :param uri: Ҫ�򿪵� URI
    """
    ShellExecute = ctypes.windll.shell32.ShellExecuteW
    hinstance = ShellExecute(None, 'open', uri, None, None, 1)
    if hinstance <= 32:
        print(f"Failed to open {uri}")


def click(x, y):
    """
    ģ�����������
    :param x: ���λ�õ� x ����
    :param y: ���λ�õ� y ����
    """
    ctypes.windll.user32.SetCursorPos(x, y)
    ctypes.windll.user32.mouse_event(2, 0, 0, 0, 0)  # ����������
    ctypes.windll.user32.mouse_event(4, 0, 0, 0, 0)  # �������ͷ�


def find_and_click_target_image(template_path, match_threshold=0.8):
    """
    ���Ҳ����Ŀ��ͼ��
    :param template_path: Ŀ��ͼ��ģ����ļ�·��
    :param match_threshold: ƥ����ֵ��Ĭ��Ϊ 0.8
    """

    # ��ȡĿ��Ԫ�ص�ģ��ͼ��
    template = cv2.imread(template_path)
    w, h, _ = template.shape[::-1]

    # ��ȡȫ����ͼ
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
        print(f"���ҵ�Ŀ��,X={target_x} Y={target_y}")
        return True
    else:
        print("δ�ҵ�Ŀ��")
        return False

def scroll_down(scroll_amount=1):
    """
    �˺���ʹ�� pyautogui ʵ�����������¹���
    :param scroll_amount: �����ĸ�����Ĭ��Ϊ 1
    """
    pyautogui.scroll(-scroll_amount)

def type_text(text):
    """
    �˺���ʹ�� pyautogui �����ı�
    :param text: Ҫ������ı�����
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