let ranks = false;
let players = false;
let employees = false;
let recipes = false;
let vehicles = false;
let craftingTitle = "N/A";
let selectedItem = undefined;
window.addEventListener('message', function (event) {
  var edata = event.data;

  if (edata.type == "open") {
    const container = document.querySelector(".container");
    container.style.display = "block";  
    const menuText = document.getElementById("menuTitle");
    menuText.innerHTML = edata.title;
    if (recipes == false) {
      recipes = edata.recipes
      const menu = document.querySelector("#menu");
      for (const [recipeKey, recipeValue] of Object.entries(recipes)) {
        const itemDiv = document.createElement("div");
        itemDiv.className = "item";
        itemDiv.id = "item_" + recipeKey;
        itemDiv.raw = recipeKey;
        itemDiv.textContent = recipeValue.label;
        menu.appendChild(itemDiv);
      }
    }
  } else if (edata.type == "spawner") {
    const spawner = document.querySelector("#spawner");
    spawner.style.display = "block";
    if (vehicles == false) {
      vehicles = edata.vehicles
      const title = document.querySelector("#spawnerTitle");
      title.innerHTML = `${edata.title}`;
      const ul = document.createElement("ul");
      for (const [veh, vehData] of Object.entries(vehicles)) {
        const li = document.createElement("li");
        li.textContent = vehData.label;
        li.id = veh;
        li.addEventListener("click", function() {
          clickSound()
          spawner.style.display = "none";
          fetch(`https://${GetParentResourceName()}/spawnVeh`, {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
              },
              body: JSON.stringify({
                vehicle : veh,
              })
          });
        });
        ul.appendChild(li);
      }
      spawner.appendChild(ul);
    }
  } else if (edata.type == "bossmenu") {
    const spawner = document.querySelector("#bossmenu");
    spawner.style.display = "block";
    // general function to update everything at once.
    updateBossMenu(edata);
  }
  
});

function updateBossMenu(edata) {
  // clearing the ranks options
  const dropdownMenus = document.querySelectorAll(".chosenRank");
  for (var i = 0; i < dropdownMenus.length; i++) {
      while (dropdownMenus[i].options.length > 0) {
          dropdownMenus[i].remove(0);
      }
  }
  // filling in the ranks options
  ranks = edata.ranks;
  let sortedRanks = Object.keys(ranks).sort((a, b) => (ranks[a].grade > ranks[b].grade) ? 1 : -1);
  for (let dropdownMenu of dropdownMenus) {
      for (let rank of sortedRanks) {
          let opt = document.createElement("option");
          opt.value = JSON.stringify(ranks[rank]);
          opt.innerHTML = ranks[rank].label + " - $" + ranks[rank].salary + "/h";
          dropdownMenu.appendChild(opt);
      }
  }
  // clearing the players options
  const dropdownMenu2 = document.getElementById("players");
  while (dropdownMenu2.options.length > 0) {
      dropdownMenu2.remove(0);
  }
  // filling in the players options
  players = edata.players;
  let sortedPlayers = Object.keys(players)
  .filter(player => players[player] != null)
  .sort((a, b) => (players[a].id > players[b].id) ? 1 : -1);
  for (let player of sortedPlayers) {
      let opt = document.createElement("option");
      opt.value = players[player].id; // sending the server ID as the value
      opt.innerHTML = players[player].id + " | " + players[player].name;
      dropdownMenu2.appendChild(opt);
  }
  // clearing  the employees options
  const dropdownMenus2 = document.querySelectorAll(".employee");
  for (var i = 0; i < dropdownMenus2.length; i++) {
      while (dropdownMenus2[i].options.length > 0) {
          dropdownMenus2[i].remove(0);
      }
  }
  // filling in the employees options
  employees = edata.mechanics;
  for (let dropdownMenu of dropdownMenus2) {
      for (let employee of employees) {
          let opt = document.createElement("option");
          opt.value = JSON.stringify(employee);
          opt.innerHTML = employee.name + " | " + employee.grade_label;
          dropdownMenu.appendChild(opt);
      }
  }
  // society money
  const socmoney = document.querySelector("#society_money");
  socmoney.innerHTML = `$${edata.money}`;
}

