# Podman Uninstallation Script for Windows

This repository contains a PowerShell script to completely uninstall Podman from a Windows machine, including cleaning up related configurations and WSL instances. After running this script, you can reinitialize Podman using `podman machine init`.

## Features

- Unregisters the `podman-machine-default` instance from WSL.
- Deletes residual configuration files and folders associated with Podman.
- Prepares the system for a clean reinstallation of Podman.

## Requirements

- Windows operating system.
- PowerShell (Administrator privileges required).
- WSL (Windows Subsystem for Linux).

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/<your-username>/podman-uninstall-script.git
   cd podman-uninstall-script
   ```

2. Open PowerShell as an Administrator.

3. Run the script:
   ```powershell
   .\UninstallPodman.ps1
   ```

## What the Script Does

1. Lists all WSL distributions to verify the existence of the `podman-machine-default`.
2. Unregisters `podman-machine-default` from WSL.
3. Deletes the following directories and file from your home folder:

   - `C:\Users\<YourUsername>\.local\share\containers\podman\machine\wsl`
   - `C:\Users\<YourUsername>\.config\containers\podman\machine`
   - `C:\Users\<YourUsername>\AppData\Roaming\containers`
   - `C:\Users\<YourUsername>\.ssh\podman-machine-default.pub`

4. Verifies successful uninstallation and provides a message confirming readiness for reinitialization.

## Reinitialize Podman

After running the script, you can reinitialize Podman by executing:

```bash
podman machine init
```

## Contributing

Contributions, bug reports, and feature requests are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Disclaimer

This script is provided as-is and assumes that Podman is installed in a default configuration. Use at your own risk. Ensure you have backups of important data before running this script.
