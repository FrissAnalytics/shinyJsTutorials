HTMLWidgets.widget({

  name: 'C3Gauge',

  type: 'output',

  factory: function(el, width, height) {

    return {

        renderValue: function(x) {

        // Check if we have a reference to our chart
        if(typeof(el.chart) == 'undefined'){
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

  	      el.chart = chart;

        }else{

          // Update the chart if it already exists
          el.chart.load({json: x});
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
