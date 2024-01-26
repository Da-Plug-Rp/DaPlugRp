let imgs = [
  "crypto-drop.gif",
  "logox.png",
  "btc2.png",
  "anon.png",
  "bogs.png",
  "bogs2.png",
];
const delay = 60 * 1000; // 1 minute

const canvas = document.getElementById("canv");
const ctx = canvas.getContext("2d");
const w = (canvas.width = document.body.offsetWidth);
const h = (canvas.height = document.body.offsetHeight);
const cols = Math.floor(w / 20) + 1;
const ypos = Array(cols).fill(0);

const btcpriceEl = document.getElementById("btcprice");

const green = "#00ff00";
const red = "#e60000";

let current_color = green;

const colors = ["#a5e29c", "#1b7b2c"];
function randomColor() {
  return "#" + Math.floor(Math.random() * 16777215).toString(16);
  /*   return colors[Math.floor(Math.random() * colors.length)]; */
}

ctx.fillStyle = "#000";
ctx.fillRect(0, 0, w, h);

function matrix() {
  ctx.fillStyle = "#0001";
  ctx.fillRect(0, 0, w, h);

  ctx.fillStyle = current_color; // try using randomColor() 😊
  ctx.font = "15pt monospace";

  ypos.forEach((y, ind) => {
    const text = String.fromCharCode(Math.random() * 128);
    const x = ind * 20;
    ctx.fillText(text, x, y);
    if (y > 100 + Math.random() * 10000) ypos[ind] = 0;
    else ypos[ind] = y + 20;
  });
}

function cycle_images() {
  let firstEl = imgs.shift();
  firstEl === "logox.png" ? (current_color = red) : (current_color = green);
  imgs = [...imgs, firstEl];
  document.documentElement.style.setProperty("--back-img", `url(${firstEl})`);
}

let locale = "en-US";
let currency = "EUR";
async function GetBTCPrice() {
  const result = await fetch(
    "https://api.coindesk.com/v1/bpi/currentprice.json"
  );
  const data = await result.json();
  const price = data.bpi.USD.rate_float;
  btcpriceEl.innerHTML = Intl.NumberFormat(locale, {
    style: "currency",
    currency: currency,
    maximumFractionDigits: 2,
  }).format(price);
}

window.addEventListener("message", (message) => {
  let resp = message.data;
  locale = resp.locale;
  currency = resp.currency;
  GetBTCPrice();
  setInterval(GetBTCPrice, 30000);
});

cycle_images();
setInterval(matrix, 50);
setInterval(cycle_images, delay);
