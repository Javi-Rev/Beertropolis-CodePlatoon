var substringMatcher = function(strs) {
  return function findMatches(query, callback) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `query`
    substrRegex = new RegExp(query, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `query`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    callback(matches);
  };
};

var beerData = gon.Beers

$(function() {
  $('#the-basics .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'beerData',
    source: substringMatcher(beerData)
  });
})
