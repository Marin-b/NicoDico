const findSelectedElement = (arr) => {
  const natureSelectors = document.querySelectorAll("select")
  let ind = 0
  natureSelectors.forEach((selector) => {
    if (selector === event.target) {
      natureSelectors[ind + 1].selectedIndex = event.target.selectedIndex
    } else {
      ind += 1
    }
  })
}

const initSelectors = () => {
  const natureSelectors = document.querySelectorAll("select")
  natureSelectors[natureSelectors.length - 1].style.pointerEvents = "none"
  natureSelectors.forEach((selector) => {
    selector.addEventListener("change", findSelectedElement);
  })
}

const dynamicForm = () => {
  const addNuance = document.querySelector('.natureSelect')
  if (addNuance) {
    initSelectors();
    addNuance.addEventListener("click", (event) => {
      setTimeout(initSelectors, 500);
    })
  }
}

export { dynamicForm }
