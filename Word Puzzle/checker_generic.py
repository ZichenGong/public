"""CSC108: Fall 2020 -- Assignment 1: Phrase Puzzler 

This code is provided solely for the personal and private use of students 
taking the CSC108 course at the University of Toronto. Copying for purposes 
other than this use is expressly prohibited. All forms of distribution of 
this code, whether as given or with any changes, are expressly prohibited.

All of the files in this directory and all subdirectories are:
Copyright (c) 2020 Mario Badr, Jennifer Campbell, Tom Fairgrieve, Diane Horton, 
Michael Liut, Jacqueline Smith, and Anya Tafliovich.
"""

import sys
from typing import Tuple


def run_pyta(filename: str, config_file: str) -> None:
    """Run PYTA with configuration config_file on the file named filename.

    """

    sys.path.insert(0, 'pyta')
    import python_ta
    python_ta.check_all(filename, config=config_file)


def check(func: callable, args: list,
          expected: type) -> Tuple[bool, object]:
    """Check if func(args) returns a result of type expected.

    Return (True, result-of-call) if the check succeeds.
    Return (False, error-or-failure-message) if anything goes wrong.
    """

    try:
        returned = func(*args)
    except Exception as exn:
        return (False, _error_message(func, args, exn))

    if isinstance(returned, expected):
        return (True, returned)

    return (False, _type_error_message(func, expected, returned))


def _type_error_message(func: callable, expected: type,
                        got: object) -> str:
    """Return an error message for function func returning got, where the
    correct return type is expected.

    """

    return ('{} should return a {}, but returned {}' +
            '.').format(func.__name__, expected.__name__, got)


def _error_message(func: callable, args: list,
                   error: Exception) -> str:
    """Return an error message: func(args) raised an error."""

    return 'The call {}({}) caused an error: {}'.format(
        func.__name__, ','.join(map(str, args)), error)
