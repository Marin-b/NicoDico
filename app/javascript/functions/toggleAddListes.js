const closePannel = () => {
  const popup = document.querySelector('.showPopup')
  if (popup.contains(event.target)){
    // Clicked in box
  } else{
    popup.classList.remove('showPopup')
    document.removeEventListener('click', closePannel)
    toggleListePannel();
  }
}

const updateEvents = (popup) => {
  document.addEventListener('click', closePannel)
}

const showPannel = () => {
  const popup = event.target.parentNode.querySelector('.addlist_popup')
  popup.classList.add('showPopup')
  event.target.removeEventListener("click", showPannel)
  setTimeout(updateEvents, 100, popup);
}

const toggleListePannel = () => {
  const toggleListePannel = document.querySelectorAll('.showListes')
  if (toggleListePannel.length > 0) {
    toggleListePannel.forEach((btn) => {
      btn.addEventListener("click", showPannel )
    })
  }
}

export { toggleListePannel }
