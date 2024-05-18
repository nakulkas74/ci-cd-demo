from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# Model for the POST request
class Item(BaseModel):
    name: str
    price: float

# GET request
@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI!"}

# POST request
@app.post("/items/")
def create_item(item: Item):
    return {"item": item}
