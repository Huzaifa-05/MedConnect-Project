# PowerShell script to fix navigation bars in all doctor profile HTML files

$doctorsDir = "c:\Users\Administrator\OneDrive\Desktop\finalICT\Project\doctors"
$htmlFiles = Get-ChildItem -Path $doctorsDir -Filter "*.html"

$oldNavPattern = @'
<!--Header-->
    <header class="navbar">
        <div class="container nav-container">
            <h1 class="logo"><i class="fa-solid fa-stethoscope"></i> MedConnect</h1>
            <nav>
                <a href="../index.html">Home</a>
                <a href="../doctors.html">Doctors</a>
                <a href="../about.html">About</a>
                <a href="../contact.html">Contact</a>
            </nav>
        </div>
    </header>
'@

$newNavPattern = @'
<!--Header-->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="../index.html" class="logo">
                <i class="fa-solid fa-heart-pulse"></i> MedConnect
            </a>
            <div class="nav-links">
                <a href="../index.html">Home</a>
                <a href="../doctors.html">Find Doctors</a>
                <a href="../about.html">About Us</a>
                <a href="../contact.html">Contact</a>
                <a href="#" class="btn-primary">Book Now</a>
            </div>
            <div class="hamburger">
                <i class="fa-solid fa-bars"></i>
            </div>
        </div>
    </nav>
'@

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    $content = Get-Content -Path $file.FullName -Raw
    $content = $content -replace [regex]::Escape($oldNavPattern), $newNavPattern
    Set-Content -Path $file.FullName -Value $content -NoNewline
    Write-Host "Updated: $($file.Name)"
}

Write-Host "`nAll files updated successfully!"
