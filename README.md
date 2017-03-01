# Converting LibreELEC for Berryboot
This is a simple bash script to download and convert ArchLinux OS image for Berryboot squashfs image.
<h2>Usage</h2>
Simply run the script as root and select your device.
<pre>sudo ./libreelec.sh</pre>
This script will:
<ul>
 	<li>Download the latest ArchLinux OS image</li>
 	<li>Decompress downloaded image</li> 	
 	<li>Generate squashfs Berryboot image file</li>
</ul>
NOTE: This script will need squashfs-tools and bsdtar, make sure your OS have those packages installed before execute the script.

For already converted OS images, go to: <a target="_blank" href="http://berryboot.alexgoldcheidt.com/images/">http://berryboot.alexgoldcheidt.com/images/</a>

&nbsp;
