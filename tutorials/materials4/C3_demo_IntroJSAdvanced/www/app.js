// initialize an introjs instance          
var intro     = introJs();

// handler 1
Shiny.addCustomMessageHandler("setHelpContent",
  
  // callback function. 
  // note: message is passed by shiny and contains the tour data
  function(message){

    // load data 
    intro.setOptions({steps: message.steps });
    
     // IF a nextPage is provided the done button is replaced with a next page button
     if(message.nextPage !== null){
        
        intro.setOption('doneLabel', 'Next page').oncomplete(function() {

              // When we click next page the appropriate tab is selected with Jquery and its content will be loaded
              $('[data-value=' + message.nextPage + ']').tab('show');
              // This is to let shiny know we went to the next page while displaying the help and the help should be displayed when opening this page.
              // The help canno be opend here directly because this creates an infinite loop which results in a stack overflow even with a timeout.
              Shiny.onInputChange("autoStartHelp", 1);
        });
    }
    
    
  }
  
);

// handler 2
Shiny.addCustomMessageHandler("startHelp",
  
  // callback function
  function(message) {

    // turn of auto start help flag
    Shiny.onInputChange("autoStartHelp", 0);

    intro.onchange(function(el){

      // Compare to the string true because R converts to boolean provided by creating the div to a character
     
        if(typeof SpeechSynthesisUtterance !== 'undefined'){
          startSpeech();
        }
     

		});
		
		// start intro.js
    // note: we don't need information from shiny, just start introJS
    intro.start();
		
  }
  
);

function startSpeech(){
          // current step in help (zero based)
        var Step = parseInt(intro._currentStep);

        // get raw HTML i.e. including tags
        var RAWHTML = intro._introItems[intro._currentStep].intro;

        // put it in a div so we are sure that all text has at least one set of HTML tags
  			var HTML = "<div>" + RAWHTML + "</div>";

  		  // extract text only via jQuery
  			var txt = $(HTML).text();

        // speak text, solve issues with long texts
        var chunkLength = 180;
        var pattRegex = new RegExp('^[\\s\\S]{' + Math.floor(chunkLength / 2) + ',' + chunkLength + '}[.!?,]{1}|^[\\s\\S]{1,' + chunkLength + '}$|^[\\s\\S]{1,' + chunkLength + '} ');
        var arr = [];

        while (txt.length > 0) {
            arr.push(txt.match(pattRegex)[0]);
            txt = txt.substring(arr[arr.length - 1].length);
        }

        $.each(arr, function () {
            var u = new SpeechSynthesisUtterance(this.trim());
			u.lang='en-GR'; // for US english, en-GR for british
						
            window.speechSynthesis.speak(u);
        });
}

