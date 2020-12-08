
<h2>Background Context</h2>

<p><strong>Note:</strong> Your server is configured with an Ubuntu 16.04 LTS environment. You do <strong>not</strong> need to create a new virtual machine. If you decide you want to upgrade to Ubuntu 16.04, make sure to create a new VM. Do <strong>not</strong> attempt to upgrade your current Ubuntu 14.04 environment as that will inevitably be messy and can break things. Note that if you switch, none of your files and environment settings will be available and anything you need will have to be reinstalled or migrated.</p>

<h2>Resources</h2>

<p><strong>Read or watch</strong>:</p>

<ul>
<li><a href="/rltoken/PXE-o9DWronMp4ETwADOpg" title="What is a (physical) server - text" target="_blank">What is a (physical) server - text</a> </li>
<li><a href="/rltoken/IfLc3lxSs4w5xdsFlRDPWw" title="What is a (physical) server - video" target="_blank">What is a (physical) server - video</a> </li>
<li><a href="/rltoken/qKJi0RXLqaCLkHLCLhiYNA" title="SSH essentials" target="_blank">SSH essentials</a> </li>
<li><a href="/rltoken/DNiFD9w9Gx0mnQk5nXbtjg" title="SSH Config File" target="_blank">SSH Config File</a></li>
<li><a href="/rltoken/ZBYjVLcJ-ck-CFjndgSDBw" title="Public Key Authentication for SSH" target="_blank">Public Key Authentication for SSH</a></li>
<li><a href="/rltoken/SW2m2e0KMA2K1dXk_0M0CA" title="How Secure Shell Works" target="_blank">How Secure Shell Works</a></li>
<li><a href="/rltoken/8N-RlUma9lwGfyZp1_C-Wg" title="SSH Crash Course" target="_blank">SSH Crash Course</a> (Long, but highly informative. Watch this if configuring SSH is still confusing. It may be helpful to watch at x1.25 speed or above.)</li>
</ul>

<p><strong>For reference:</strong></p>

<ul>
<li> <a href="/rltoken/6mtNBCxYkoBQJ2vJ6TcRYA" title="Understanding the SSH Encryption and Connection Process" target="_blank">Understanding the SSH Encryption and Connection Process</a></li>
<li><a href="/rltoken/c1Yj55AE6gGkDxpACdY1vg" title="Secure Shell Wiki" target="_blank">Secure Shell Wiki</a></li>
<li><a href="/rltoken/GXZWV9hhtZN1-WnRkRSoUg" title="IETF RFC 4251 (Description of the SSH Protocol)" target="_blank">IETF RFC 4251 (Description of the SSH Protocol)</a></li>
<li><a href="/rltoken/bH7JrEiKN4Q6-J58d9pAsw" title="Internet Engineering Task Force" target="_blank">Internet Engineering Task Force</a></li>
<li><a href="/rltoken/lDe2f7hVqQPPCNr5i2zE-g" title="Request for Comments" target="_blank">Request for Comments</a></li>
</ul>

<p><strong>man or help</strong>:</p>

<ul>
<li><code>ssh</code></li>
<li><code>ssh-keygen</code></li>
<li><code>env</code></li>
</ul>

<h2>Learning Objectives</h2>

<p>At the end of this project, you are expected to be able to <a href="/rltoken/yrpqgxdgQKwr3vYfhBpA_w" title="explain to anyone" target="_blank">explain to anyone</a>, <strong>without the help of Google</strong>:</p>

<h3>General</h3>

<ul>
<li>What is a server</li>
<li>Where servers usually live</li>
<li>What is SSH</li>
<li>How to create an SSH RSA key pair</li>
<li>How to connect to a remote host using an SSH RSA key pair</li>
<li>The advantage of using  <code>#!/usr/bin/env bash</code> instead of <code>/bin/bash</code> </li>
</ul>
