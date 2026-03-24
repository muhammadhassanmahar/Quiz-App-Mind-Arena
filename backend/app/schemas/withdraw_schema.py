from pydantic import BaseModel, EmailStr

class WithdrawCreateSchema(BaseModel):
    email: EmailStr
    amount: int

class WithdrawResponseSchema(WithdrawCreateSchema):
    class Config:
        orm_mode = True