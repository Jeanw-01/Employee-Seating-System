<template>
  <div class="choose-emp">
    <label>選擇員工：</label>
    <select @change="onChange($event)">
      <option>請選擇</option>
      <option v-for="emp in employees" :key="emp.empId" :value="emp.empId">
        {{ emp.empId }} - {{ emp.name }}
      </option>
    </select>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axiosapi from "@/plugins/axios";
const emit = defineEmits(["select"]);
const employees = ref([]);

onMounted(async () => {
  const response = await axiosapi.get("/seating/employees");
  employees.value = response.data;
});

const onChange = (e) => {
  const empId = e.target.value;
  const emp = employees.value.find((emp) => emp.empId === empId);
  emit("select", emp);
};
</script>

<style scoped>
.choose-emp {
    margin-bottom: 10px;
    font-weight: bold;
}
</style>