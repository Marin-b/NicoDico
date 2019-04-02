const switchVisibility = (ind, arr) => {
  arr[ind].classList.remove("onScreen")
  arr[(ind + 1) % arr.length].classList.add("onScreen")
}

const findElementOnScreen = () => {
  const container = event.target.parentNode;
  const exemplesCycle = container.querySelectorAll(".exempleCycle");
  let ind = 0;
  exemplesCycle.forEach((exemple) => {
    if (exemple.classList.contains("onScreen")){
      switchVisibility(ind, exemplesCycle);
    } else {
      ind += 1;
    }
  })
}

const initExemples = (btn) => {
  const container = btn.parentNode
  const firstExemple = container.querySelector(".exempleCycle")
  firstExemple.classList.add("onScreen")
}

const exempleShow = () => {
  const seeMore = document.querySelectorAll('.seemore')
  if (seeMore.length > 0) {
    seeMore.forEach((btn) => {
      initExemples(btn);
      btn.addEventListener("click", (event) => {
        findElementOnScreen();
      });
    });
  };
};

export { exempleShow };
