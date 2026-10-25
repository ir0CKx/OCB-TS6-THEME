from pathlib import Path
import hashlib,json,re,zipfile
r=Path(__file__).resolve().parents[1]
v=json.loads((r/'gg.ocb.obsidian/package.json').read_text(encoding='utf-8'))['version']
with zipfile.ZipFile(r/f'dist/OCB.GG-Glass-Dark-Theme-v{v}.zip') as z:
    names=set(z.namelist())
    assert {n for n in names if '/' not in n}=={'HOW TO USE.html','INSTALL OCB.GG DARK THEME.cmd','UNINSTALL OCB.GG DARK THEME.cmd'}
    assert not any(any(s in n.lower() for s in ['diagnos','start hier','changelog','test','rc.31']) for n in names)
    for line in z.read('Daten/SHA256SUMS.txt').decode().splitlines():
        digest,name=line.split('  ',1);assert hashlib.sha256(z.read(name)).hexdigest()==digest
    for link in re.findall(r'(?:href|src)="([^"]+)"',z.read('HOW TO USE.html').decode()):
        assert link=='https://ocb.gg/' or link in names,link
    for action,script in [('INSTALL','Install'),('UNINSTALL','Uninstall')]:
        assert '%~dp0Daten\\'+script+'.ps1' in z.read(action+' OCB.GG DARK THEME.cmd').decode()
print('PASS clean user package, launchers, hashes and guide links')
