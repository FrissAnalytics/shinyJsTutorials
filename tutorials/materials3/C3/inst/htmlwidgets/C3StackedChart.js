HTMLWidgets.widget({

  name: 'C3StackedChart',

  type: 'output',

  factory: function(el, width, height) {

    // create an empty chart
    var chart = null;

    return {

      renderValue: function(x) {

        // if the chart does not exist, create it via c3.generate
        if(chart===null){

          var keys = _.keys(x.dataset);

        	chart = c3.generate({
        		bindto: el,
        		data: {
        			json: [],
        			keys: {
        			    x: "Time",
        				  value: keys,
        			},
        			groups: [x.groups]
        		},
        		subchart: {
                show: x.subchart
            },
        		axis: {
        			x: {
        				type: x.axis_type,
        				tick: {
        					format: "%Y-%m-%d"
        				}
        			}
        		}
        	});

      }

      // at this stage the chart always exists
      // get difference in keys
      var old_keys = _.keys(chart.x());
      var new_keys = _.keys(x.dataset);
      var diff     = _.difference(old_keys,new_keys);

      //chart.groups([x.groups]);

      // update the data
      chart.load({
        // new data
        json  : x.dataset,

        // new colors
        colors: x.colors,

        // remove data we no longer need (if any)
        unload: diff,

        // set types
        types : x.types
      });
    },

    // this part will be called each time we resize the containing div element
    resize: function(el, width, height, instance) {

    },

    getChart: function(){
      return chart;
    }
   };
}});


// Custom handler to zoom FrissC3Charts
Shiny.addCustomMessageHandler('zoomChart', function(message){

    var chart = getC3Chart(message.id);

    if(typeof(chart) !== "undefined"){
      var minDate = Date.parse(message.minX);
      var maxDate = Date.parse(message.maxX);
      chart.zoom([minDate,maxDate]);
    }
    
});

// Custom handler to change the colors of an existing C3 chart
Shiny.addCustomMessageHandler('setColors', function(message){

  var chart = getC3Chart(message.id);

  if(typeof(chart) !== "undefined"){
    chart.data.colors(message.colors);
  }
  
});


// Custom handler to change set the groups an existing C3 chart
Shiny.addCustomMessageHandler('setGroups', function(message){

  var chart = getC3Chart(message.id);

  if(typeof(chart) !== "undefined"){
    chart.groups([message.groups]);
  }
});


// Custom handler to change set the type of an existing C3 chart
Shiny.addCustomMessageHandler('setTypes', function(message){

  var chart = getC3Chart(message.id);

  if(typeof(chart) !== "undefined"){
    chart.transform(message.info.type, message.info.series);
  }
    
});



// Custom handler to change set the type of an existing C3 chart
Shiny.addCustomMessageHandler('transformTo', function(message){

  var chart = getC3Chart(message.id);
  
  if(typeof(chart) !== "undefined"){
    chart.transform(message.type);
  }
});
