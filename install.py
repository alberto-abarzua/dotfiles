#!/usr/bin/env python3

from pathlib import Path
import os


CURRENT_FILE_DIR = Path(__file__).parent.absolute()

USER_XDG_CONFIG_HOME = os.environ.get("XDG_CONFIG_HOME", None)
USER_HOME = os.environ.get("HOME", None)

TO_CONFIG_HOME = [
    CURRENT_FILE_DIR / "nvim",
    CURRENT_FILE_DIR / "alacritty",
    CURRENT_FILE_DIR / "neofetch",
    CURRENT_FILE_DIR / "kitty",
]

TO_HOME = [
    CURRENT_FILE_DIR / "zsh",
    CURRENT_FILE_DIR / "tmux",
]


if __name__ == '__main__':
    print("Installing dotfiles...")

    if USER_HOME is None:
        print("HOME is not set, exiting...")
        exit(1)
    if USER_XDG_CONFIG_HOME is None:
        print("XDG_CONFIG_HOME is not set, using HOME/.config")
        USER_XDG_CONFIG_HOME = USER_HOME + "/.config"

    USER_HOME_PATH = Path(USER_HOME)
    USER_XDG_CONFIG_HOME_PATH = Path(USER_XDG_CONFIG_HOME)

    failed_files = []

    for path in TO_CONFIG_HOME:
        # os.system(f"ln -s {path} {USER_XDG_CONFIG_HOME}")
        exit_code = os.system(f"ln -s {path} {USER_XDG_CONFIG_HOME}")
        if exit_code != 0:
            file_to_rm = USER_XDG_CONFIG_HOME_PATH / path.name
            failed_files.append(file_to_rm)

    for path in TO_HOME:
        for file in path.iterdir():
            exit_code = os.system(f"ln -s {file} {USER_HOME}")
            if exit_code != 0:
                file_to_rm = USER_HOME_PATH / file.name
                failed_files.append(file_to_rm)

    print("Some files failed to install:")
    for file in failed_files:
        print(file)
    # print comamnd to remove all failed files (also dirs)
    print("To remove all failed files run:\n")
    print("rm -r " + " ".join([str(file) for file in failed_files]))
