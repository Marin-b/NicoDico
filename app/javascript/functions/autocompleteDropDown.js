const autocompleteDropDown = () => {
  const dropDown = document.querySelector('#autocomplete-drop')
  if (dropDown) {
    document.querySelector('#submit_autocomplete').addEventListener("click", (event) => {
      window.location.replace(`/dict/${document.querySelector('.dict_name').innerHTML}/word/${dropDown.value}/edit`)
    })
  }
}


export {autocompleteDropDown }
