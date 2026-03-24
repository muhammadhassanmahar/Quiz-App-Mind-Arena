from fastapi import APIRouter
from services.admin_service import AdminService
from pymongo import MongoClient
from bson import ObjectId

client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
deposit_collection = db["deposits"]
withdraw_collection = db["withdraws"]

admin_service = AdminService(deposit_collection, withdraw_collection)
router = APIRouter(prefix="/admin", tags=["Admin"])

@router.get("/deposits")
def list_deposits():
    return admin_service.list_deposits()

@router.get("/withdraws")
def list_withdraws():
    return admin_service.list_withdraws()

@router.post("/deposits/approve")
def approve_deposit(deposit_id: str):
    admin_service.approve_deposit(ObjectId(deposit_id))
    return {"status": "success"}

@router.post("/withdraws/approve")
def approve_withdraw(withdraw_id: str):
    admin_service.approve_withdraw(ObjectId(withdraw_id))
    return {"status": "success"}