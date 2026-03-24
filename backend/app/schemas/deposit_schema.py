from pydantic import BaseModel, EmailStr

class DepositCreateSchema(BaseModel):
    email: EmailStr
    amount: int

class DepositResponseSchema(DepositCreateSchema):
    class Config:
        orm_mode = True