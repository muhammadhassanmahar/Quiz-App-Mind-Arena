from typing import List, Optional
from bson import ObjectId
from pymongo.collection import Collection
from models.contest_model import Contest
from schemas.contest_schema import ContestCreateSchema

class ContestService:
    def __init__(self, contest_collection: Collection):
        self.contest_collection = contest_collection

    def create_contest(self, contest_data: ContestCreateSchema) -> dict:
        """
        Creates a new contest in the database.
        """
        contest = contest_data.dict()
        contest['players'] = []
        result = self.contest_collection.insert_one(contest)
        contest['_id'] = str(result.inserted_id)  # store ObjectId as string
        return contest

    def list_contests(self) -> List[dict]:
        """
        Returns a list of all contests.
        """
        contests = []
        for contest in self.contest_collection.find():
            contest['_id'] = str(contest['_id'])
            contests.append(contest)
        return contests

    def join_contest(self, contest_id: str, player_email: str) -> bool:
        """
        Adds a player to a contest if there is space.
        """
        contest = self.contest_collection.find_one({"_id": ObjectId(contest_id)})
        if contest and len(contest.get("players", [])) < contest.get("max_players", 20):
            self.contest_collection.update_one(
                {"_id": ObjectId(contest_id)},
                {"$addToSet": {"players": player_email}}
            )
            return True
        return False