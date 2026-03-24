from pydantic import BaseModel, EmailStr

class WithdrawModel(BaseModel):
    email: EmailStr
    amount: int