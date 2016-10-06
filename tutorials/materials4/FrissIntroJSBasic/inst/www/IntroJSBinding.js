// Custom handler to initialze introJS with help data
Shiny.addCustomMessageHandler('initIntroJS', function(message){

   var intro = introJs();

    // Initialize intro js with the proper content
    intro.setOptions({
      steps: message.steps
    });

   var el = $("#helpContainer");
   $(el).data("helpData",{intro: intro});

});

// Start Intro JS
startHelp = function(){
  // Retrieve dummy help container
  var el = $("#helpContainer");

  // Get intro JS component
  var intro = el.data("helpData").intro;

  // Start help tour
  intro.start();
};
