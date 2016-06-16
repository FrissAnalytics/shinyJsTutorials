function getDiffKeys(chart,x){
  // old keys
  var curKeys = _.keys(chart.x());

  // new keys
  var newKeys = _.keys(x.values);

  // difference
  diff = _.difference(curKeys,newKeys);

  return(diff);
}
