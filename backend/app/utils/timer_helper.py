from datetime import datetime, timedelta

# Simple countdown timer for contests
def contest_end_time(duration_minutes: int) -> datetime:
    """Returns the end time of a contest from now."""
    return datetime.utcnow() + timedelta(minutes=duration_minutes)

def time_remaining(end_time: datetime) -> int:
    """Returns remaining seconds until contest ends."""
    delta = end_time - datetime.utcnow()
    return max(int(delta.total_seconds()), 0)