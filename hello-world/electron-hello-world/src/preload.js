const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("logTime", () => ipcRenderer.send("logTime"));
