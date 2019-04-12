import { Furigana } from "gem-furigana";


const addFurigana = () => {
  if (document.querySelector('.addFurigana')) {
    const getFurigana = document.querySelectorAll('.specials')
    getFurigana.forEach((getF) => {
      const showFurigana = getF.parentNode.querySelector('.word_in_nuance')
      let parseFurigana = getF.innerHTML.replace(/ /g,'').slice(2,-2).replace("[", "<rt>").replace("]", "</rt>")
      showFurigana.innerHTML = `<ruby>${parseFurigana}</ruby>`
      getF.innerHTML = ""
      getF.style.padding = "0px"
    })
  }
}

export { addFurigana }
