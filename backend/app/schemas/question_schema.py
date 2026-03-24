from pydantic import BaseModel
from typing import Dict

class QuestionCreateSchema(BaseModel):
    contest_fee: int
    question: str
    options: Dict[str, str]  # {"A": "Option A", "B": "Option B", ...}
    correct: str  # "A", "B", "C", or "D"

class QuestionResponseSchema(QuestionCreateSchema):
    class Config:
        orm_mode = True