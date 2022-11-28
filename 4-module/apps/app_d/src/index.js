const btn = document.getElementById('btn-results');
const genderText = document.getElementById('gender-text');
const nacionalityText = document.getElementById('nacionality-text');
const otherNacionalitiesList = document.getElementById('other-nacionalities-list');
const otherNacionalitiesTitle = document.getElementById('other-nacionalities-title');
const listElements = document.querySelectorAll("#other-nacionalities-list li");

let sleep = ms => {  
    return new Promise(resolve => setTimeout(resolve, ms));  
};

function getInfos() {
    let nameInserted = document.getElementById('name').value;
    if (nameInserted){
        fetch(`http://cluster.iansoares.tk/api/get_info/${nameInserted}`)
            .then((response) => response.json())
            .then((data) => {
                gender = data.gender;
                genderProbability = data.gender_probability;
                nacionality = data.nacionality;
                console.log(data);
        });

        sleep(6000).then(() => {  
            for (var i = 0; (li = listElements[i]); i++) {
                li.parentNode.removeChild(li);
            };
            genderText.innerHTML = `You must a ${gender}, by ${genderProbability} sure`
            nacionalityText.innerHTML = `We think you were born in ${nacionality[0]['country']}, by ${nacionality[0]['probability']}`;
            let otherNacionalitiesResult = []
            for(i=0; i<5; i++) {
                otherNacionalitiesResult.push(`${nacionality[i]['country']} - ${nacionality[i]['probability']} of chance`);
            };
            console.log(otherNacionalitiesResult)
            otherNacionalitiesTitle.innerHTML = 'All possibilities:';
            otherNacionalitiesResult.forEach((item)=>{
                let li = document.createElement("li");
                li.innerText = item;
                otherNacionalitiesList.appendChild(li);
              });
        });  
        
    }
    else{
        alert('You must first insert a name!')
    }
};


