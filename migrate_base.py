import sqlite3
import os

con = sqlite3.connect('{}/ts.db'.format(os.environ['DB_PATH']))

cursor = con.cursor()
cursor.execute('''CREATE TABLE usagetime(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              usage REAL,
              ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );''')
con.commit()
con.close()