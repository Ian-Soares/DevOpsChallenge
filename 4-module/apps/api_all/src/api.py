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


@app.get('/api/get_info/{name}')
def get_info(name):
    url_gender = f'https://api.genderize.io/?name={name}'
    response = requests.request("GET", url_gender, headers=headers)
    gender = response.json()

    url_nationalize = f'https://api.nationalize.io/?name={name}'
    response = requests.request("GET", url_nationalize, headers=headers)
    nacionality = response.json()

    # The nationalize public API returns values like "BR" for Brazil, what makes it harder to read the results
    # So I use the response from nationalize API and get country names using their codes in restcountries URL, as below 
    response_nacionality_list = []
    for id in nacionality['country']:
        url_restcountries = f'https://restcountries.com/v3.1/alpha/{id["country_id"]}'
        response = requests.request("GET", url_restcountries, headers=headers)
        new_probability = float(id['probability'])*100
        response_nacionality_list.append({
                "country": response.json()[0]['name']['common'],
                "probability": f'{new_probability:.1f}%'
            })

    response_dict = {
        "gender": gender['gender'],
        "gender_probability": f"{float(gender['probability'])*100}%",
        "nacionality": response_nacionality_list
    }    
    print(response_dict)
    return response_dict 
