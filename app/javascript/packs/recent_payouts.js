
const listener = (card) => {
  const button = card.querySelector('.code')
  const fullCode = card.querySelector('.full-code')
  button.addEventListener('click', (event) => {
    fullCode.classList.toggle('full-code-uncover')
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

export { showPayoutCode };
export { copyLink };
