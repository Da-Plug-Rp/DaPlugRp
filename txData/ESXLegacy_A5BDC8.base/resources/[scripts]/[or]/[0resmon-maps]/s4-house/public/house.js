INIT = () => {
    var house = hinfo;
    $(".garage").html("");
    for (let i = 0; i < house.garage_stock; i++) {
        if(house.garage[i]) {
            $(".garage").append(`
                <div class="car">
                        <img src="https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/${house.garage[i].model.toLowerCase()}.png" />
                        <h2>${house.garage[i].model}</h2>
                </div>
            `);
        }
          
    }

}

