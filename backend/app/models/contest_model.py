from pydantic import BaseModel
from typing import List

class ContestModel(BaseModel):
    name: str
    fee: int
    max_players: int = 20
    players: List[str] = []