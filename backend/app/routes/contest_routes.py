from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from services.contest_service import ContestService
from pymongo import MongoClient
from bson import ObjectId

# ------------------ MongoDB connection ------------------
client = MongoClient("mongodb://localhost:27017")
db = client["mind_arena"]
contest_collection = db["contests"]

contest_service = ContestService(contest_collection)
router = APIRouter(prefix="/contests", tags=["Contests"])

# ------------------ Schemas ------------------
class ContestCreateRequest(BaseModel):
    name: str
    fee: int
    max_players: int = 20

# ------------------ Routes ------------------
@router.get("/")
def list_contests():
    contests = contest_service.list_contests()
    # Convert ObjectId to str for JSON serialization
    for c in contests:
        c["_id"] = str(c["_id"])
    return contests

@router.post("/")
def create_contest(data: ContestCreateRequest):
    contest = contest_service.create_contest(data)
    # Convert ObjectId to str
    contest["_id"] = str(contest["_id"])
    return {"status": "success", "contest": contest}

@router.post("/join")
def join_contest(contest_id: str, email: str):
    # Convert string ID to ObjectId
    try:
        contest_oid = ObjectId(contest_id)
    except Exception:
        raise HTTPException(status_code=400, detail="Invalid contest ID")

    result = contest_service.join_contest(contest_oid, email)
    if result:
        return {"status": "success", "message": f"{email} joined contest {contest_id}"}
    return {"status": "failed", "message": "Contest full or invalid"}