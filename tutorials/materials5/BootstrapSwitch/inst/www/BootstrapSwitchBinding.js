var FrissSwitchBinding = new Shiny.InputBinding();

$.extend(FrissSwitchBinding, {

  find: function(scope) {

    return $(scope).find(".FrissSwitch");

  },

  // this method will be called on initialisation
  initialize: function(el){

     console.log("initialize");

     // extract state data from element
     var state = $(el).data("state");

     // initialize switch with given state
     $("#" + el.id).bootstrapSwitch("state",state);

  },

  // this method will also be called on initialisation
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) {

    console.log("getValue");

    var value = $(el).bootstrapSwitch('state');

    console.log(value);

  	return value;
  },

  // we want to subscribe to changes in our component
  subscribe: function(el, callback) {

    console.log("subscribe");

    // only when a change is detected, call the get value method
    $(document).on('switchChange.bootstrapSwitch', function(event){

      console.log("callback");

      // callback which will tell Shiny to retrieve the value via getValue
      callback();
    });
  },

  // Unbind
  unsubscribe: function(el) {

    $(el).off("FrissSwitchBinding");
  },

  // Receive messages from the server.
  // Messages sent by update...() are received by this function.
  receiveMessage: function(el, data) {

    // to be implemented

  }
});

Shiny.inputBindings.register(FrissSwitchBinding);
