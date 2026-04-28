from fastapi import FastAPI, HTTPException
import psycopg2

app = FastAPI()

conn = psycopg2.connect(
    dbname="questplanner_db",
    user="quest_user",
    password="12345678",
    host="db"
)

@app.get("/")
def root():
    return {"message": "QuestPlanner API работает 🚀"}

@app.get("/users")
def get_users():
    cur = conn.cursor()
    cur.execute("SELECT id, username, level, xp FROM users")
    rows = cur.fetchall()
    cur.close()

    users = []
    for row in rows:
        users.append({
            "id": row[0],
            "username": row[1],
            "level": row[2],
            "xp": row[3]
        })

    return users
@app.get("/users/{user_id}")
def get_user(user_id: int):
    cur = conn.cursor()
    cur.execute("SELECT id, username, level, xp FROM users WHERE id = %s", (user_id,))
    row = cur.fetchone()
    cur.close()

    if row is None:
        raise HTTPException(status_code=404, detail="User not found")

    return {
        "id": row[0],
        "username": row[1],
        "level": row[2],
        "xp": row[3]
    }
