<template>
  <div class="container">
    <h1>員工座位安排系統</h1>
    <MainView />
  </div>
</template>

<script setup>
	import MainView from "./views/MainView.vue";
</script>

<style scoped>
.container {
  max-width: 1000px;
  margin: auto;
  padding: 10px;
}
h1 {
	margin-bottom: 10px;
}
</style>
