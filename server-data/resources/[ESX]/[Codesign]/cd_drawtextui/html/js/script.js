window.addEventListener('message', function(event){
      if (event.data.action == "show" && event.data.color == "blue" && event.data.color == "blue") {
        document.getElementById("text").innerHTML = event.data.text;
        document.getElementById("container").classList.remove("fadeOut");
        document.getElementById("container").classList.add("fadeIn");
        document.getElementById("box").style.backgroundImage = `linear-gradient(180deg, rgb(0, 115, 182) 0%, rgb(0, 115, 182) 100%)`
      } else if(event.data.action == "show"){
        document.getElementById("text").innerHTML = event.data.text;
        document.getElementById("container").classList.remove("fadeOut");
        document.getElementById("container").classList.add("fadeIn");
        document.getElementById("box").style.backgroundImage = `linear-gradient(180deg, ${event.data.color} 0%, ${event.data.color2} 100%)`
      } else if(event.data.action == "hide"){
        document.getElementById("container").classList.remove("fadeIn");
        document.getElementById("container").classList.add("fadeOut");
      }
});