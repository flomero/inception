<script>
	import { onMount } from 'svelte';

	let pokemonImage = '';
	const maxPokemonId = 1010;

	async function fetchRandomPokemon() {
		const randomId = Math.floor(Math.random() * maxPokemonId) + 1;
		const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${randomId}`);
		const data = await response.json();
		pokemonImage = data.sprites.front_default;
	}

	onMount(() => {
		fetchRandomPokemon();
	});
</script>

<svelte:head>
	<title>Random Pokemon Generator</title>
</svelte:head>

<div class="flex min-h-screen flex-col items-center justify-center">
	{#if pokemonImage}
		<img src={pokemonImage} alt="Random Pokémon" class="mb-8 h-48 w-48" />
	{:else}
		<div class="h-8 w-8 animate-spin rounded-full border-4 border-t-4"></div>
	{/if}

	<div class="group relative">
		<div
			class="absolute -inset-0.5 rounded-lg bg-gradient-to-r from-pink-600 to-purple-600 opacity-75 blur transition duration-1000 group-hover:opacity-100 group-hover:duration-200"
		></div>
		<button
			on:click={fetchRandomPokemon}
			class="relative flex items-center rounded-lg bg-slate-950 px-7 py-4 leading-none transition-all duration-200 ease-in-out hover:scale-95 active:scale-90"
		>
			another one...
		</button>
	</div>
</div>
