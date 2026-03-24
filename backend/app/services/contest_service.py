from models.contest_model import Contest
from schemas.contest_schema import ContestCreateSchema
from pymongo.collection import Collection

class ContestService:
    def __init__(self, contest_collection: Collection):
        self.contest_collection = contest_collection

    def create_contest(self, contest_data: ContestCreateSchema):
        contest = contest_data.dict()
        contest['players'] = []
        result = self.contest_collection.insert_one(contest)
        contest['_id'] = result.inserted_id
        return contest

    def list_contests(self):
        return list(self.contest_collection.find())

    def join_contest(self, contest_id: str, player_email: str):
        contest = self.contest_collection.find_one({"_id": contest_id})
        if contest and len(contest.get("players", [])) < contest.get("max_players", 20):
            self.contest_collection.update_one(
                {"_id": contest_id},
                {"$addToSet": {"players": player_email}}
            )
            return True
        return False