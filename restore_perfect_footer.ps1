$footer = @"
	<!-- Footer Divider (Wave) -->
<div class="footer-divider">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 100" preserveAspectRatio="none">
		<path fill="#1A0D2E" d="M0,50 C240,100 480,0 720,50 C960,100 1200,0 1440,50 L1440,100 L0,100 Z"></path>
	</svg>
</div>

<footer class="main-footer">
	<!-- Animated Background Sparks -->
	<div class="footer-sparks">
		<div class="spark-burst" style="top: 20%; left: 15%; animation-delay: 0.5s;"></div>
		<div class="spark-burst" style="top: 50%; left: 40%; animation-delay: 2s;"></div>
		<div class="spark-burst" style="top: 30%; left: 70%; animation-delay: 1.2s;"></div>
		<div class="spark-burst" style="top: 70%; left: 85%; animation-delay: 3s;"></div>
	</div>

	<div class="container footer-container">
		<div class="row">
			<!-- Column 1: About -->
			<div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
				<div class="logo mb-3" style="padding-left: 0;">
			        <img src="images/logo.png" alt="Twins & Nanban Crackers" title="Twins & Nanban Crackers" style="height: 100px;width: 120px;">
				</div>
				<p class="footer-desc">
					Bringing joy and spectacular light to your celebrations for over 10 years. We specialize in premium, safe, and colorful fireworks for every festival.
				</p>
			</div>

			<!-- Column 2: Quick Links -->
			<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
				<h4 class="footer-title">Quick Links</h4>
				<ul class="footer-links">
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About Us</a></li>
					<li><a href="products.html">Our Products</a></li>
					<li><a href="safety.html">Safety Tips</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="admin.html"><i class="bi bi-shield-lock"></i> Admin Panel</a></li>
				</ul>
			</div>

			<!-- Column 3: Location Map -->
			<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
				<h4 class="footer-title">Our Location</h4>
				<div class="map-container">
                    <iframe src="https://www.google.com/maps?q=Poondi+Main+Road,+Semmedu,+Coimbatore&output=embed" width="100%" height="180" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>				</div>
			</div>

			<!-- Column 4: Contact Info -->
			<div class="col-lg-3 col-md-6">
				<h4 class="footer-title">Contact Us</h4>
				<div class="footer-contact-item">
					<i class="bi bi-geo-alt-fill"></i>
					<span>Poondi Main Road, Semmedu, Coimbatore</span>
				</div>
				<div class="footer-contact-item">
					<i class="bi bi-telephone-fill"></i>
					<span>+91 7601999346</span>
				</div>
				<div class="footer-contact-item">
					<i class="bi bi-envelope-fill"></i>
					<span>ganesans1235@gmail.com</span>
				</div>
			</div>
		</div>

		<!-- Social Media Icons Bar -->
		<div class="row social-bar">
			<div class="col-12 text-center">
				<h5 class="mb-4 text-uppercase">Follow Our Sparkle</h5>
				<div class="social-icons">
					<a href="#" class="social-link"><i class="bi bi-facebook"></i></a>
					<a href="#" class="social-link"><i class="bi bi-instagram"></i></a>
					<a href="#" class="social-link"><i class="bi bi-youtube"></i></a>
					<a href="#" class="social-link"><i class="bi bi-whatsapp"></i></a>
				</div>
			</div>
		</div>
	</div>

	<!-- Copyright Bottom Bar -->
	<div class="footer-bottom">
		<div class="container">
			<p class="copyright">
				&copy; 2026 Twins & Nanban Crackers. All Rights Reserved. 
				<div class="mt-3" style="font-size: 1.1rem; line-height: 1.6; color: #fff;">ஸ்ரீ தனலெட்சுமி பட்டாசு தொழிற்சாலை தங்களை அன்புடன் வரவேற்கிறது...<br>✅ தரமான நாட்டு பட்டாசுகள்...<br><a href="https://sridhanalakshmifireworks.com/" target="_blank" style="color: var(--theme-color); font-weight: bold; text-decoration: underline;">https://sridhanalakshmifireworks.com/ click here</a></div>
			</p>
		</div>
	</div>
</footer>
"
@

$files = @("index.html", "products.html", "about.html", "safety.html")
foreach ($file in $files) {
    $content = Get-Content "e:\Work\Nanban cracers\$file" -Raw -Encoding UTF8
    
    # Replace from Footer Divider to either </footer> or <div class="fixed point
    $content = [regex]::Replace($content, '(?s)<!-- Footer Divider.*?((?:</footer>\s*)?(?:<div class="fixed point|<script> new WOW))', "$footer`r`n`$1")
    
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText("e:\Work\Nanban cracers\$file", $content, $utf8NoBom)
}

# Now handle contact.html which has a different footer (topbg)
$contact = Get-Content "e:\Work\Nanban cracers\contact.html" -Raw -Encoding UTF8
$contactFooter = @"
	<div class="topbg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="medium text-center arial smallfnt pb-4 pt-4">
						&copy; 2026 Twins & Nanban Crackers. All Rights Reserved. 
				        <div class="mt-3" style="font-size: 1.1rem; line-height: 1.6; color: #000;">ஸ்ரீ தனலெட்சுமி பட்டாசு தொழிற்சாலை தங்களை அன்புடன் வரவேற்கிறது...<br>✅ தரமான நாட்டு பட்டாசுகள்...<br><a href="https://sridhanalakshmifireworks.com/" target="_blank" style="color: var(--theme-color); font-weight: bold; text-decoration: underline;">https://sridhanalakshmifireworks.com/ click here</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
"@
$contact = [regex]::Replace($contact, '(?s)<div class="topbg">.*?</div>\s*</div>\s*</div>\s*</div>\s*</div>', $contactFooter)
[System.IO.File]::WriteAllText("e:\Work\Nanban cracers\contact.html", $contact, $utf8NoBom)
