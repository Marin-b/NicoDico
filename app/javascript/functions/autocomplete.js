import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';


const renderItem = function (item) {
  return `<div style="display: flex; align-items: center;" class="autocomplete-suggestion" data-word="${item.word}"><span>${item.word}</span><span class="small orange" style="padding-left: 5px">${item.trad}</span></div>`
};


const autocompleteSearch = function() {
  const searchInput = document.querySelector('.autocomplete');



  if (searchInput) {
    const dict = searchInput.dataset.dict

    const goToPage = (event, term, item) => {
      window.location.href = `/dict/${dict}/word/${item.dataset.word}`
    }

    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
        $.getJSON(`/dict/${dict}/autocomplete`,
          { q: term },
          function(data) {
            return data;
        }).then((data) => {
          const matches = data
          suggest(matches)
        });
      },
      delay: 50,
      renderItem: renderItem,
      onSelect: goToPage
    });
  }
};

export { autocompleteSearch };
