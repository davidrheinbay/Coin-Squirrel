const cardUnlocked = () => {

  const cards = document.querySelectorAll(`.store-card`)

  cards.forEach((card) => {
    if (card.querySelector('.store-progression-grey')) {
      card.querySelector('.store-image').classList.add('store-card-locked');
      card.querySelector('.store-card-detail').classList.add('store-card-locked');

      console.log('test')
    }
  })

};

export { cardUnlocked };
