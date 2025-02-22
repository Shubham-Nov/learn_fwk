from pathlib import Path
from robot.api import logger
import platform

def get_os_name():
    _os_name = platform.system()
    logger.debug(f"os name =  {_os_name}")

    return _os_name

def get_root_dir_path():
    root_path = Path(__file__).parent.parent
    logger.debug(f"root dir path = {root_path}")

    return root_path

def get_webdriver_path(browser_name):
    _webdriver_dir_path = Path.joinpath(get_root_dir_path(), "resources")
    _os_name = get_os_name().lower()
    _path_dict = {
        'firefox': f"{_os_name}/geckodriver",
        'chrome': f"{_os_name}/chromedriver"
    }
    _webdriver_path = Path.joinpath(_webdriver_dir_path, _path_dict.get(browser_name.lower()))
    logger.debug(f"Webdriver Path = {_webdriver_path}")
    return str(_webdriver_path)



if __name__ == "__main__":
    print(get_root_dir_path())