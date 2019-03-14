
const listener = (card) => {
  const button = card.querySelector('.code')
  const fullCode = card.querySelector('.full-code')
  const text = card.querySelector(".click-below")
  button.addEventListener('click', (event) => {
    fullCode.classList.toggle('full-code-uncover')
    if (text != null) {
      if (text.innerText.includes('reveal')) {
        text.innerText = "Use this code in your game"
      } else {
        text.innerText = "Click below to reveal your code"
      }
    }
    event.preventDefault()
  })
}

const showPayoutCode = () => {
  const cards = document.querySelectorAll('.recent_payout_details')

  cards.forEach((card) => {
    listener(card)
  })
}
const copyLink = () => {
  if (document.querySelector('.copy-code')) {
    let copyCodeBtn = document.querySelector('.copy-code');
    copyCodeBtn.addEventListener('click', function(event) {

      let code = document.querySelector('.full-code-copy');
      let range = document.createRange();
      range.selectNode(code);
      window.getSelection().addRange(range);

      try {
        let successful = document.execCommand('copy');
        let msg = successful ? 'successful' : 'unsuccessful';
      } catch(err) {
      }


      window.getSelection().removeAllRanges();
    });
  }

}


const selector = () => {
  const buttons = document.querySelectorAll('.recent-payouts')
  buttons.forEach(function (button) {
    button.addEventListener('click', (event) => {
    const selected = document.querySelector('.selected')
    if (selected != null) {
    selected.classList.remove('selected')
    }
    event.currentTarget.classList.toggle('selected')
  });
  })
}

export { showPayoutCode };
export { copyLink };
export { selector };
