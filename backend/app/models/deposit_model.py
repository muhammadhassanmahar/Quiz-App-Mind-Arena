from pydantic import BaseModel, EmailStr

class DepositModel(BaseModel):
    email: EmailStr
    amount: int