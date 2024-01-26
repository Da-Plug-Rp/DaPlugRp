$("#docsUI").hide();

let config = {};

addEventListener("message", async function (event) {
  var eventData = event.data;

  if (eventData.type == "openDocumentUI") {
    showDocumentsUI();
  } else if (eventData.type == "closeDocumentUI") {
    closeDocumentsUI();
  }
});

async function fetchConfigData() {
  await $.post(
    `https://${GetParentResourceName()}/getDocumentConfig`,
    JSON.stringify({}),
    function (fetchedConfig) {
      config.type = fetchedConfig.type;
      config.title = fetchedConfig.title;
      config.logo = fetchedConfig.logo;
      config.from = fetchedConfig.from;
      config.description = fetchedConfig.description;
      config.disclaimer = fetchedConfig.disclaimer;
      config.information = fetchedConfig.information;
      config.extended_information = fetchedConfig.extended_information;
      config.terms_and_conditions = fetchedConfig.terms_and_conditions;
      config.sign = fetchedConfig.sign;
    }
  );

  const documentUI = document.getElementById("docsUI");

  let informationLables = "";
  let extendedInformationLabels = "";
  let tosText = "";
  let extendedInformationGrid = "";

  config.information.forEach((inputField) => {
    if (inputField.type === "text_input") {
      informationLables += `
        <div>
          <label for="${
            inputField.id
          }" class="block mb-2 text-sm font-medium text-gray-900">${
        inputField.label
      }</label>
          <input ${
            config.type === "show" ? `disabled value="${inputField.value}"` : ""
          } type="text" id="${
        inputField.id
      }" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm block w-full p-2.5" placeholder="${
        inputField.placement
      }" ${inputField?.required === "true" ? `required` : ``}>
        </div>
      `;
    }
  });

  config.extended_information.forEach((extendedInputField) => {
    if (extendedInputField.type === "text_area") {
      extendedInformationLabels += `
      <div>
        <label for="${
          extendedInputField.id
        }" class="block mb-2 text-sm font-medium text-gray-900">${
        extendedInputField.label
      }</label>
        <textarea ${
          config.type === "show" ? `disabled` : ""
        } rows="3" type="text" id="${
        extendedInputField.id
      }" class="mb-2 mt-0 resize-none bg-gray-50 border border-gray-300 text-gray-900 text-sm block w-full p-2.5" placeholder="${
        extendedInputField.placement
      }" ${extendedInputField?.required === "true" ? `required` : ``}>${
        config.type === "show" ? extendedInputField.value : ""
      }</textarea>
      </div>
    `;
    } else if (extendedInputField.type === "text_input") {
      extendedInformationGrid += `
      <div>
        <label for="${
          extendedInputField.id
        }" class="block mb-2 text-sm font-medium text-gray-900">${
        extendedInputField.label
      }</label>
        <input ${
          config.type === "show"
            ? `disabled value="${extendedInputField.value}"`
            : ""
        } type="text" id="${
        extendedInputField.id
      }" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm block w-full p-2.5" placeholder="${
        extendedInputField.placement
      }" ${extendedInputField?.required === "true" ? `required` : ``}>
      </div>
      `;
    }
  });

  config.terms_and_conditions.forEach((tos) => {
    tosText += `
      <li>${tos.label}</li>
    `;
  });

  documentUI.innerHTML = `
    <div class="flex flex-row justify-between items-center m-7">
      <img class="w-40 h-40" src="${config.logo}"/>
      <div class="ml-10 w-90">
        <h1 class="text-3xl whitespace-nowrap font-bold">${config.title}</h1>

        <div class="flex flex-col justify-start items-start mb-3 mt-3">
          <span>Sent at: Friday, October 14, 2022 - 07:53PM</span>
          <span>From: ${config.from}</span>
        </div>

        <div class="flex flex-col justify-start items-start mb-3 mt-3">
          <h2 class="font-bold">${config.description}</h2>
          <h2 class="font-medium">PLEASE FILL THE REQUIRED INPUTS</h2>
        </div>
      </div>
    </div>

    <form id="docsSubmit">
      <div class="m-7">
        <p class="italic"><span class="underline">DISCLAIMER:</span> ${
          config.disclaimer
        }</p>

        <div class="mt-3 bg-black text-white text-center">
          <h3>BASIC INFORMATION</h3>
        </div>

        <div class="mt-3 grid gap-6 mb-6 md:grid-cols-2">
          ${informationLables}
        </div>

        <div class="mt-3 bg-black text-white text-center">
          <h3>EXTENDED INFORMATION</h3>
        </div>

        ${
          extendedInformationGrid === ""
            ? ``
            : `
        <div class="mt-3 grid gap-6 mb-6 md:grid-cols-2">
          ${extendedInformationGrid}
        </div>
        `
        }

        <div class="mt-3">
          ${extendedInformationLabels}
        </div>

        <div class="mt-3 bg-black text-white text-center">
          <h3>TERMS & SIGNING</h3>
        </div>

        <div class="flex flex-row justift-between items-start">
          <div class="m-3 ml-0 mr-0">
            ${tosText}
          </div>
          ${
            config.type == "show"
              ? `<img src="${config.sign}" class="h-[110px] m-3 mb-0 mr-0 ml-auto cursor-crosshair border" />`
              : `<canvas id="sig-canvas" height="110" class="m-3 mb-0 mr-0 ml-auto border border-sky-500"></canvas>`
          }
        </div>

        <div class="flex mb-0 flex-row justify-between items-center mt-3 text-center text-white">
        <button type="button" class="m-1 mb-0 p-3 bg-black mr-0 ml-0" onclick="closeDocumentsUI()">Close</button>
            <div>
              <button ${
                config.type === "show"
                  ? 'disabled class="hidden m-1 mr-2 mb-0 p-3 bg-black mr-0 ml-0"'
                  : "class='m-1 mr-2 mb-0 p-3 bg-black mr-0 ml-0'"
              } type="button" id="clearSign">Clear Sign</button>
              <button id="submitSign" type="submit" ${
                config.type === "show"
                  ? 'disabled class="hidden m-1 mb-0 p-3 bg-black mr-0 ml-0"'
                  : "class='m-1 mb-0 p-3 bg-black mr-0 ml-0'"
              }>Submit</button>
            </div>
        </div>
      </div>
    </form>
  `;

  $.getScript("esign.js", function (data, textStatus, jqxhr) {});

  $(document).ready(function () {
    $("#docsSubmit").submit(function (e) {
      e.preventDefault();

      let information = {};
      let extended_information = {};

      $("form#docsSubmit :input").each(function () {
        var input = $(this);
        let inputVal = input.val();
        let inputId = input.attr("id");
        
        config.information.forEach((info) => {
          if (info.id === inputId) information[info.id] = inputVal;
        });

        config.extended_information.forEach((extendedInfo) => {
          if (extendedInfo.id === inputId) extended_information[extendedInfo.id] = inputVal;
        });
      });

      let sign = localStorage.getItem("esign");

      $.post(
        `https://${GetParentResourceName()}/printDoc`,
        JSON.stringify({ information, extended_information, sign })
      );
      closeDocumentsUI();
    });
  });
}

function showDocumentsUI() {
  fetchConfigData();
  $("#docsUI").show();
}

function closeDocumentsUI() {
  $("#docsUI").hide();
  config = {};
  localStorage.removeItem("esign");
  $.post(`https://${GetParentResourceName()}/close`);
}

function clearCanvas() {
  const canvas = document.getElementById("sig-canvas");
  let context = canvas.getContext("2d");

  context.clearRect(0, 0, canvas.width, canvas.height);
}
