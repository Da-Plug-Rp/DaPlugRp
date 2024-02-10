var page = "main"

$(function() {
     window.addEventListener('message', function(event) {
         var item = event.data
       if (item.type == "open") {
          document.getElementById('gameboy-photo').src = "images/bg/"+item.color+".png"
           document.getElementById("stg-gameboy").style.display = "block"
           setTimeout(() => document.getElementById("stg-gameboy").style.transform = "scale(1)", 25);
       }
   })
 })

function selectGame(game) {
     page = "game"
     $('#stg_games').toggle()
     document.querySelectorAll(".apps").forEach(function(a){a.style.display = "none"})
     if(game == "metal") {
          div = '<iframe class="game" src="https://en.gameslol.net/data/emul/retro/load.php?sys=snk-neo-geo&r=mslug2.zip"></iframe>'
     }
     else if(game == "mario") {
          div = '<iframe id="mario" class="game" src="https://jcw87.github.io/c2-smb1/"></iframe>'
     }
     else if(game == "kart") {
          div = '<iframe class="game" src="https://static.arcadespot.com/retroemulator.php?system=snes&game=2015/11/Super-Mario-Kart-USA.nes"></iframe>'
     }
     else if(game == "monkey") {
          div = '<iframe class="game" src="https://freekong.org/"></iframe>'
     }
     else if(game == "sonic") {
          div = '<iframe class="game" src="https://static.arcadespot.com/retroemulator.php?system=sega&game=2017/11/sonic-the-hedgehog.gen"></iframe>'
     }    
     else if(game == "mortal") {
          div = '<iframe class="game" src="https://static.arcadespot.com/retroemulator.php?system=snes&game=2017/01/mortal-kombat-ii.smc"></iframe>'
     }
     $("#gameboy-screen").append(div)
     if(game == "mario") {
          document.getElementById("mario").style.transform = "scale(1.8)"
     }
}

window.addEventListener("keyup", (event) => {
     document.querySelectorAll(".game").forEach(function(a){a.remove()})
     event.preventDefault();
     if (event.key == "Escape") {
          if(page == "game") {
               page = "main"
               $('#stg_games').toggle()
          }
          else {
               page = "main"
               document.getElementById("stg-gameboy").style.display = "none"
               document.getElementById("stg-gameboy").style.transform = "scale(0.6)"
               $.post('http://stg_gameboy/exit', JSON.stringify({}));
          }
     }
   })