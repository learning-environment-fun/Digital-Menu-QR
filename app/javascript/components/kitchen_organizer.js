const kitchenOrganizer = () => {
	const cards = document.querySelectorAll(".table-order-card");
	if (cards) { // Dont run if no cards
		cards.forEach((card) => {
			card.classList.add("d-none");
		});

		const links = document.querySelectorAll(".table-list");
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
		links[0].click();
	}
}

export default kitchenOrganizer;