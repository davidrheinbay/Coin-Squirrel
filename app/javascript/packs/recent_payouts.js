
const listener = (card) => {
  const button = card.querySelector('.code')
  const fullCode = card.querySelector('.full-code')
  button.addEventListener('click', (event) => {
    fullCode.classList.toggle('full-code-uncover')
  })
}

const showPayoutCode = () => {
  const cards = document.querySelectorAll('.recent_payout_details')

  cards.forEach((card) => {
    listener(card)
  })
}
const copyLink = () => {

  let copyEmailBtn = document.querySelector('.copy-code');
  copyEmailBtn.addEventListener('click', function(event) {
    // Select the email link anchor text
    let emailLink = document.querySelector('.full-code-copy');
    let range = document.createRange();
    range.selectNode(emailLink);
    window.getSelection().addRange(range);

    try {
      // Now that we've selected the anchor text, execute the copy command
      let successful = document.execCommand('copy');
      let msg = successful ? 'successful' : 'unsuccessful';
      console.log('Copy email command was ' + msg);
    } catch(err) {
      console.log('Oops, unable to copy');
    }

    // Remove the selections - NOTE: Should use
    // removeRange(range) when it is supported
    window.getSelection().removeAllRanges();
  });

}

export { showPayoutCode };
export { copyLink };
