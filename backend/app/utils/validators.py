import re

def validate_email(email: str) -> bool:
    """Simple email validator"""
    pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
    return re.match(pattern, email) is not None

def validate_password(password: str) -> bool:
    """Password should be at least 6 chars"""
    return len(password) >= 6

def validate_amount(amount: int) -> bool:
    """Amount should be positive integer"""
    return amount > 0