<template>
  <div>
    <EmployeeSelect @select="setSelectedEmployee" />
    <SeatMap
      :seats="seats"
      :selectedEmp="selectedEmp"
      :selectedSeat="selectedSeat"
      @selectSeat="(seat) => (selectedSeat = seat)"
    />
    <SeatControl
      :selectedEmp="selectedEmp"
      :selectedSeat="selectedSeat"
      @confirmUpdate="updateSeat"
    />
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import EmployeeSelect from "../components/EmployeeSelect.vue";
import SeatMap from "../components/SeatMap.vue";
import SeatControl from "../components/SeatControl.vue";
import axiosapi from "@/plugins/axios";

const selectedEmp = ref(null);
const selectedSeat = ref(null);
const seats = ref([]);

const fetchSeats = async () => {
  const response = await axiosapi.get("/seating/seats");
  seats.value = response.data;
};

onMounted(() => {
  fetchSeats();
});

const setSelectedEmployee = (emp) => {
  selectedEmp.value = emp;
  selectedSeat.value = null;
};

const updateSeat = async () => {
  if (!selectedEmp.value) return;
  if (!selectedSeat.value) {
    // 沒選座位 執行清除功能
    await axiosapi.delete(`/seating/clear/${selectedEmp.value.empId}`);
  } else {
    // 有選座位則執行更新功能
    await axiosapi.post("/seating/update", {
      empId: selectedEmp.value.empId,
      seatSeq: selectedSeat.value.id,
    });
  }
  // 清除狀態並刷新畫面
  selectedSeat.value = null;
  fetchSeats();
};
</script>
