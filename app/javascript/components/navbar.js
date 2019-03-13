
const payoutSelector = (parent) => {
  return parent.querySelector('.payouts-link')
}

const balanceSelector = (parent) => {
  return parent.querySelector('.pure-balance')
}

const toggleHidden = (target) => {
  target.classList.toggle('hidden')
}

const togglePayout = (event) => {
  const payout = payoutSelector(event.currentTarget)
  const balance = balanceSelector(event.currentTarget)
  toggleHidden(payout)
  toggleHidden(balance)
}

const payoutHover = () => {
  const balanceWrapper = document.querySelector('.balance-wrapper')
  balanceWrapper.addEventListener('mouseover', togglePayout)
  balanceWrapper.addEventListener('mouseout', togglePayout)
}

export { payoutHover }
