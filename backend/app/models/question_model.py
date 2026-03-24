from pydantic import BaseModel
from typing import Dict

class QuestionModel(BaseModel):
    contest_fee: int
    question: str
    options: Dict[str, str]  # {"A": "Option A", "B": "Option B", ...}
    correct: str  # "A", "B", "C", or "D"