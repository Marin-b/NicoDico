import { Furigana } from "gem-furigana";


const addFurigana = () => {
  if (document.querySelector('.addFurigana')) {
    const getFurigana = document.querySelector('.specials')
    const showFurigana = document.querySelector('.word_in_nuance')
    let parseFurigana = getFurigana.innerHTML.replace(/ /g,'').slice(2,-2).replace("[", "<rt>").replace("]", "</rt>")
    console.log(parseFurigana)
    showFurigana.innerHTML = `<ruby>${parseFurigana}</ruby>`
    getFurigana.innerHTML = ""
    getFurigana.style.padding = "0px"
  }
}

export { addFurigana }
