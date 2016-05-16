var map, heatmap;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lat: 37.775, lng: -122.434},
    mapTypeId: google.maps.MapTypeId.SATELLITE
  });
  heatmap = new google.maps.visualization.HeatmapLayer({
    data: getPoints(),
    map: map
  });
}

function toggleHeatmap() {
  heatmap.setMap(heatmap.getMap() ? null : map);
}

function changeGradient() {
  var gradient = [
    'rgba(0, 255, 255, 0)',
    'rgba(0, 255, 255, 1)',
    'rgba(0, 191, 255, 1)',
    'rgba(0, 127, 255, 1)',
    'rgba(0, 63, 255, 1)',
    'rgba(0, 0, 255, 1)',
    'rgba(0, 0, 223, 1)',
    'rgba(0, 0, 191, 1)',
    'rgba(0, 0, 159, 1)',
    'rgba(0, 0, 127, 1)',
    'rgba(63, 0, 91, 1)',
    'rgba(127, 0, 63, 1)',
    'rgba(191, 0, 31, 1)',
    'rgba(255, 0, 0, 1)'
  ]
  heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
}

function changeRadius() {
  heatmap.set('radius', heatmap.get('radius') ? null : 20);
}

function changeOpacity() {
  heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
}

// Heatmap data: 500 Points
function getPoints() {
  console.log(gon.latLong);
  var latLongArr = [];
  for (var i = 0; i < gon.latLong.length; ++i) {
    latLongArr.push(
      new google.maps.LatLng(gon.latLong[i].latitude, gon.latLong[i].longitude)
      );
  }
  return latLongArr;
  // return [
  //   new google.maps.LatLng(37.758910, -122.406228),
    // new google.maps.LatLng(37.758182, -122.405695),
    // new google.maps.LatLng(37.757676, -122.405118),
    // new google.maps.LatLng(37.757039, -122.404346),
    // new google.maps.LatLng(37.756335, -122.403719),
    // new google.maps.LatLng(37.755503, -122.403406),
    // new google.maps.LatLng(37.754665, -122.403242),
    // new google.maps.LatLng(37.753837, -122.403172),
    // new google.maps.LatLng(37.752986, -122.403112),
    // new google.maps.LatLng(37.751266, -122.403355)
      // ];
}
