
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
    let copyEmailBtn = document.querySelector('.copy-code');
    copyEmailBtn.addEventListener('click', function(event) {

      let emailLink = document.querySelector('.full-code-copy');
      let range = document.createRange();
      range.selectNode(emailLink);
      window.getSelection().addRange(range);

      try {
        let successful = document.execCommand('copy');
        let msg = successful ? 'successful' : 'unsuccessful';
        console.log('Copy email command was ' + msg);
      } catch(err) {
        console.log('Oops, unable to copy');
      }


      window.getSelection().removeAllRanges();
    });
  }

}

export { showPayoutCode };
export { copyLink };
