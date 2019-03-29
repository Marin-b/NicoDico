const removeHasMany = () => {
  const container = event.target.parentNode.parentNode;
  const hasManyFields = container.querySelectorAll('.nested-fields');
  if (hasManyFields.length > 0) {
    container.removeChild(hasManyFields[hasManyFields.length - 1]);
  }
}

const clickThem = () => {
  const clickEm = document.querySelectorAll('.clickMe')
  clickEm.forEach((btn) => { btn.click() });
}
const addEvents = () => {
  const lessHasMany = document.querySelectorAll('.lessHasMany');
  lessHasMany.forEach((btn) => {
    btn.addEventListener("click", (event) =>{
      removeHasMany(event);
    });
  });
}
const addRemove = () => {
  document.querySelectorAll('.lessHasManyNuance').forEach((btn)=> {
      btn.addEventListener("click", (event) => {
        event.target.parentNode.remove();
    })
  });
}

const dynamicForm = () => {
  const addNuance = document.querySelector('.addNuance')
  if (addNuance) {
    addNuance.addEventListener("click", (event) => {
      setTimeout(addEvents, 100)
      addRemove();
    })
    addEvents();
    clickThem();
    setTimeout(addRemove(), 100);
  }
}

export { dynamicForm }
