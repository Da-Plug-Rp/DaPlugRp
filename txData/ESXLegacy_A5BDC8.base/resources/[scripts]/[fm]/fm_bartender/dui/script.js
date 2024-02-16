const container = document.getElementById("container");

function createDrink(title, ingredients) {
    const drink = document.createElement("div");
    drink.classList.add("drink");

    const titleDiv = document.createElement("div");
    titleDiv.classList.add("title");
    titleDiv.innerText = title

    drink.appendChild(titleDiv);

    const ingredientsDiv = document.createElement("div");
    ingredientsDiv.classList.add("ingredients");

    for (const ingredient of ingredients) {
        const ingredientDiv = document.createElement("div");
        ingredientDiv.innerText = ingredient;

        ingredientsDiv.appendChild(ingredientDiv);
    }

    drink.appendChild(ingredientsDiv);

    return drink
}

window.addEventListener("message", ({data}) => {
    if (data.drinks) {
        for (const drink of data.drinks) {
            const drinkDiv = createDrink(drink.title, drink.ingredients);
            container.appendChild(drinkDiv);
        }
    }
})