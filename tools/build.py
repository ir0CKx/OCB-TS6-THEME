"""Build a clean, deterministic user package. Run from any directory."""
from pathlib import Path
import hashlib, json, shutil, tempfile, zipfile
ROOT = Path(__file__).resolve().parents[1]
def build():
    version = json.loads((ROOT/'gg.ocb.obsidian/package.json').read_text(encoding='utf-8'))['version']
    dest = ROOT/'dist'; dest.mkdir(exist_ok=True)
    archive = dest/f'OCB.GG-Glass-Dark-Theme-v{version}.zip'
    with tempfile.TemporaryDirectory(prefix='ocb-build-',dir=dest) as tmp:
        stage = Path(tmp); data = stage/'Daten'; data.mkdir()
        guide = stage/'Anleitung'; guide.mkdir()
        shutil.copytree(ROOT/'gg.ocb.obsidian', data/'gg.ocb.obsidian')
        for name in ['Install.ps1','Uninstall.ps1','Verify-Package.ps1']:
            shutil.copy2(ROOT/name,data/name)
        for action in ['INSTALL','UNINSTALL']:
            name=action+' OCB.GG DARK THEME.cmd'; shutil.copy2(ROOT/name,stage/name)
        for name in ['INSTALLATION-UEBERSICHT.svg','LICENSE.txt','NUTZUNGSBEDINGUNGEN-DE.md']:
            shutil.copy2(ROOT/name,guide/name)
        shutil.copy2(ROOT/'docs/HOW TO USE.html',stage/'HOW TO USE.html')
        files=sorted(p for p in stage.rglob('*') if p.is_file())
        (data/'SHA256SUMS.txt').write_text(''.join(hashlib.sha256(p.read_bytes()).hexdigest()+'  '+p.relative_to(stage).as_posix()+'\n' for p in files),encoding='utf-8')
        assert all(p.stat().st_size<=2097152 for p in (data/'gg.ocb.obsidian').rglob('*') if p.is_file())
        with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
            for p in sorted(stage.rglob('*')):
                if p.is_file():
                    info=zipfile.ZipInfo(p.relative_to(stage).as_posix(),(2026,1,1,0,0,0))
                    info.compress_type=zipfile.ZIP_DEFLATED; info.external_attr=0o644<<16
                    z.writestr(info,p.read_bytes())
        with zipfile.ZipFile(archive) as z: assert z.testzip() is None
    (dest/(archive.name+'.sha256')).write_text(hashlib.sha256(archive.read_bytes()).hexdigest()+'  '+archive.name+'\n')
    print(archive)
    return archive
if __name__=='__main__': build()
