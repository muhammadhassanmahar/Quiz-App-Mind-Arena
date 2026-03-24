from pymongo.collection import Collection

class WalletService:
    def __init__(self, user_collection: Collection):
        self.user_collection = user_collection

    def add_balance(self, email: str, amount: int):
        self.user_collection.update_one(
            {"email": email},
            {"$inc": {"wallet": amount}}
        )

    def deduct_balance(self, email: str, amount: int):
        self.user_collection.update_one(
            {"email": email},
            {"$inc": {"wallet": -amount}}
        )

    def get_wallet_balance(self, email: str):
        user = self.user_collection.find_one({"email": email})
        return user.get("wallet", 0) if user else 0