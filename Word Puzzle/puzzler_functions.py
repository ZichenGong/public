
"""CSC108: Fall 2020 -- Assignment 1: Phrase Puzzler 

This code is provided solely for the personal and private use of students 
taking the CSC108 course at the University of Toronto. Copying for purposes 
other than this use is expressly prohibited. All forms of distribution of 
this code, whether as given or with any changes, are expressly prohibited.

All of the files in this directory and all subdirectories are:
Copyright (c) 2020 Mario Badr, Jennifer Campbell, Tom Fairgrieve, Diane Horton, 
Michael Liut, Jacqueline Smith, and Anya Tafliovich.
"""

# The next several lines contain 14 constants for you to use in your code.
# You must use these constants instead of the values they refer to. 
# E.g. Use HIDDEN instead of '^'. You may not need to use all of the 
# constants provided.

# points earned on each occurrence of a correctly guessed consonant
CONSONANT_POINTS = 1

# cost of buying a vowel, does not depend on the number of occurrences
VOWEL_PRICE = 1

# players' names
PLAYER_ONE = 'Player One'
PLAYER_TWO = 'Player Two'

# menu options
CONSONANT = 'C'  # guess a consonant
VOWEL = 'V'      # buy a vowel
SOLVE = 'S'      # try to solve the puzzle
QUIT = 'Q'       # quit the game

# symbol used for hidden characters
HIDDEN = '^'

# Game types
HUMAN = 'H-'             # one player, human
HUMAN_HUMAN = 'HH'       # two players, both human
HUMAN_COMPUTER = 'HC'    # two players, human and computer

# all consonants and all vowels
ALL_CONSONANTS = 'bcdfghjklmnpqrstvwxyz'
ALL_VOWELS = 'aeiou'


# This function is complete and you must not change it.
def is_game_over(puzzle: str, view: str, move: str) -> bool:
    """Return True if and only if puzzle and view are a winning
    combination or move is QUIT.

    >>> is_game_over('apple', 'a^^le', 'V')
    False
    >>> is_game_over('apple', 'a^^le', 'Q')
    True
    >>> is_game_over('apple', 'apple', 'S')
    True
    """

    return move == QUIT or puzzle == view


def is_one_player_game(game_type: str) -> bool:
    """Return True if and only if game_type is a one-player game. 
        
    >>> is_one_player_game('H-')
    True
    >>> is_one_player_game('HH')
    False
    >>> is_one_player_game('HC')
    False
    """

    # Write your code for is_one_player_game here
    return game_type == HUMAN


def is_human(current_player: str, game_type: str) -> bool:
    """Return True if and only if current_player represents a human in a
    game of type game_type.

    >>> is_human('Player One', 'H-')
    True
    >>> is_human('Player One', 'HH')
    True
    >>> is_human('Player Two', 'HH')
    True
    >>> is_human('Player One', 'HC')
    True
    >>> is_human('Player Two', 'HC')
    False
    """

    # Write your code for is_human here
    if current_player == PLAYER_ONE:
        return game_type[0] == 'H'
    else:
        return game_type[1] == 'H'
    
    
# Write the rest of your functions here
def current_player_score(player_one_score: int, player_two_score: int, 
                         current_player: str) -> int:
    """Return the player_one_score or player_two_score of current_player.
    
    >>>current_player_score(11, 10, 'Player One')
    11
    >>>current_player_score(1, 2, 'Player Two')
    2
    """
    
    if current_player == PLAYER_ONE:
        return player_one_score
    else:
        return player_two_score
    
    
def is_bonus_letter(bonus_letter: str, puzzle: str, view: str) -> bool:
    """Return True if and only if bonus_letter is a consonant that is
    in puzzle and is currently hidden in the view.
    
    >>>is_bonus_letter('p', 'apple', 'a^^le')
    True
    >>>is_bonus_letter('a', 'apple', '^pple')
    False
    >>>is_bonus_letter('c', 'apple', 'a^^le')
    False
    """
    
    return bonus_letter in puzzle and bonus_letter in ALL_CONSONANTS and \
           bonus_letter not in view
    
    
def update_char_view(puzzle: str, view: str, index: int, guess: str) -> str:
    """Return updated view of the puzzle with the guess revealed if the guess 
    is at the index of that puzzle; otherwise, the view should not change.
    
    Precondition: index >= 0
    
    >>>update_char_view('apple', '^pple', 0, 'a')
    'a'
    >>>update_char_view('breakfast', 'brea^fast', 4, 'k')
    'k'
    >>>update_char_view('juice', 'jui^e', 3, 'a')
    '^'
    """
    
    if guess == puzzle[index]:
        return guess
    else:
        return view[index]
    
    
def calculate_score(score: int, num_occurrences: int, move: str) \
    -> int:
    """Return the updated score after the player makes a move and 
    causes num_occurrences of changes to score.
    
    Precondition: move == CONSONANT or mo1:ve == VOWEL
                  num_occurrences >= 0
    
    >>>calculate_score(11, 2, 'C')
    13
    >>>calculate_score(5, 3, 'V')
    4
    """
    
    if move == CONSONANT:
        return score + num_occurrences * CONSONANT_POINTS
    else:
        return score - VOWEL_PRICE
    
    
def next_player(current_player: str, num_occurrences: int, game_type: str) \
    -> str:
    """Return the next current_player after num_occurrences based on 
    current game_type.
    
    Precondition: num_occurrences >= 0
    
    >>>next_player('Player One', 2, 'HH')
    'Player One'
    >>>next_player('Player Two', 0, 'HH')
    'Player One'
    >>>next_player('Player One', 0, 'HC')
    'Player Two'
    >>>next_player('Player One', 0, 'H-')
    'Player One'
    """
    
    if num_occurrences == 0 and game_type == HUMAN:
        return current_player
    elif num_occurrences == 0 and current_player == PLAYER_ONE \
         and game_type != HUMAN:
        return PLAYER_TWO
    elif num_occurrences == 0 and current_player == PLAYER_TWO \
         and game_type != HUMAN:
        return PLAYER_ONE
    else:
        return current_player
    
    
def is_hidden(index: int, puzzle: str, view: str) -> bool:
    """Return True if and only if the character index is revealed as hidden in
    the view of puzzle.
    
    >>>is_hidden(4, 'banana', '^ana^a')
    False
    >>>is_hidden(-2, 'size', 'si^e')
    True
    """
    
    return puzzle[index] not in view
    
    
def erase(letter: str, index: int) -> str:
    """Remove the character at the given index and then return the given
    letters without the character.
    
    Precondition: index >= 0
    
    >>>erase('abcdef', 3)
    'abcef'
    >>>erase('katherine', 5)
    'katheine'
    """
    
    return letter[:index] + letter[index+1:]