# schemas/contest_schema.py

from pydantic import BaseModel, Field
from typing import List, Optional

class ContestCreateSchema(BaseModel):
    name: str = Field(..., example="Math Quiz Contest")
    fee: int = Field(..., example=100)
    max_players: int = Field(default=20, example=20)
    contest_type: str = Field(..., example="quiz")  # quiz, contest type etc.

class ContestResponseSchema(BaseModel):
    id: str
    name: str
    fee: int
    max_players: int
    contest_type: str
    players: List[str] = []

    class Config:
        orm_mode = True