<template>
  <div>
    <div v-for="(seatsOnFloor, floorNo) in groupedSeats" :key="floorNo">
      <div class="seat-row">
        <button
          v-for="seat in seatsOnFloor"
          :key="seat.id"
          :style="getStyle(seat)"
          :class="[
            'seat-btn',
            seat.empId ? 'occupied' : '',
            selectedEmp && seat.empId === selectedEmp.empId ? 'highlight' : '',
          ]"
          :disabled="!selectedEmp || (seat.empId && seat.empId !== selectedEmp.empId)"
          @click="selectSeat(seat)"
        >
          {{ seat.floorNo }}樓: 座位{{ seat.seatNo }}
          <span v-if="seat.empId"> [員編:{{ seat.empId }}]</span>
        </button>
      </div>
    </div>
  </div>
  <div>
    <h3>座位顏色說明：</h3>
    <div class="legend">
      <div class="legend-item empty"></div>
      <span>空位</span>
      <div class="legend-item occupied"></div>
      <span>已佔用</span>
      <div class="legend-item selected"></div>
      <span>當前選取</span>
      <div class="legend-item current"></div>
      <span>已配置</span>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps(["seats", "selectedEmp", "selectedSeat"]);
const emit = defineEmits(["selectSeat"]);

const groupedSeats = computed(() => {
  const groups = {};
  props.seats.forEach((seat) => {
    if (!groups[seat.floorNo]) groups[seat.floorNo] = [];
    groups[seat.floorNo].push(seat);
  });
  return groups;
});

const getStyle = (seat) => {
  // 該座位是選中的員工目前所在座位
  const isCurrentSeatOfSelectedEmp =
    props.selectedEmp && seat.empId === props.selectedEmp.empId;
  if (isCurrentSeatOfSelectedEmp) {
    return {
      backgroundColor: "#ffd966", // 金黃色
      border: "2px solid #ff9900",
    };
  }
  if (seat.empId) {
    return {
      backgroundColor: "#FF5151", // 紅色
    };
  }
  if (props.selectedSeat && seat.id === props.selectedSeat.id) {
    return {
      backgroundColor: "#8f8", // 綠色
    };
  }
  return {
    backgroundColor: "#ccc", // 灰色
  };
};

const selectSeat = (seat) => {
  if (!seat.empId && props.selectedEmp) {
    emit("selectSeat", seat);
  }
};
</script>

<style scoped>
.seat-row {
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 固定4個座位平均分配 */
  gap: 12px;
  margin-bottom: 12px;
}
.seat-btn {
  padding: 10px;
  min-height: 60px;
  font-size: 16px;
  color: black;
  border: none;
  border-radius: 6px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: transform 0.2s;
}
.seat-btn:disabled {
  cursor: not-allowed;
  opacity: 0.6;
}
.seat-btn:hover:not(:disabled) {
  transform: scale(1.05);
}
.occupied {
  background-color: #ff5151;
}
.highlight {
  animation: blink 1s infinite alternate;
}
.clickable {
  cursor: pointer;
}
.disabled {
  cursor: not-allowed;
  opacity: 0.6;
}
.legend {
  margin-top: 10px;
  margin-bottom: 12px;
  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
}
.legend-item {
  width: 20px;
  height: 20px;
  border: 1px solid #666;
  display: inline-block;
  margin-right: 3px;
  border-radius: 4px;
}
.occupied {
  background-color: rgb(249, 118, 118); /* 紅色 */
}
.current {
  background-color: #ffd966; /* 金黃色 */
}
.selected {
  background-color: #8f8; /* 綠色 */
}
.empty {
  background-color: #ccc; /* 灰色 */
}
</style>
