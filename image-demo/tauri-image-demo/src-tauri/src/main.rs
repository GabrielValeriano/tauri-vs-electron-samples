#![cfg_attr(
    all(not(debug_assertions), target_os = "windows"),
    windows_subsystem = "windows"
)]

use std::time::{SystemTime, UNIX_EPOCH};

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![log_time])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
#[tauri::command]
fn log_time() {
    let now = SystemTime::now();
    let difference_unix = now
        .duration_since(UNIX_EPOCH)
        .expect("Clock may have gone backwards");
    println!("{:?}", difference_unix.as_millis());
}
