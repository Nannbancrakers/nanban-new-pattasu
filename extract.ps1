$content = [System.IO.File]::ReadAllText("C:\Users\DELL\.gemini\antigravity\brain\dbff3ff5-b550-4cfd-b94d-49619dbc6750\.system_generated\steps\26\content.md")
$parts = $content -split '<div class="row mb-5" id="category-'
$data = @()
for ($i = 1; $i -lt $parts.Length; $i++) {
    $part = $parts[$i]
    if ($part -match '<h4[^>]*>(.*?)</h4>') {
        $category = $matches[1].Trim()
        $products = @()
        $rows = $part -split '<tr id="product-'
        for ($j = 1; $j -lt $rows.Length; $j++) {
            $row = $rows[$j]
            $name = ""
            $img = ""
            $qty = ""
            $actualPrice = ""
            $price = ""
            if ($row -match 'data-product-name="(.*?)"') { $name = $matches[1].Trim() }
            if ($row -match 'data-product-image="(.*?)"') { $img = $matches[1].Trim() }
            if ($row -match '<td class="text-muted hide_small">(.*?)</td>') { $qty = $matches[1].Trim() }
            if ($row -match '<td class="text-decoration-line-through text-muted hide_small">\s*&#8377;\s*([\d\.]+)') { $actualPrice = $matches[1] }
            if ($row -match '<td class="fw-bold text-success[^>]*>\s*&#8377;\s*([\d\.]+)') { $price = $matches[1] }
            
            if ($name -ne "") {
                $products += @{
                    name = $name
                    image = $img
                    quantity = $qty
                    actual_price = $actualPrice
                    price = $price
                }
            }
        }
        $data += @{
            category = $category
            products = $products
        }
    }
}
$data | ConvertTo-Json -Depth 5 | Out-File "products.json" -Encoding utf8
Write-Output "Extracted $($data.Length) categories."
