// Run function (=>) kitchenOrganizer; what do I do?
const kitchenOrganizer = () => {
  // What do I do if I find cards? If they exist then display them..
	const cards = document.querySelectorAll(".table-order-card");
	if (cards) { //  d-none is a bootstrap function
		cards.forEach((card) => {
			card.classList.add("d-none");
		});

  // What do I do if I find links? If they exist add an event listener to them..
		const links = document.querySelectorAll(".kitchen-table-tab-link");
		links.forEach((link) => {
			link.addEventListener("click", (event) => {
				const tableId = link.dataset.tableId;
				links.forEach((anyLink) => {
					anyLink.classList.remove("highlighted");
				});
				link.classList.add("highlighted");
				cards.forEach((card) => {
					if (card.dataset.tableId === tableId) {
						card.classList.remove("d-none");
					} else {
						card.classList.add("d-none");
					}
				});
			});
		});
    // Display default tab
		links[0].click();
	}
}

// Run in application.js under packs folder
export default kitchenOrganizer;
