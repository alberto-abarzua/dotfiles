#!/usr/bin/env python3

import argparse
from pathlib import Path
import os


def main(force_install):
    CURRENT_FILE_DIR = Path(__file__).parent.absolute()
    USER_XDG_CONFIG_HOME = os.environ.get("XDG_CONFIG_HOME", None)

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

    print("Installing dotfiles...")

    USER_HOME_PATH = Path.home()

    if USER_XDG_CONFIG_HOME is None:
        print("XDG_CONFIG_HOME is not set, using HOME/.config")
        USER_XDG_CONFIG_HOME = USER_HOME_PATH / ".config"

    USER_HOME_PATH = Path(USER_HOME_PATH)
    USER_XDG_CONFIG_HOME_PATH = Path(USER_XDG_CONFIG_HOME)

    failed_files = []

    for path in TO_CONFIG_HOME:
        target = USER_XDG_CONFIG_HOME_PATH / path.name
        if force_install and target.exists():
            print(f"Removing {target}...")
            os.system(f"rm -rf {target}")

        print(f'Symbolic linking {path} to {USER_XDG_CONFIG_HOME}...')
        exit_code = os.system(f"ln -s {path} {USER_XDG_CONFIG_HOME}")
        if exit_code != 0:
            failed_files.append(target)

    for path in TO_HOME:
        for file in path.iterdir():
            target = USER_HOME_PATH / file.name
            if force_install and target.exists():
                print(f"Removing {target}...")
                os.system(f"rm -rf {target}")
            print(f'Symbolic linking {file} to {USER_HOME_PATH}...')
            exit_code = os.system(f"ln -s {file} {USER_HOME_PATH}")
            if exit_code != 0:
                failed_files.append(target)
    if len(failed_files) == 0:
        print("Successfully installed dotfiles!")
    else:
        print("Some files failed to install:")
        for file in failed_files:
            print(file)
        print("To remove all failed files run:\n")
        print("rm -r " + " ".join([str(file) for file in failed_files]))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Install dotfiles.')
    parser.add_argument('--force', action='store_true',
                        help='Forcefully install by removing existing files')
    args = parser.parse_args()
    main(args.force)
