from fastapi import APIRouter
from services.wallet_service import WalletService
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
user_collection = db["users"]

wallet_service = WalletService(user_collection)
router = APIRouter(prefix="/wallet", tags=["Wallet"])

@router.get("/{email}")
def get_wallet(email: str):
    balance = wallet_service.get_wallet_balance(email)
    return {"email": email, "wallet": balance}

@router.post("/deposit")
def deposit(email: str, amount: int):
    wallet_service.add_balance(email, amount)
    return {"status": "success"}

@router.post("/withdraw")
def withdraw(email: str, amount: int):
    wallet_service.deduct_balance(email, amount)
    return {"status": "success"}