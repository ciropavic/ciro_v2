$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "rgb(46, 204, 113)",
    trailColor: "#008a024d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "#256498",
    trailColor: "#0046804d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "rgb(255, 164, 59)",
    trailColor: "#A5743C4d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "#0054994d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "#bf1818",
    trailColor: "#651b1b4d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "#008cff",
    trailColor: "#0054994d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  DevIndicator = new ProgressBar.Circle("#DevIndicator", {
    color: "#000000",
    trailColor: "#000000",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  PursuitIndicator = new ProgressBar.Circle("#PursuitIndicator", {
    color: "#de4362",
    trailColor: "#de43624d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  Speedometer = new ProgressBar.Circle("#SpeedCircle", {
    color: "rgba(222, 222, 222, 1)",
    trailColor: "rgba(184, 184, 184, 0.082)",
    strokeWidth: 6,
    duration: 100,
    trailWidth: 6,
    easing: "easeInOut",
  });

  FuelIndicator = new ProgressBar.Circle("#FuelCircle", {
    color: "rgba(222, 222, 222, 1)",
    trailColor: "rgba(184, 184, 184, 0.082)",
    strokeWidth: 8,
    duration: 2000,
    trailWidth: 8,
    easing: "easeInOut",
  });

  VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
    color: "rgb(24, 24, 24)",
    trailColor: "#ffffff4d",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });
  VoiceIndicator.animate(1.0);
});

