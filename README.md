# 員工座位系統 Employee Seating Arrangement System

本專案實作人資部門使用的員工座位安排系統，具備顯示員工座位圖、進行座位分配及座位清除、送出異動等功能，採用三層式架構設計，並實作資料庫交易控制與資安防護措施。

---

## 功能說明

- 顯示各樓層座位（不同顏色表示空位、已佔用）
- 一位員工只能佔用一個座位
- 可使用下拉選單選擇員工，點選任一空位分配座位
- 已佔用座位也可被清除為空位
- 點擊「送出」即寫入資料庫並調整座位

---

## 專案技術架構

- 前端：Vue.js
- 後端：Spring Boot（RESTful API）
- 資料庫：Microsoft SQL Server
- 專案管理工具：Maven
- 資料存取：Stored Procedure + Transaction 控制
- 安全性：防止 SQL Injection / XSS 攻擊

---

## 專案結構

Employee-Seating-System/
├── employee-seat-front/ # 前端 Vue.js 專案
├── employee-seat-back/ # 後端 Spring Boot 專案
├── DB/ # 資料庫腳本
│ ├── schema.sql # DDL 建立資料表
│ ├── stored-procedure.sql # 資料存取用 Stored Procedure
│ └── insert-data.sql # 初始資料 DML 語法
└── README.md

---

## 資料庫建立說明

1. 建立資料庫名稱：`bankdb`
2. 依照順序執行以下 SQL 檔案：
   - `DB/schema.sql`
   - `DB/stored-procedure.sql`
   - `DB/insert-data.sql`
