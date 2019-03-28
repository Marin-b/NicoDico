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

const dynamicForm = () => {
  const lessHasMany = document.querySelectorAll('.lessHasMany');
  if (lessHasMany.length > 0) {
    lessHasMany.forEach((btn) => {
      btn.addEventListener("click", (event) =>{
        removeHasMany(event);
      });
    });
  clickThem();
  }
}

export { dynamicForm }
