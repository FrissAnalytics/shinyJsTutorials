if (annyang) {

  // Let's define a command.
  var commands = {
    'help': function() { 
      Shiny.onInputChange("autoStartHelp", 1); 
    },
    'time': function() { 
       $('[data-value=2]').tab('show');
    },
    'main': function() { 
      $('[data-value=1]').tab('show');
    },
    'next': function() { 
      intro.nextStep();
    },
    'back': function() { 
      intro.previousStep();
    },
    'skip': function() { 
       intro.exit();
    },

  };
  
  // Add our commands to annyang
  annyang.addCommands(commands);
  
  // Start listening.
  annyang.start();
}