var onReady = function() {

  var beers = new Bloodhound ({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: '../../../db/beers.json'
  });

  beers.initialize();

  $('#prefetch .typeahead').typeahead(null, {
      name: 'name',
      source: beers
});


  $(searchSelector).bind('typeahead:selected', function(event, datum, name){
    window.location.href = '/search/'+datum.id;
  });
};
