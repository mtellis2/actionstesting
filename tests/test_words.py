import pytest
import words


def test_words():
    word = words.get_random_word(4)
    with open("wordlist.txt", "r") as f:
        file_content = f.readlines()
        content = [x.strip() for x in file_content]
    assert (word in content) is True
