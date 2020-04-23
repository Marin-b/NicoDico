const forvo = () => {
  const audioTrigger = document.querySelector('.audio-start')
  if (audioTrigger) {
    const audio = document.querySelector('#word-audio')
    audioTrigger.addEventListener('click', () => {
      if (audio.dataset.loaded === "true") {
        audio.play()
      } else {
        fetch(window.location.pathname + "/forvo")
          .then(res => res.json())
          .then(data => {
            console.log(data)
            audio.src = data.items.sort((a, b) => b.num_positive_votes - a.num_positive_votes )[0].pathmp3
            audio.setAttribute('data-loaded', 'true')
            audio.play()
          })
      }
    })
  }
}


export { forvo }
