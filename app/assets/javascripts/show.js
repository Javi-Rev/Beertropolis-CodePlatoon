var map, heatmap;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    scrollwheel: false,
    zoom: 12,
    center: {lat: 41.878, lng: -87.630},
    mapTypeId: google.maps.MapTypeId.MAP
  });

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(geoPosition) {
      var coords  =  geoPosition.coords
      map.setCenter({lat: coords.latitude, lng: coords.longitude});
    });
  }

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
  return gon.latLong.map(function(ll) {
    return new google.maps.LatLng(ll.latitude, ll.longitude)
  });
}


function drawChart() {
}

var newArr = [];
if (gon.reviewDates !== undefined) {
  for ( i = 0; i < gon.reviewDates.length; ++i) {
    newArr.push(new Date(gon.reviewDates[i].slice(0,4),
          gon.reviewDates[i].slice(5,7),
          gon.reviewDates[i].slice(8,10))
        );
  };
};


var chartData = newArr.map(function (e, i) {
      return [newArr[i], gon.reviewPrices[i]];
});

console.log(chartData);


function drawAxisTickColors() {
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'X');
      data.addColumn('number', 'Price');

      data.addRows (chartData);
      //   [new Date(2015,00,05),20.5],

      var options = {

        width: 700,
        height: 400,
        // title: 'Price History (USD)',
        lineWidth: 4,
        legend: {
          position: 'none',
        },
        trendlines: {
          0: {
            type: 'exponential',
            }
        },
        hAxis: {
          textStyle: {
            color: '#01579b',
            fontSize: 14,
            fontName: 'Arial',
            bold: false,
            italic: false
          },
          titleTextStyle: {
            color: '#01579b',
            fontSize: 14,
            fontName: 'Arial',
            bold: true,
            italic: false
          }
        },

        vAxis: {
          title: 'Price ($)',
          format: 'currency',
          gridlines: {
            count: 6
          },
          textStyle: {
            color: '#01579b',
            fontSize: 14,
            bold: false
          },
          titleTextStyle: {
            color: '#01579b',
            fontSize: 14,
            bold: true,
            italic: false
          }
        },
        colors: ['#a52714', '#097138']
      };
      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }


