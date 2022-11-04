window.addEventListener("DOMContentLoaded", () => {
  const { invoke } = window.__TAURI__.tauri;
  invoke("log_time");
});
