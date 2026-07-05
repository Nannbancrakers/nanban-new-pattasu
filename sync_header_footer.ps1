$indexContent = Get-Content "index.html" -Raw

# Extract header
$headerMatch = [regex]::Match($indexContent, '(?s)<div class="marquee.*?</nav>\s*')
$headerContent = $headerMatch.Value

# Extract footer
$footerMatch = [regex]::Match($indexContent, '(?s)<footer class="main-footer">.*?</footer>\s*')
$footerContent = $footerMatch.Value

$filesToUpdate = @("products.html", "about.html", "safety.html", "contact.html")

foreach ($file in $filesToUpdate) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        $content = [regex]::Replace($content, '(?s)<div class="marquee.*?</nav>\s*', $headerContent)
        $content = [regex]::Replace($content, '(?s)<footer class="main-footer">.*?</footer>\s*', $footerContent)
        
        if ($file -eq "products.html") {
            $content = $content.Replace('<li class="nav-item lik active">', '<li class="nav-item lik ">')
            $content = $content.Replace('<li class="nav-item lik ">
			<a class="nav-link" href="products.html">Product</a>', '<li class="nav-item lik active">
			<a class="nav-link" href="products.html">Product</a>')
        }
        
        Set-Content -Path $file -Value $content -Encoding UTF8
        Write-Host "Updated $file"
    }
}
