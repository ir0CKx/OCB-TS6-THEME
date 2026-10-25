const fs=require('fs'),path=require('path'),{spawnSync}=require('child_process');
if(!process.env.TS6_CSS||!fs.existsSync(process.env.TS6_CSS))throw Error('TS6_CSS must point to the installed client main.css (see docs/development/README.md).');
fs.mkdirSync(path.resolve(__dirname,'../test-results'),{recursive:true});
for(const name of ['states','stream-basic','chat','media','profile','channel-editor','dashboard']){
 const r=spawnSync(process.execPath,[path.join(__dirname,name+'.cjs')],{stdio:'inherit',env:process.env});
 if(r.status!==0)process.exit(r.status||1);
}
