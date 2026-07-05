import os
import re

# Read index.html to extract header and footer
with open('index.html', 'r', encoding='utf-8') as f:
    index_content = f.read()

# Extract header (from <div class="marquee to </nav>)
header_match = re.search(r'(<div class="marquee.*?</nav>\s*)', index_content, re.DOTALL)
if header_match:
    header_content = header_match.group(1)
else:
    print("Header not found in index.html")
    exit(1)

# Extract footer (from <footer class="main-footer"> to </footer>)
footer_match = re.search(r'(<footer class="main-footer">.*?</footer>\s*)', index_content, re.DOTALL)
if footer_match:
    footer_content = footer_match.group(1)
else:
    print("Footer not found in index.html")
    exit(1)

# Files to update
files_to_update = ['products.html', 'about.html', 'safety.html', 'contact.html']

for filename in files_to_update:
    if os.path.exists(filename):
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace header
        content = re.sub(r'<div class="marquee.*?</nav>\s*', header_content, content, flags=re.DOTALL)
        
        # Replace footer
        content = re.sub(r'<footer class="main-footer">.*?</footer>\s*', footer_content, content, flags=re.DOTALL)
        
        # Fix active state for products
        if filename == 'products.html':
            content = content.replace('<li class="nav-item lik active">', '<li class="nav-item lik ">')
            content = content.replace('<li class="nav-item lik ">\n\t\t\t<a class="nav-link" href="products.html">Product</a>', '<li class="nav-item lik active">\n\t\t\t<a class="nav-link" href="products.html">Product</a>')

        with open(filename, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {filename}")
