<script setup>
import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
  <main>
    <img alt="Vue logo" class="logo" src="./assets/headshot.jpeg" width="350" />

    <div class="wrapper">
      <HelloWorld msg="Iiro Alhonen" />
    </div>
  </main>
</template>

<style scoped>
.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  .logo {
    display: block;
    margin: 0 auto 2rem;
  }
}
</style>
