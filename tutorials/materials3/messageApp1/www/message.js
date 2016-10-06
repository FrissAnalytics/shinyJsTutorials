// the event handler listens to shiny for messages send by handler1
// if it receives a message, call the callback function doAwesomething and pass the message
Shiny.addCustomMessageHandler("handler1", doAwesomeThing );

// this function is called by the handler, which passes the message
function doAwesomeThing(message){
  
  // show the messsage as an alert
  alert(message);
}
