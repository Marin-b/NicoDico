const suggestionDropDown = (event) => {
  const paragraph = event.target.querySelector('p')
  document.querySelectorAll('.shown-paragraph').forEach((para) => {
    para.classListRemove('shown-paragraph')
  })
  paragraph.classListAdd('shown-paragraph')
}

export { suggestionDropDown }
