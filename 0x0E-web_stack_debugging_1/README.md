<h1 class="gap">Web stack debugging</h1>


<p>
  System engineering &amp; DevOps
</p>




<hr>


<div class="gap formatted-content">
    <h1>Intro</h1>

<p>Debugging usually takes a big chunk of a software engineer’s time. The art of debugging is tough and it takes years, even decades to master, and that is why seasoned software engineers are the best at it… experience. They have seen lots of broken code, buggy systems, weird edge cases and race conditions.</p>

<p><img src="https://holbertonintranet.s3.amazonaws.com/uploads/medias/2020/9/45dffb0b1da8dc2ce47e340d7f88b05652c0f486.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIARDDGGGOUWMNL5ANN%2F20201221%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20201221T153230Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=bb0221f112d75bdf511f5d2b08ba2c4e4659e104fb6e25d20271c2ea9c47f65e" alt="" style=""></p>

<h1>Non-exhaustive guide to debugging</h1>

<h2>Holberton specific</h2>

<p>If you are struggling to get something right that is run on the checker, like a Bash script or a piece of code, keep in mind that you can simulate the flow by starting a Docker container with the distribution that is specified in the requirements and by running your code. Check the <strong>Docker</strong> concept page for more info.</p>

<h2>Test and verify your assumptions</h2>

<p>The idea is to ask a set of questions until you find the issue. For example, if you installed a web server and it isn’t serving a page when browsing the IP, here are some questions you can ask yourself to start debugging:</p>

<ul>
<li>Is the web server started? - You can check using the service manager, also double check by checking process list.</li>
<li>On what port should it listen? - Check your web server configuration</li>
<li>Is it actually listening on this port? - <code>netstat -lpdn</code> - run as <code>root</code> or <code>sudo</code> so that you can see the process for each listening port</li>
<li>It is listening on the correct server IP? - <code>netstat</code> is also your friend here</li>
<li>Is there a firewall enabled? </li>
<li>Have you looked at logs? - usually in <code>/var/log</code> and <code>tail -f</code> is your friend</li>
<li>Can I connect to the HTTP port from the location I am browsing from? - <code>curl</code> is your friend</li>
</ul>

<p>There is a good chance that at this point you will already have found part of the issue.</p>

<h2>Get a quick overview of the machine state</h2>

<p><a href="/rltoken/ekfkdJZZj7afoZGRsY-WgA" title="Youtube video First 5 Commands When I Connect on a Linux Server" target="_blank">Youtube video First 5 Commands When I Connect on a Linux Server</a></p>

<p>When you connect to a server/machine/computer/container you want to understand what’s happened recently and what’s happening now,  and you can do this with <a href="/rltoken/M4oNLQSRExi3YeIEOGsD6Q" title="5 commands" target="_blank">5 commands</a> in a minute or less:</p>

<h3><code>w</code></h3>

<ul>
<li>shows server <a href="/rltoken/aZCGzc5uCpVnuPE4cWhHsQ" title="uptime" target="_blank">uptime</a> which is the time during which the server has been continuously running</li>
<li>shows which users are connected to the server</li>
<li>load average will give you a good sense of the server health - (read more about load <a href="/rltoken/7l65GSOqy2bdSz0KEuDDuw" title="here" target="_blank">here</a> and <a href="/rltoken/iuawtra4Nc6WigmdO6Zr_w" title="here" target="_blank">here</a>)</li>
</ul>

<h3><code>history</code></h3>

<ul>
<li>shows which commands were previously run by the user you are currently connected to</li>
<li>you can learn a lot about what type of work was previously performed on the machine, and what could have gone wrong with it</li>
<li>where you might want to start your debugging work</li>
</ul>

<h3><code>top</code></h3>

<ul>
<li>shows what is currently running on this server</li>
<li>order results by CPU, memory utilization and catch the ones that are resource intensive</li>
</ul>

<h3><code>df</code></h3>

<ul>
<li>shows disk utilization</li>
</ul>

<h3><code>netstat</code></h3>

<ul>
<li>what port and IP your server is listening on</li>
<li>what processes are using sockets</li>
<li>try <code>netstat -lpn</code> on a Ubuntu machine</li>
</ul>

<h2>Machine</h2>

<p>Debugging is pretty much about verifying assumptions, in a perfect world the software or system we are working on would be working perfectly, the server is in perfect shape and everybody is happy. But actually, it NEVER goes this way, things ALWAYS fail (it’s tremendous!). </p>

<p>For the machine level, you want to ask yourself these questions:</p>

<ul>
<li>Does the server have free disk space? - <code>df</code></li>
<li>Is the server able to keep up with CPU load? - <code>w</code>, <code>top</code>, <code>ps</code></li>
<li>Does the server have available memory? <code>free</code></li>
<li>Are the server disk(s) able to keep up with read/write IO? - <code>htop</code></li>
</ul>

<p>If the answer is <strong>no</strong> for any of these questions, then that might be the reason why things are not going as expected. There are often 3 ways of solving the issue:</p>

<ul>
<li>free up resources (stop process(es) or reduce their resource consumption)</li>
<li>increase the machine resources (adding memory, CPU, disk space…)</li>
<li>distributing the resource usage to other machines</li>
</ul>

<h2>Network issue</h2>

<p>For the machine level, you want to ask yourself these questions:</p>

<ul>
<li>Does the server have the expected network interfaces and IPs up and running? <code>ifconfig</code></li>
<li>Does the server listen on the sockets that it is supposed to? <code>netstat</code> (<code>netstat -lpd</code> or <code>netstat -lpn</code>) </li>
<li>Can you connect from the location you want to connect from, to the socket you want to connect to? <code>telnet</code> to the IP + PORT (<code>telnet 8.8.8.8 80</code>)</li>
<li>Does the server have the correct firewall rules? <code>iptables</code>, <code>ufw</code>:

<ul>
<li><code>iptables -L</code></li>
<li><code>sudo ufw status</code></li>
</ul></li>
</ul>

<h2>Process issue</h2>

<p>If a piece of Software isn’t behaving as expected, it can obviously be because of above reasons… but the good news is that there is more to look into (there is ALWAYS more to look into actually).</p>

<ul>
<li>Is the software started? <code>init</code>, <code>init.d</code>:

<ul>
<li><code>service NAME_OF_THE_SERVICE status</code></li>
<li><code>/etc/init.d/NAME_OF_THE_SERVICE status</code></li>
</ul></li>
<li>Is the software process running? <code>pgrep</code>, <code>ps</code>:

<ul>
<li><code>pgrep -lf NAME_OF_THE_PROCESS</code></li>
<li><code>ps auxf</code></li>
</ul></li>
<li>Is there anything interesting in the logs? look for log files in <code>/var/log/</code> and <code>tail -f</code> is your friend</li>
</ul>

<h2>Debugging is fun</h2>

<p>Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck :)</p>

<p><img src="https://holbertonintranet.s3.amazonaws.com/uploads/medias/2020/9/bae58c9f066a9668001ef4b4c39778407439d2f9.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIARDDGGGOUWMNL5ANN%2F20201221%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20201221T153230Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=1da79ae87e082518fcecc5cd0a09c980457c7ad138761361672e8eb99543eacd" alt="" style=""></p>

</div>
 