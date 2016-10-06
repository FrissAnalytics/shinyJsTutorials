// use a small logo for smaller screensizes

function frissSize() {
  var ww = $(window).height();
  var wh = $(window).width();

  //console.log("ww: "+ ww);
  //console.log("wh: "+ wh);
  
  if( wh >= 1800 ){
    d3.select("#FrissLogo").attr("src","friss.svg");
  } 
  
  else if( wh >= 1377 & wh < 1800 ){
    d3.select("#FrissLogo").attr("src","friss_small1.svg");
  } 
  
  else if ( wh < 1377 ){
    d3.select("#FrissLogo").attr("src","friss_small2.svg");
  }
}

$(window).resize(function() {
  
frissSize()
  
});

frissSize();