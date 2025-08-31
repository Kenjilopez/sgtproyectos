// Navegación simple entre secciones
const buttons = document.querySelectorAll('.nav-item');
const sections = document.querySelectorAll('.section');

buttons.forEach(btn=>btn.addEventListener('click',()=>{
  buttons.forEach(b=>b.classList.remove('active'));
  btn.classList.add('active');
  const id = btn.dataset.section;
  sections.forEach(s=>s.classList.remove('visible'));
  document.getElementById(id).classList.add('visible');
}));

// Charts simples
for(const el of document.querySelectorAll('.chart')){
  const val = parseInt(el.dataset.val||'50',10);
  el.style.setProperty('--val', val);
  el.textContent = val+'%';
}

// Modales
function openModal(id){ document.getElementById(id).style.display='flex'; }
function closeModal(id){ document.getElementById(id).style.display='none'; }
window.openModal=openModal; window.closeModal=closeModal;