HTMLWidgets.widget({

  name: 'C3PieChart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        if(el.chart === undefined){

          var chart = c3.generate({
              bindto: el,
              data: {
                  json: x.value,
                  type : 'pie',
              }
          });

          el.chart = chart;
        }else{

          el.chart.unload();

          el.chart.load({
            json: x.value
          });
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
