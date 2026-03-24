from fastapi import APIRouter
from pydantic import BaseModel
from services.contest_service import ContestService
from pymongo import MongoClient
from bson import ObjectId

client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
contest_collection = db["contests"]

contest_service = ContestService(contest_collection)
router = APIRouter(prefix="/contests", tags=["Contests"])

class ContestCreateRequest(BaseModel):
    name: str
    fee: int
    max_players: int = 20

@router.get("/")
def list_contests():
    return contest_service.list_contests()

@router.post("/")
def create_contest(data: ContestCreateRequest):
    contest = contest_service.create_contest(data)
    return {"status": "success", "contest": contest}

@router.post("/join")
def join_contest(contest_id: str, email: str):
    result = contest_service.join_contest(contest_id, email)
    if result:
        return {"status": "success"}
    return {"status": "failed", "message": "Contest full or invalid"}