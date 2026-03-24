from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field, EmailStr
from typing import List

# Import config
from config.config import settings

app = FastAPI(title="Mind Arena API")

# CORS middleware (allow requests from frontend)
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
    
    return {"status": "success", "user": {"email": email, "role": "user"}}

# =================== WALLET ===================
@app.post("/deposit")
def deposit(payload: WalletRequest):
    amount = payload.amount
    return {"status": "success", "amount": amount, "message": "Deposit request received"}

@app.post("/withdraw")
def withdraw(payload: WalletRequest):
    amount = payload.amount
    return {"status": "success", "amount": amount, "message": "Withdraw request received"}

# =================== CONTEST EXAMPLE ===================
@app.get("/contests")
def get_contests():
    # Example static contest data
    contests = [
        {"id": "c1", "fee": 100, "players": 10, "max_players": 20},
        {"id": "c2", "fee": 200, "players": 5, "max_players": 20},
    ]
    return contests

@app.post("/join-contest")
def join_contest(contest_id: str):
    # Demo join contest
    return {"status": "success", "contest_id": contest_id, "message": "Joined contest successfully"}

@app.get("/questions/{contest_type}")
def get_questions(contest_type: int):
    # Example static questions
    questions = [
        {"question": "2 + 2 = ?", "options": ["A:2","B:3","C:4","D:5"], "correct": "C"},
        {"question": "5 + 3 = ?", "options": ["A:7","B:8","C:6","D:9"], "correct": "B"},
    ]
    return questions