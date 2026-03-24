from pydantic import BaseModel, EmailStr

# Request schema
class UserCreateSchema(BaseModel):
    email: EmailStr
    role: str = "user"
    wallet: int = 0

# Response schema
class UserResponseSchema(BaseModel):
    email: EmailStr
    role: str
    wallet: int

    class Config:
        orm_mode = True