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
      // data.addRows ([
      //   [new Date(2015,00,05),20.5],
      //   [new Date(2015,01,06),23.2],
      //   [new Date(2015,02,07),30.223423424],
      //   [new Date(2015,03,08),32.23234234],
      //   [new Date(2015,04,09),36],
      //   [new Date(2015,05,02),40],
      //   [new Date(2015,06,03),50],
      //   [new Date(2015,07,07),30],
      //   [new Date(2015,08,09),33],
      // ]);


        // (gon.prices);
        // [54, 71, 63], [55, 72, 64], [56, 73, 65], [57, 75, 67], [58, 70, 62], [59, 68, 60],
        // [60, 64, 56], [61, 60, 52], [62, 65, 57], [63, 67, 59], [64, 68, 60], [65, 69, 61],
        // [66, 70, 62], [67, 72, 64], [68, 75, 67], [69, 80, 72]

      var options = {

        width: 650,
        height: 400,
        title: 'Price History (USD)',
        lineWidth: 4,
        trendlines: {
          0: {
            type: 'exponential',
            }
        },
        hAxis: {
          title: 'Date',
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


