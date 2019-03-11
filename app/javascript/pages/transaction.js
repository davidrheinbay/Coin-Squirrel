
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
  if (stati) {
    stati.forEach(statusToggle);
  }
};

export { statusChange };
