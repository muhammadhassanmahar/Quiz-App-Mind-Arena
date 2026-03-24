from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

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

# Root route
@app.get("/")
def root():
    return {"message": "Mind Arena API is running"}

# Example login route
@app.post("/login")
def login(payload: dict):
    email = payload.get("email")
    password = payload.get("password")
    # Demo admin login
    if email == "immaharhasaan@gmail.com" and password == "1234":
        return {"status": "success", "user": {"email": email, "role": "admin"}}
    return {"status": "success", "user": {"email": email, "role": "user"}}

# Example deposit route
@app.post("/deposit")
def deposit(payload: dict):
    amount = payload.get("amount")
    return {"status": "success", "amount": amount, "message": "Deposit request received"}

# Example withdraw route
@app.post("/withdraw")
def withdraw(payload: dict):
    amount = payload.get("amount")
    return {"status": "success", "amount": amount, "message": "Withdraw request received"}