HTMLWidgets.widget({

  name: 'C3StackedAreaChart',

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
        			}
        		},
        		axis: {
        			x: {
        				type: "timeseries",
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
    }
   };
}});