window.onkeydown = function (e) {
  if (event.code === "Escape") {
    const container = document.querySelector(".container");
    const container2 = document.querySelector(".spawnerMenu");
    const container3 = document.querySelector("#bossmenu");
    container.style.display = "none";  
    container2.style.display = "none";  
    container3.style.display = "none";  
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    });
  }
};

const menu = document.querySelector('.menu');
const materials = document.querySelector('#materials');

const craftButton = document.querySelector('#craftButton');
craftButton.addEventListener('click', () => {
  clickSound()
  if (selectedItem) {
    
    fetch(`https://${GetParentResourceName()}/craft`, {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json; charset=UTF-8',
          },
          body: JSON.stringify({
            item : selectedItem,
          })
    });

  }
});

menu.addEventListener('click', e => {
  if (e.target.classList.contains('item')) {
    clickSound()
    craftButton.style.display = "block"; // Show the craft button
    
    const allItems = document.querySelectorAll(".item");
    allItems.forEach(item => {
      item.style.backgroundColor = "#898a85";
      item.style.color = "#E0E2DB";
    });
    e.target.style.backgroundColor = "#8b2635";
    e.target.style.color = "#E0E2DB";
    selectedItem = e.target.raw;
    const itemId = selectedItem;
    const itemMaterials = recipes[itemId].ingredients
    let str = `<div class="ingredients">${recipes[itemId].label} Ingredients:</div>`
    Object.keys(itemMaterials).forEach(ingredient => {
      let ingr = itemMaterials[ingredient]
      str = str + `<div class="ingredient">x${ingr.amount} ${ingr.label} </div>`
    });
    materials.innerHTML = `${str}`;
    materials.style.display = "block";
  }
});
function clickSound() {
  const clickSound = new Audio("click.mp3");
  clickSound.play();
}

//////////////
////////////// Boss Menu
//////////////

// Functions for recruitment, rank management, termination, salary management, and financial management
function recruit() {
  // Get the values from the form
    const id = document.querySelector("#players").value;
    fetch(`https://${GetParentResourceName()}/recruit`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            player : id,
        })
    });
}

function changeRank() {
  // Get the values from the form
  const selectedEmployee = JSON.parse(document.querySelector("#employee_rank").value);
  const selectedRank = JSON.parse(document.querySelector("#chosenRank_manage").value);
  //   console.log(selectedEmployee.identifier)
  //   console.log(selectedEmployee.name)
  //   console.log(selectedRank.label)
  //   console.log(selectedRank.grade)
  fetch(`https://${GetParentResourceName()}/changeRank`, {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify({
          employee : selectedEmployee,
          rank : selectedRank,
      })
  });
  // Update Boss Menu
  fetch(`https://${GetParentResourceName()}/refreshBossMenu`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({})
  });
}

function fireEmployee() {
  // Get the selected employee
  const selectedEmployee = JSON.parse(document.querySelector("#employee_fire").value);
  fetch(`https://${GetParentResourceName()}/fire`, {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify({
        employee : selectedEmployee,
      })
  });
  // Remove the selected employee from the list of employees
  const selectElement = document.querySelector("#employee_fire");
  for (let i = 0; i < selectElement.options.length; i++) {
    const optionValue = JSON.parse(selectElement.options[i].value);
    if (optionValue.id === selectedEmployee.id) {
      selectElement.remove(i);
      break; // Stop the loop after removing the option
    }
  }
  // Update Boss Menu
  fetch(`https://${GetParentResourceName()}/refreshBossMenu`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({})
  });
}

function changeSalary() {
  // Get the values from the form
  const chosenRank = JSON.parse(document.querySelector("#chosenRank_salary").value);
  const newSalary = document.querySelector("#newSalary").value;
  fetch(`https://${GetParentResourceName()}/changeSalary`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
      rank : chosenRank,
      newSalary : newSalary,
    })
  });
  // Update Boss Menu
  fetch(`https://${GetParentResourceName()}/refreshBossMenu`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({})
  });
}

function manageFinances() {
  // Get the values from the form
  const transactionType = document.querySelector("#transactionType").value;
  const amount = document.querySelector("#amount").value;
  fetch(`https://${GetParentResourceName()}/finance`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
      type : transactionType.toLowerCase(),
      amount : amount,
    }) 
  });
  // Update Boss Menu
  fetch(`https://${GetParentResourceName()}/refreshBossMenu`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({})
  });
}