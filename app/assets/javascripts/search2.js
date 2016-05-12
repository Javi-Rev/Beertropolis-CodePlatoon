var gonBeers = gon.Beers
var onReady = function() {
  var beers = new Bloodhound ({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: gonBeers
  });

  beers.initialize();

  $("#beer-search").typeahead(null, {
    name: 'name',
    source: gonBeers
  }

  $(searchSelector).bind('typeahead:selected', function(event, datum, name){
    window.location.href = '/search/'+datum.id;
  });
};
