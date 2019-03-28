let selectedElement = 0;
const exempleBoxes = document.querySelectorAll('.exemple');
const seeMore = document.querySelector('.seemore')

const addOpacity = () => {
  seeMore.style.paddingTop = "0px"
  exempleBoxes[selectedElement].style.zIndex = "1"
  exempleBoxes[selectedElement].style.position = "relative"
}

const removeOpacity = () => {
  exempleBoxes[selectedElement].style.zIndex = "-1"
  exempleBoxes[selectedElement].style.position = "absolute"
  seeMore.style.paddingTop = "72px"
  selectedElement = (selectedElement + 1) % exempleBoxes.length;
  setTimeout(addOpacity, 500)
}

const exempleShow = () => {
  if (exempleBoxes.length > 0) {
    seeMore.addEventListener("click", (event) => {
      removeOpacity();
    })
    addOpacity();
  }
}

export { exempleShow }
