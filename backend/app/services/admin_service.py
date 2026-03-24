from pymongo.collection import Collection

class AdminService:
    def __init__(self, deposit_collection: Collection, withdraw_collection: Collection):
        self.deposit_collection = deposit_collection
        self.withdraw_collection = withdraw_collection

    def list_deposits(self):
        return list(self.deposit_collection.find())

    def list_withdraws(self):
        return list(self.withdraw_collection.find())

    def approve_deposit(self, deposit_id):
        self.deposit_collection.update_one(
            {"_id": deposit_id},
            {"$set": {"status": "approved"}}
        )

    def approve_withdraw(self, withdraw_id):
        self.withdraw_collection.update_one(
            {"_id": withdraw_id},
            {"$set": {"status": "approved"}}
        )