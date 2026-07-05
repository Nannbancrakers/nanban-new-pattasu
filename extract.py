import re
import json

file_path = r"C:\Users\DELL\.gemini\antigravity\brain\dbff3ff5-b550-4cfd-b94d-49619dbc6750\.system_generated\steps\26\content.md"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

parts = content.split('<div class="row mb-5" id="category-')

data = []

for part in parts[1:]:
    cat_match = re.search(r'<h4[^>]*>(.*?)</h4>', part)
    if not cat_match: continue
    category_name = cat_match.group(1).strip()
    
    products = []
    
    rows = part.split('<tr id="product-')
    for row in rows[1:]:
        name_match = re.search(r'data-product-name="(.*?)"', row)
        if not name_match: continue
        name = name_match.group(1).strip()
        
        img_match = re.search(r'data-product-image="(.*?)"', row)
        img = img_match.group(1).strip() if img_match else ""
        
        content_match = re.search(r'<td class="text-muted hide_small">(.*?)</td>', row)
        qty = content_match.group(1).strip() if content_match else ""
        
        actual_price_match = re.search(r'<td class="text-decoration-line-through text-muted hide_small">\s*&#8377;\s*([\d\.]+)', row)
        actual_price = actual_price_match.group(1) if actual_price_match else ""
        
        price_match = re.search(r'<td class="fw-bold text-success[^>]*>\s*&#8377;\s*([\d\.]+)', row)
        price = price_match.group(1) if price_match else ""
        
        products.append({
            "name": name,
            "image": img,
            "quantity": qty,
            "actual_price": actual_price,
            "price": price
        })
        
    data.append({
        "category": category_name,
        "products": products
    })

with open("products.json", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)

print(f"Extracted {len(data)} categories.")
