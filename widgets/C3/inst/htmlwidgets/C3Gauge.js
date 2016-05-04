HTMLWidgets.widget({

  name: 'C3Gauge',

  type: 'output',

  factory: function(el, width, height) {

    return {

        renderValue: function(x) {

        // Check if we have a reference to our chart
        if(!$(el).data("state")){
        	// create a chart and set options
        	// note that via the c3.js API we bind the chart to the element with id equal to chart1
        	var chart = c3.generate({
        		bindto: el,
        		data: {
        			json: x,
        			type: 'gauge',
        		},
        		gauge: {
        			label:{
        				//returning here the value and not the ratio
        				format: function(value, ratio){ return value;}
        			},
        			min: 0,
        			max: 100,
        			width: 15,
        			units: 'value' //this is only the text for the label
        		}
        	});

  	      $(el).data("state", {
            chart: chart
          });


        }else{

          var state = $(el).data("state");

          // Update the chart if it already exists
          state.chart.load({json: x});
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
