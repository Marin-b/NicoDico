import { Furigana } from "gem-furigana";


const addFurigana = () => {
  if (document.querySelector('.addFurigana')) {
    const getFurigana = document.querySelector('.specials')
    const showFurigana = document.querySelector('.word_in_nuance')
    let parseFurigana = getFurigana.innerHTML.slice(12, -8).replace("[", "<rt>").replace("]", "</rt>")
    console.log(parseFurigana)
    showFurigana.innerHTML = `<ruby>${parseFurigana}</ruby>`
    getFurigana.innerHTML = ""
  }
}

export { addFurigana }
