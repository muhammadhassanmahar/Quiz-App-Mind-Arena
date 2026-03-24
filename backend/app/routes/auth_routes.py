from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from services.auth_service import AuthService
from pymongo import MongoClient

# MongoDB connection
client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
user_collection = db["users"]

auth_service = AuthService(user_collection)
router = APIRouter(prefix="/auth", tags=["Auth"])

# Schemas
class LoginRequest(BaseModel):
    email: str
    password: str

class RegisterRequest(BaseModel):
    name: str
    email: str
    role: str = "user"
    wallet: int = 0

@router.post("/register")
def register_user(data: RegisterRequest):
    existing_user = auth_service.get_user_by_email(data.email)
    if existing_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    user = auth_service.create_user(data)
    return {"status": "success", "user": user}

@router.post("/login")
def login_user(data: LoginRequest):
    user = auth_service.get_user_by_email(data.email)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    # Password check skipped here for simplicity
    return {"status": "success", "user": user}