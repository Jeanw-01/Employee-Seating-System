<template>
    <div>
        <button @click="$emit('confirmUpdate')">送出</button>
    </div>
</template>

<script setup>
    defineProps(["selectedEmp", "selectedSeat"]);
</script>

<style scoped>
button {
    font-size: 16px;
    color: white;
    background-color: rgb(57, 179, 155);
    padding: 7px;
    border: 1px solid black;
    border-radius: 4px;
    margin-top: 8px;
    cursor: pointer;
}
</style>