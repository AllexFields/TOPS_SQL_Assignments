import sqlite3

# Create or connect to SQLite database file
conn = sqlite3.connect("my_database.db")
cursor = conn.cursor()

# 1. Restaurants table
cursor.execute("""
CREATE TABLE IF NOT EXISTS restaurants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    cuisine TEXT,
    rating REAL
);
""")
cursor.executemany("INSERT INTO restaurants (name, cuisine, rating) VALUES (?, ?, ?)", [
    ("Spice Hub", "Indian", 4.5),
    ("Pasta Palace", "Italian", 4.2),
    ("Sushi World", "Japanese", 4.8),
    ("Burger Town", "American", 3.9),
    ("Taco Fiesta", "Mexican", 4.1)
])

# 2. Movies table
cursor.execute("""
CREATE TABLE IF NOT EXISTS movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    rating REAL
);
""")
cursor.executemany("INSERT INTO movies (title, rating) VALUES (?, ?)", [
    ("Inception", 8.8),
    ("The Dark Knight", 9.0),
    ("Interstellar", 8.6),
    ("Avengers", 7.9),
    ("Parasite", 8.6)
])

# 3. Orders table
cursor.execute("""
CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    food_item TEXT
);
""")
cursor.executemany("INSERT INTO orders (user_id, food_item) VALUES (?, ?)", [
    (1, "Pizza"), (2, "Burger"), (1, "Pasta"), (3, "Pizza"),
    (2, "Sushi"), (1, "Pizza"), (3, "Burger"), (4, "Taco"),
    (1, "Pizza"), (2, "Pizza")
])

# 4. Matches table
cursor.execute("""
CREATE TABLE IF NOT EXISTS matches (
    match_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team1 TEXT,
    team2 TEXT,
    winner TEXT
);
""")
cursor.executemany("INSERT INTO matches (team1, team2, winner) VALUES (?, ?, ?)", [
    ("Mumbai Indians", "CSK", "Mumbai Indians"),
    ("RCB", "KKR", "RCB"),
    ("Delhi Capitals", "CSK", "CSK"),
    ("Mumbai Indians", "RCB", "Mumbai Indians"),
    ("KKR", "Delhi Capitals", "KKR")
])

# 5. Users table
cursor.execute("""
CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
""")
cursor.executemany("INSERT INTO users (name) VALUES (?)", [
    ("Alice",), ("Bob",), ("Charlie",), ("David",), ("Eva",)
])

# Commit and close
conn.commit()
conn.close()