from fastapi import FastAPI

app = FastAPI()

# Route for the root endpoint "/"
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI App"}

# Route for "/metadata"
@app.get("/metadata/")
def read_metadata():
    return {"region": "example-region", "availability_zone": "example-az"}