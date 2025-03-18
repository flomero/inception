document.addEventListener("DOMContentLoaded", function () {
  const pokemonImage = document.getElementById("pokemon-image");
  const loadingSpinner = document.getElementById("loading-spinner");
  const fetchButton = document.getElementById("fetch-button");

  // Function to fetch random Pokemon
  async function fetchRandomPokemon() {
    // Show spinner, hide image
    loadingSpinner.classList.remove("hidden");
    pokemonImage.classList.add("hidden");

    // Get random Pokemon ID (there are ~1000 Pokemon)
    const randomId = Math.floor(Math.random() * 1000) + 1;

    try {
      const response = await fetch(
        `https://pokeapi.co/api/v2/pokemon/${randomId}`
      );
      const data = await response.json();
      const imageUrl =
        data.sprites.other["official-artwork"].front_default ||
        data.sprites.front_default;

      // Update image source
      pokemonImage.src = imageUrl;

      // When image loads, hide spinner and show image
      pokemonImage.onload = function () {
        loadingSpinner.classList.add("hidden");
        pokemonImage.classList.remove("hidden");
      };
    } catch (error) {
      console.error("Error fetching Pokemon:", error);
      loadingSpinner.classList.add("hidden");
      alert("Failed to load Pokemon. Please try again.");
    }
  }

  // Fetch a Pokemon when the page loads
  fetchRandomPokemon();

  // Add click event to button
  fetchButton.addEventListener("click", fetchRandomPokemon);
});
