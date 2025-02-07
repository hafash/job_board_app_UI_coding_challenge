# Check if any emulator is running
$runningDevices = flutter devices

if ($runningDevices -match "Small_Phone_API_34") {
    Write-Host "Emulator is already running."
} else {
    Write-Host "Starting Emulator..."
    Start-Process -NoNewWindow -FilePath "C:\Users\user\AppData\Local\Android\Sdk\emulator\emulator.exe" -ArgumentList "-avd Small_Phone_API_34"
    Start-Sleep -Seconds 10  # Wait for emulator to boot
}

# Run the Flutter project
flutter run
