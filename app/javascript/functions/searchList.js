const renderList = (container, array)=> {
  container.innerHTML = ""
  array.forEach((listel) => {
    container.appendChild(listel)
  })
}


const searchList = () => {
  const searchBar = document.querySelector('.searchList')
  console.log(searchBar)
  if (searchBar) {
    const container = document.querySelector('.overflow')
    const select_all = container.querySelectorAll('.listlist')
    let selection = []
    searchBar.addEventListener("keyup", (event) => {
      const valThis = searchBar.value.toLowerCase();
      if(valThis == ""){
        renderList(container, select_all)
      } else {
        selection = []
        const x = select_all.forEach((listel) => {
          const text = searchBar.value.toLowerCase();
          const headers = (Array.from(listel.querySelectorAll('h4'))).map(x => x.innerText.toLowerCase())
          const header = headers.join()
          if (header.includes(text)) {
            selection.push(listel)
          }
        });
        renderList(container, selection)
      };
    })
  }
}

export { searchList }
