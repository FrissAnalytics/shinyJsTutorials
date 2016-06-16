HTMLWidgets.widget({

  name: 'C3Pie',

  type: 'output',

  factory: function(el, width, height) {

    // create an empty chart
    var chart = null;

    return {

      renderValue: function(x) {

        // if the chart does not exist, create it via c3.generate
        if(chart === null){

           // create a pie chart, see http://c3js.org/samples/chart_pie.html
             chart = c3.generate({
                bindto: el,
                data: {
                    json : [],
                    type : 'pie'
                },
            legend: {
                position: x.legendPosition
              }
            });
        }

        // at this stage the chart always exists
        // get difference in keys
        var old_keys = _.keys(chart.x());
        var new_keys = _.keys(x.values);
        var diff     = _.difference(old_keys,new_keys);

        // load the new data (stored in x.values)
        chart.load({
          json:
            x.values,

            // unload data that we don't want anymore
            unload: diff
        });
      }
    };
  }
});
