// removing new mechanic

const removingNew = (id) => {
  const relevantClass = `new-${id}`
  const newTags = document.querySelectorAll(`.${relevantClass}`)
  console.log(newTags)
  newTags.forEach((newTag) => {
    newTag.classList.add('hidden')
  })
}
// turn arrow mechanic

const arrowListener = (card) => {
  card.addEventListener('click', (event) => {
    event.currentTarget.querySelector('.turning-arrow').classList.toggle('turned')
  })
}


const turnArrow = () => {
  const cards = document.querySelectorAll('.cashout-card')
  cards.forEach((card) => {arrowListener(card)})
}
// Show details mechanic

const ensureDefault = () => {
  const details = document.querySelectorAll('.recent_payout_details')
  details.forEach((detail) => {
    detail.classList.add('hidden')
    detail.querySelector('.full-code').classList.remove('full-code-uncover')
  })
}

const showDetails = (event) => {
  ensureDefault()
  const id = event.currentTarget.id
  const details = document.querySelectorAll('.recent_payout_details')
  details.forEach((detail) => {
    if (detail.classList.contains(id)) {
      detail.classList.remove('hidden')
    }
  })
  const pureIdString = id.split('-')[3]
  const pureIdInt = parseInt(pureIdString)
  removingNew(pureIdInt)
}

const showTransactionDetails = () => {
  const buttons = document.querySelectorAll('.recent-payouts-buttons')
  buttons.forEach((button) => {
    button.addEventListener('click', showDetails)
  })
}

// show Info details when hovering

const showInfoDetails = (event) => {
  const steps = document.querySelector('.steps')
  steps.classList.remove('hidden')
}

const hideInfoDetails = (event) => {
  const steps = document.querySelector('.steps')
  steps.classList.add('hidden')
}

const hoverDetails = () => {
  const detailsIcon = document.querySelector('.details-icon')
  detailsIcon.addEventListener('mouseover', showInfoDetails)
  detailsIcon.addEventListener('mouseout', hideInfoDetails)
}



export { showTransactionDetails, turnArrow, hoverDetails };
