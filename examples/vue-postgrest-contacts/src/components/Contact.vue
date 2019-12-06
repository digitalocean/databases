<template>
  <div class="pa2 mb3 striped--near-white">
    <header class="b mb2">{{ contact.name }}</header>
    <div class="pl2">
      <p class="mb2">{{ contact.phone }}</p>
      <p class="pre mb3">{{ contact.address }}</p>
      <p class="mb2">
        <span class="fw5">Favorite colors:</span>
        {{ favoriteColors }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["contact"],
  computed: {
    favoriteColors() {
      const colors = this.contact.favorites.colors;
      if (!colors) return "no colors";

      return colors.join(", ");
    }
  }
};
</script>