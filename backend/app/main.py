from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field, EmailStr
from typing import List, Optional

# Import config
from config.config import settings

app = FastAPI(title="Mind Arena API")

# =================== CORS ===================
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.ALLOWED_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# =================== MODELS ===================
class LoginRequest(BaseModel):
    email: EmailStr
    password: str = Field(..., min_length=4)

class WalletRequest(BaseModel):
    amount: int = Field(..., gt=0)

class Contest(BaseModel):
    id: str
    fee: int
    players: int
    max_players: int

class Question(BaseModel):
    question: str
    options: List[str]
    correct: str

# =================== ROOT ===================
@app.get("/")
def root():
    return {"message": "Mind Arena API is running"}

# =================== AUTH ===================
@app.post("/login")
def login(payload: LoginRequest):
    email = payload.email
    password = payload.password

    # Demo admin login
    if email == "immaharhasaan@gmail.com" and password == "1234":
        return {"status": "success", "user": {"email": email, "role": "admin"}}
    
    # Example user login
    return {"status": "success", "user": {"email": email, "role": "user"}}

# =================== WALLET ===================
@app.post("/deposit")
def deposit(payload: WalletRequest):
    amount = payload.amount
    # Here you can connect to DB or wallet service
    return {"status": "success", "amount": amount, "message": "Deposit request received"}

@app.post("/withdraw")
def withdraw(payload: WalletRequest):
    amount = payload.amount
    # Here you can connect to DB or wallet service
    return {"status": "success", "amount": amount, "message": "Withdraw request received"}

# =================== CONTESTS ===================
# Example static contests
contests_db = [
    {"id": "c1", "fee": 100, "players": 10, "max_players": 20},
    {"id": "c2", "fee": 200, "players": 5, "max_players": 20},
]

@app.get("/contests", response_model=List[Contest])
def get_contests():
    return contests_db

@app.post("/join-contest")
def join_contest(contest_id: str):
    contest = next((c for c in contests_db if c["id"] == contest_id), None)
    if not contest:
        raise HTTPException(status_code=404, detail="Contest not found")
    if contest["players"] >= contest["max_players"]:
        raise HTTPException(status_code=400, detail="Contest is full")
    
    contest["players"] += 1
    return {"status": "success", "contest_id": contest_id, "message": "Joined contest successfully"}

# =================== QUESTIONS ===================
questions_db = {
    1: [
        {"question": "2 + 2 = ?", "options": ["A:2","B:3","C:4","D:5"], "correct": "C"},
        {"question": "5 + 3 = ?", "options": ["A:7","B:8","C:6","D:9"], "correct": "B"},
    ],
    2: [
        {"question": "10 - 4 = ?", "options": ["A:5","B:6","C:7","D:8"], "correct": "B"},
    ]
}

@app.get("/questions/{contest_type}", response_model=List[Question])
def get_questions(contest_type: int):
    return questions_db.get(contest_type, [])