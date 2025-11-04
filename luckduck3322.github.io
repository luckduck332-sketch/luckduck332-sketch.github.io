<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>System Alert — Critical Security Breach</title>
<style>
  :root{--bg:#050507;--red:#d32f2f;--text:#e9e9ea;--muted:#9a9aa0}
  html,body{height:100%;margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,"Helvetica Neue",Arial}
  body{background:linear-gradient(180deg,var(--bg),#0b0b0d);color:var(--text);display:flex;align-items:center;justify-content:center}
  .box{width:94%;max-width:760px;padding:28px;border-radius:10px;background:rgba(255,255,255,0.02);box-shadow:0 12px 40px rgba(0,0,0,0.6);text-align:left}
  h1{color:var(--red);margin:0 0 6px;font-size:26px;letter-spacing:0.3px}
  p.lead{font-size:16px;margin:6px 0 18px;color:var(--muted)}
  .count{font-size:40px;font-weight:700;margin:12px 0;color:var(--text)}
  .small{color:var(--muted);font-size:13px}
  .btn{display:inline-block;margin-top:18px;padding:10px 14px;border-radius:8px;background:#161616;border:1px solid rgba(255,255,255,0.03);color:var(--text);text-decoration:none}
  .footer{margin-top:16px;color:var(--muted);font-size:13px}
  .warning-icon{display:inline-block;width:44px;height:44px;border-radius:8px;background:rgba(211,47,47,0.08);margin-right:12px;vertical-align:middle}
  .row{display:flex;align-items:center}
  ul {margin:6px 0 12px;color:var(--muted); padding-left:18px}
  code{background:rgba(255,255,255,0.02);padding:2px 6px;border-radius:4px}
</style>
</head>
<body>
<div class="box" role="main" aria-live="polite">
  <div class="row">
    <div class="warning-icon" aria-hidden="true">
      <svg width="44" height="44" viewBox="0 0 24 24" fill="none" style="display:block;margin:6px" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2L22 20H2L12 2Z" fill="#d32f2f"/>
        <path d="M11 9h2v5h-2V9zm0 7h2v2h-2v-2z" fill="#fff"/>
      </svg>
    </div>
    <div>
      <h1>System Alert — Critical Security Breach</h1>
      <p class="lead">Multiple high-severity threats detected. Automatic containment and purge procedures initialized.</p>
    </div>
  </div>

  <div style="margin-top:8px">
    <div class="small">Detected threats (summary):</div>
    <ul>
      <li>Unauthorized background processor mining sensitive data</li>
      <li>Exfiltration of user credentials to remote host</li>
      <li>Backdoor allowing remote access and control</li>
    </ul>

    <div class="count" id="count">Automatic data purge in <span id="secs">25</span> seconds</div>

    <div class="small">Do not power off the device or attempt to modify system files during the procedure.</div>

    <a class="btn" id="panicBtn" href="#" onclick="reveal();return false">Halt procedure</a>

    <div class="footer" style="display:none" id="revealText">
      <strong>SIMULATION — NO DATA WAS HARMED.</strong> This page is a prank. Please do not use this on people who will be seriously alarmed.  
      <div style="margin-top:6px">To redirect after the simulation, append <code>?go=https://youtu.be/dQw4w9WgXcQ</code> to this page's URL.</div>
    </div>
  </div>
</div>

<!-- audio: make sure you uploaded alert.mp3 (or rename the src below to match) -->
<audio id="sound" src="alert.mp3" preload="auto"></audio>

<script>
  // countdown + audio control
  let secs = 25; // change this number to adjust countdown length
  const sEl = document.getElementById('secs');
  const revealText = document.getElementById('revealText');
  const panicBtn = document.getElementById('panicBtn');
  const audio = document.getElementById('sound');
  let timer = null;

  function startAlarm() {
    try {
      audio.loop = true;
      audio.volume = 0.6;
      audio.play().catch(()=>{ /* autoplay blocked; fallback handled below */ });
    } catch(e){}
  }

  function stopAlarm() {
    try { audio.pause(); audio.currentTime = 0; } catch(e){}
  }

  // begin countdown and audio
  function beginCountdown(){
    startAlarm();
    timer = setInterval(()=> {
      secs--;
      sEl.textContent = secs;
      if(secs <= 0) {
        clearInterval(timer);
        reveal();
      }
    }, 1000);
  }

  // attempt to autoplay; if blocked, start on first interaction
  audio.play().catch(() => {
    const onFirstInteract = () => {
      startAlarm();
      // begin countdown on first interaction if it hasn't started yet
      if(!timer) beginCountdown();
      window.removeEventListener('touchstart', onFirstInteract);
      window.removeEventListener('mousedown', onFirstInteract);
    };
    window.addEventListener('touchstart', onFirstInteract, {once:true});
    window.addEventListener('mousedown', onFirstInteract, {once:true});
  });

  // If autoplay succeeded, start countdown immediately
  audio.play().then(()=> { if(!timer) beginCountdown(); }).catch(()=>{ /* ignored */ });

  function reveal(){
    clearInterval(timer);
    stopAlarm();
    document.querySelector('.count').textContent = 'Alert cleared — simulation complete';
    revealText.style.display = 'block';
    const params = new URLSearchParams(location.search);
    const target = params.get('go');
    if(target){
      setTimeout(()=> { location.href = target; }, 1500);
    }
  }

  panicBtn.addEventListener('click', ()=> {
    reveal();
  });
</script>

</body>
</html>
