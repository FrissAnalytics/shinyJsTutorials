HTMLWidgets.widget({

  name: 'C3StackedAreaChart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        if(el.chart === undefined){

          var chart = c3.generate({

              bindto: el,

              data: {
                  json: x.data,
                  x: "time",
              types:
                  x.types,
                  groups: [x.groups],
              },

              axis : {
                    x : {
                        type : 'timeseries',
                        tick : {format:x.format},
                    }
              }
          });
        }else{

          el.chart.unload();

          el.chart.load({
            json: x
          });

        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
