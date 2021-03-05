import sys
import time
import sqlite3
import os

session_begin_time = None

def read_word():
    word = ''
    while True:
        t = sys.stdin.read(1)
        if t == ' ' or t == '\n':
            return word
        word += t


def handle_change(code):
    global session_begin_time

    if code == 70:
        session_begin_time = time.time()
    if code == 20:
        con = sqlite3.connect('{}/ts.db'.format(os.environ['DB_PATH']))  # connecting here to prevent db blocking
        cursor = con.cursor()
        usage_time = time.time() - session_begin_time
        cursor.execute(f"INSERT INTO usagetime(usage) VALUES ({usage_time})")
        con.commit()
        print('usage time', usage_time, 'commited')
        con.close()

if __name__ == '__main__':
    while True:
        wd = read_word()
        if wd == 'uint32':
            handle_change(int(read_word()))
