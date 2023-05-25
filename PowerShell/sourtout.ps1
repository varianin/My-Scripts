# Define the source folder where the files are located
$sourceFolder = "C:\Users\navid\Desktop"

# Define the destination folder on the external hard disk
$destinationFolder = "D:\"

# Get all files from the source folder and its subfolders
$files = Get-ChildItem -Path $sourceFolder -File -Recurse

# Loop through each file
foreach ($file in $files) {
    # Get the file extension
    $extension = $file.Extension.TrimStart('.')

    # Create a folder for the file type on the external hard disk if it doesn't exist
    $destinationSubFolder = Join-Path -Path $destinationFolder -ChildPath $extension
    if (-not (Test-Path -Path $destinationSubFolder -PathType Container)) {
        New-Item -Path $destinationSubFolder -ItemType Directory | Out-Null
    }

    # Move the file to the destination folder on the external hard disk with verbose output
    $destinationPath = Join-Path -Path $destinationSubFolder -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destinationPath -Force -Verbose
}
