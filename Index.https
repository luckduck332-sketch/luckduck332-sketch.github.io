<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>System Warning</title>
<style>
  :root{--bg:#0b0b0f;--red:#ff3b3b;--text:#e6e6e6;--muted:#bdbdbd}
  html,body{height:100%;margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,"Helvetica Neue",Arial}
  body{background:linear-gradient(180deg,#0b0b0f,#111);color:var(--text);display:flex;align-items:center;justify-content:center}
  .box{width:95%;max-width:760px;padding:28px;border-radius:12px;background:rgba(255,255,255,0.02);box-shadow:0 10px 30px rgba(0,0,0,0.6);text-align:left}
  h1{color:var(--red);margin:0 0 6px;font-size:28px}
  p.lead{font-size:18px;margin:6px 0 18px;color:var(--muted)}
  .count{font-size:42px;font-weight:700;margin:12px 0;color:var(--text)}
  .small{color:var(--muted);font-size:13px}
  .btn{display:inline-block;margin-top:18px;padding:10px 14px;border-radius:8px;background:#222;border:1px solid rgba(255,255,255,0.05);color:var(--text);text-decoration:none}
  .footer{margin-top:16px;color:var(--muted);font-size:13px}
  /* to look more like an alert */
  .warning-icon{display:inline-block;width:44px;height:44px;border-radius:10px;background:linear-gradient(180deg,#fff1 0,#fff0);margin-right:12px;vertical-align:middle}
  .row{display:flex;align-items:center}
</style>
</head>
<body>
<div class="box" role="main" aria-live="polite">
  <div class="row">
    <div class="warning-icon" aria-hidden="true">
      <svg width="44" height="44" viewBox="0 0 24 24" fill="none" style="display:block;margin:6px" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2L22 20H2L12 2Z" fill="#ff3b3b"/>
        <path d="M11 9h2v5h-2V9zm0 7h2v2h-2v-2z" fill="#fff"/>
      </svg>
    </div>
    <div>
      <h1>⚠️ System Security Alert</h1>
      <p class="lead">Multiple threats detected. Immediate action required.</p>
    </div>
  </div>

  <div style="margin-top:6px">
    <div class="small">Threats detected:</div>
    <ul style="margin:6px 0 12px;color:var(--muted)">
      <li>Unauthorized background miner</li>
      <li>Critical user data leak</li>
      <li>Remote access backdoor</li>
    </ul>

    <div class="count" id="count">Data wipe in <span id="secs">10</span> s</div>

    <div class="small">Please do NOT power off your device during the process.</div>

    <a class="btn" id="panicBtn" href="#" onclick="reveal();return false">Stop the process</a>

    <div class="footer" style="display:none" id="revealText">
      <strong>jk 😂</strong> Your phone is totally fine — this was a prank. Chill.  
      <div style="margin-top:6px">If you’re the prankster: don’t use on strangers. If you wanna do the redirect version, paste a URL parameter like <code>?go=https://youtu.be/dQw4w9WgXcQ</code> after the page URL.</div>
    </div>
  </div>
</div>

<script>
  // countdown
  let secs = 10;
  const sEl = document.getElementById('secs');
  const revealText = document.getElementById('revealText');
  const panicBtn = document.getElementById('panicBtn');

  const timer = setInterval(()=> {
    secs--;
    sEl.textContent = secs;
    if(secs <= 0) {
      clearInterval(timer);
      reveal();
    }
  }, 1000);

  function reveal(){
    clearInterval(timer);
    // flashy "reveal"
    document.querySelector('.count').textContent = 'Prank complete';
    revealText.style.display = 'block';
    // if there's a ?go= URL param, redirect after a short pause
    const params = new URLSearchParams(location.search);
    const target = params.get('go');
    if(target){
      setTimeout(()=> {
        location.href = target;
      }, 1500);
    }
  }

  panicBtn.addEventListener('click', ()=> {
    reveal();
  });

  // optional: try to get a tiny beep to feel real (user gesture may be required)
  try{
    const ctx = new (window.AudioContext || window.webkitAudioContext)();
    const o = ctx.createOscillator();
    o.type = 'sine'; o.frequency.value = 440;
    const g = ctx.createGain(); g.gain.value = 0.001;
    o.connect(g); g.connect(ctx.destination);
    o.start(); setTimeout(()=> o.stop(), 120);
  }catch(e){}
</script>
</body>
</html>
