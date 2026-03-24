from models.user_model import User
from schemas.user_schema import UserCreateSchema
from passlib.context import CryptContext
from bson.objectid import ObjectId
from pymongo.collection import Collection

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

class AuthService:
    def __init__(self, user_collection: Collection):
        self.user_collection = user_collection

    def create_user(self, user_data: UserCreateSchema):
        # Hash password if you had one
        # hashed_password = pwd_context.hash(user_data.password)
        user = user_data.dict()
        result = self.user_collection.insert_one(user)
        user['_id'] = result.inserted_id
        return user

    def get_user_by_email(self, email: str):
        return self.user_collection.find_one({"email": email})

    def is_admin(self, email: str):
        user = self.get_user_by_email(email)
        return user and user.get("role") == "admin"