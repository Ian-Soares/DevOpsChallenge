const btn = document.getElementById('btn-dog');
const catFact = document.getElementById('fact');
let fact = ""

function api_request() {
    fetch(`http://127.0.0.1:8000/api/get_cat_facts`)
        .then((response) => response.json())
        .then((data) => {
            fact = data.fact;
    });
};

function getFact() {
    api_request()
    console.log(fact)
    catFact.innerHTML = `${fact}`;
};

getFact();