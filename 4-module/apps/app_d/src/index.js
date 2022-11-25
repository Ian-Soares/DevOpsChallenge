const btn = document.getElementById('btn-results');
const genderText = document.getElementById('gender-text');
const nacionalityText = document.getElementById('nacionality-text');
const otherNacionalitiesText = document.getElementById('other-nacionalities-text');
let sleep = ms => {  
    return new Promise(resolve => setTimeout(resolve, ms));  
};

function getInfos() {
    let nameInserted = document.getElementById('name').value;
    if (nameInserted){
        fetch(`http://127.0.0.1:8000/api/get_info/${nameInserted}`)
            .then((response) => response.json())
            .then((data) => {
                gender = data.gender;
                genderProbability = data.gender_probability;
                nacionality = data.nacionality;
                console.log(data);
        });

        sleep(6000).then(() => {  
            genderText.innerHTML = `You must a ${gender}, by ${genderProbability} sure`
            nacionalityText.innerHTML = nacionality;
        });  
        
    }
    else{
        alert('You must first insert a name!')
    }
};


