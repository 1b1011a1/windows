import ctypes

def logoff_current_user():
    flags = 0x00000000 | 0x00000004 | 0x00000010
    ctypes.windll.user32.ExitWindowsEx(flags, 0)

logoff_current_user()