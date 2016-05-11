

var beers = new Bloodhound ({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../../../db/beers.json'
});

$('#prefetch .typeahead').typeahead(null, {
    name: 'name'
    source: beers
});

