from fastapi import FastAPI
from app.services.metadata import get_instance_metadata

app = FastAPI()

@app.get("/metadata/")
async def metadata():
    """
    API endpoint to return AWS region and availability zone where the app is running.
    """
    region, az = get_instance_metadata()
    return {"region": region, "availability_zone": az}
