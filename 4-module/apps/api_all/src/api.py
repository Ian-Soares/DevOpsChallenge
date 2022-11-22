from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import requests

app = FastAPI(title="Library API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

headers = {
    'content-type': "application/json",
    'cache-control': "no-cache"
}

@app.get('/api/get_jokes')
def get_jokes():
    URL = 'https://official-joke-api.appspot.com/random_joke'
    response = requests.request("GET", URL, headers=headers)
    joke = response.json()
    return {
        "setup": joke["setup"],
        "punchline": joke["punchline"]
    }


@app.get('/api/get_dog_images')
def get_dog_img():
    URL = 'https://dog.ceo/api/breeds/image/random'
    response = requests.request("GET", URL, headers=headers)
    dog_url = response.json()
    return dog_url


@app.get('/api/get_cat_facts')
def get_cat_facts():
    URL = 'https://catfact.ninja/fact'
    response = requests.request("GET", URL, headers=headers)
    cat_fact = response.json()
    return cat_fact


@app.get('/api/get_gender/{name}')
def get_gender(name):
    URL = f'https://api.genderize.io/?name={name}'
    response = requests.request("GET", URL, headers=headers)
    gender = response.json()
    return gender


@app.get('/api/get_nacionality/{name}')
def get_gender(name):
    URL = f'https://api.nationalize.io/?name={name}'
    response = requests.request("GET", URL, headers=headers)
    nacionality = response.json()
    return nacionality
