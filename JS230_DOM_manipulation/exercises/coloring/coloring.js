function colorGeneration(idx) {
  generation = [...document.body.children];

  for (let i = 0; i < idx; i++) {
    generation = generation.map(el => [...el.children]).flat();
  };

  generation.forEach(el => el.classList.add("generation-color"))
}

document.addEventListener("DOMContentLoaded", () => {
  colorGeneration(1)
  colorGeneration(4)
  colorGeneration(7)
  colorGeneration(0)
  colorGeneration(8)
})