window.addEventListener("message", function (event) {
  let data = event.data;

  if (data.action == "update_hud") {
    HealthIndicator.animate(data.hp / 100);
    ArmorIndicator.animate(data.armor / 100);
    HungerIndicator.animate(data.hunger / 100);
    ThirstIndicator.animate(data.thirst / 100);
    StressIndicator.animate(data.stress / 100);
    OxygenIndicator.animate(data.oxygen / 400);
    DevIndicator.animate(data.dev / 0);
  }

  // Get current voice level and animate path
  if (data.action == "voice_level") {
    switch (data.voicelevel) {
      case 1:
        data.voicelevel = 33;
        break;
      case 2:
        data.voicelevel = 66;
        break;
      case 3:
        data.voicelevel = 100;
        break;
      default:
        data.voicelevel = 33;
        break;
    }
    VoiceIndicator.animate(data.voicelevel / 100);
  }

  // Get current voice level and animate path
  if (data.action == "pursuit_mode") {
    if (data.pursuitmode == 0) {
      $("#PursuitIndicator").fadeOut();
    } else if (data.pursuitmode == 1) {
      $("#PursuitIndicator").fadeIn();
      data.pursuitmode = 33;
    } else if (data.pursuitmode == 2) {
      data.pursuitmode = 66;
    } else if (data.pursuitmode == 3) {
      data.pursuitmode = 100;
    }
    PursuitIndicator.animate(data.pursuitmode / 100);
  }

  // Get current voice level and animate path
  // if (data.action == "pursuit_mode") {
  //   switch (data.pursuitmode) {
  //     case 1:
  //       data.pursuitmode = 33;
  //       break;
  //     case 2:
  //       data.pursuitmode = 66;
  //       break;
  //     case 3:
  //       data.pursuitmode = 100;
  //       break;
  //     default:
  //       data.pursuitmode = 33;
  //       break;
  //   }
  //   PursuitIndicator.animate(data.pursuitmode / 100);
  // }

  // Light up path if talking
  if (data.talking == 1) {
    VoiceIndicator.path.setAttribute("stroke", "yellow");
  } else if (data.talking == false) {
    VoiceIndicator.path.setAttribute("stroke", "#ffff");
  }

  // Headset icon if using radio
  if (data.radio == true) {
    $("#VoiceIcon").removeClass("fa-microphone");
    $("#VoiceIcon").addClass("fa-headset");
  } else if (data.radio == false) {
    $("#VoiceIcon").removeClass("fa-headset");
    $("#VoiceIcon").addClass("fa-microphone");
  }

  // Hide stress if disabled
  if (data.action == "disable_stress") {
    $("#StressIndicator").hide();
  }

  // Hide voice if disabled
  if (data.action == "disable_voice") {
    $("#VoiceIndicator").hide();
  }

  // Show oxygen if underwater
  if (data.showOxygen == true) {
    $("#OxygenIndicator").show();
  } else if (data.showOxygen == false) {
    $("#OxygenIndicator").hide();
  }

  // Hide armor if 0
  if (data.armor == 0) {
    $("#ArmorIndicator").fadeOut();
  } else if (data.armor > 0) {
    $("#ArmorIndicator").fadeIn();
  }

  if (data.stress == 0) {
    $("#StressIndicator").fadeOut();
  } else if (data.stress > 0) {
    $("#StressIndicator").fadeIn();
  }

  // Change color and icon if HP is 0 (dead)
  if (data.hp == 100) {
    $("#HealthIndicator").fadeOut()
  } else if (data.hp > 0) {
    $("#HealthIndicator").fadeIn();
    $("#hp-icon").removeClass("fa-skull");
    $("#hp-icon").addClass("fa-heart");
  } else if (data.hp < 0) {
    HealthIndicator.animate(0);
    HealthIndicator.trail.setAttribute("stroke", "red");
    $("#hp-icon").removeClass("fa-heart");
    $("#hp-icon").addClass("fa-skull");
  }

  // Enable dev on true
  if (data.dev == false) {
    $("#DevIndicator").fadeOut()
  } else if (data.dev == true) {
    $("#DevIndicator").fadeIn();
  }

  // Flash if thirst is low
  if (data.thirst >= 95) {
    $("#ThirstIndicator").fadeOut()
  } else if (data.thirst > 0) {
    $("#ThirstIndicator").fadeIn()
  } if (data.thirst < 25) {
    $("#ThirstIcon").toggleClass("flash");
  }
  // Flash if hunger is low
  if (data.hunger >= 95) {
    $("#HungerIndicator").fadeOut()
  } else if (data.hunger > 0) {
    $("#HungerIndicator").fadeIn()
  } else if (data.hunger < 25) {
    $("#HungerIcon").toggleClass("flash");
  }

  if (data.speed > 0) {
    $("#SpeedIndicator").text(data.speed);
    let multiplier = data.maxspeed * 0.1;
    let SpeedoLimit = data.maxspeed + multiplier;
    Speedometer.animate(data.speed / SpeedoLimit);
    Speedometer.path.setAttribute("stroke", "white");
  } else if (data.speed == 0) {
    $("#SpeedIndicator").text("0");
    Speedometer.path.setAttribute("stroke", "none");
  }

  if (data.action == "update_fuel") {
    let finalfuel = (data.fuel / 100) * 1.5385;
    if (finalfuel > 0.9) {
      FuelIndicator.animate(1.0);
    } else if (finalfuel < 0.9) {
      FuelIndicator.animate(finalfuel);
    }
    if (finalfuel < 0.2) {
      FuelIndicator.path.setAttribute("stroke", "red");
    } else if (finalfuel > 0.2) {
      FuelIndicator.path.setAttribute("stroke", "white");
    }
  }

  if (data.showSpeedo == true) {
    $("#VehicleContainer").fadeIn();
  } else if (data.showSpeedo == false) {
    $("#VehicleContainer").fadeOut();
  }

  if (data.showPursuit == true) {
    $("#PursuitIndicator").show();
  } else if (data.showPursuit == false) {
    $("#PursuitIndicator").hide();
  }

  if (data.showFuel == true) {
    $("#FuelCircle").show();
  } else if (data.showFuel == false) {
    $("#FuelCircle").hide();
  }

  if (data.showUi == true) {
    $(".container").show();
  } else if (data.showUi == false) {
    $(".container").hide();
  }

  if (data.action == "toggle_hud") {
    $("body").fadeToggle()
  }
});
