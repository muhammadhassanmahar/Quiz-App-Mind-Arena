from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, EmailStr
from services.auth_service import AuthService
from pymongo import MongoClient
from bson import ObjectId

# ------------------ MongoDB connection ------------------
client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
user_collection = db["users"]

auth_service = AuthService(user_collection)
router = APIRouter(prefix="/auth", tags=["Auth"])

# ------------------ Schemas ------------------
class LoginRequest(BaseModel):
    email: EmailStr
    password: str

class RegisterRequest(BaseModel):
    name: str
    email: EmailStr
    role: str = "user"
    wallet: int = 0
    password: str = "1234"  # For simplicity, you can hash this later

# ------------------ Routes ------------------
@router.post("/register")
def register_user(data: RegisterRequest):
    # Check if email already exists
    existing_user = auth_service.get_user_by_email(data.email)
    if existing_user:
        raise HTTPException(status_code=400, detail="Email already registered")

    # Create new user
    user = auth_service.create_user(data)
    return {"status": "success", "user": user}

@router.post("/login")
def login_user(data: LoginRequest):
    user = auth_service.get_user_by_email(data.email)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Password verification (for now simple string match, later hash check)
    if data.password != user.get("password", ""):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {"status": "success", "user": user}