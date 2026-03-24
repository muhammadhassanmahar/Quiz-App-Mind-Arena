from pydantic import BaseModel, EmailStr

class UserModel(BaseModel):
    email: EmailStr
    role: str = "user"   # user or admin
    wallet: int = 0