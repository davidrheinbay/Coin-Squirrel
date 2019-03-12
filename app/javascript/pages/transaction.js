const arrowListener = (card) => {
  card.addEventListener('click', (event) => {
    event.currentTarget.querySelector('.turning-arrow').classList.toggle('turned')
  })
}


const turnArrow = () => {
  const cards = document.querySelectorAll('.cashout-card')
  cards.forEach((card) => {arrowListener(card)})
}

const ensureDefault = () => {
  const details = document.querySelectorAll('.recent_payout_details')
  details.forEach((detail) => {
    detail.classList.add('hidden')
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
}

const showTransactionDetails = () => {
  const buttons = document.querySelectorAll('.recent-payouts-buttons')
  buttons.forEach((button) => {
    button.addEventListener('click', showDetails)
  })
}



export { showTransactionDetails, turnArrow };
