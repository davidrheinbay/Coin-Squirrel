
const unclicked = (status) => {
  if (status.classList.contains('unclicked')) {
    return true
  }
  return false

}

const open = (status) => {
  status.classList.add('activated')
  status.classList.remove('unclicked')
  status.querySelector('h3').classList.remove('hidden')
}

const ensureDefault = () => {
  const stati = document.querySelectorAll('.status');
  stati.forEach((status) => {
    status.classList.remove('activated')
    status.classList.add('unclicked')
    status.querySelector('h3').classList.add('hidden')
  });
};

const listener = (event) => {
  if (unclicked(event.currentTarget)) {
    ensureDefault();
    open(event.currentTarget)
  } else {
    ensureDefault();
  }
};

const statusToggle = (status) => {
  status.addEventListener('click', listener);
};



const statusChange = () => {
  const stati = document.querySelectorAll('.status');
  stati.forEach(statusToggle);
};

const arrowListener = (card) => {
  card.addEventListener('click', (event) => {
    event.currentTarget.querySelector('.turning-arrow').classList.toggle('turned')
  })
}


const turnArrow = () => {
  const cards = document.querySelectorAll('.cashout-card')
  cards.forEach((card) => {arrowListener(card)})
}




export { statusChange, turnArrow };
