const fs=require('fs'),path=require('path');
const {chromium}=require('playwright');
const r=path.resolve(__dirname,'..');
const native=fs.readFileSync(process.env.TS6_CSS,'utf8');
const css=fs.readFileSync(path.join(r,'gg.ocb.obsidian/obsidian.css'),'utf8');
(async()=>{const b=await chromium.launch({executablePath:process.env.CHROME_PATH||undefined,headless:true});const p=await b.newPage();
const cases=[];for(const width of [260,295,360,600,900])for(const zoom of [1,1.25,1.5,2]){
await p.setContent(`<style>${native}</style><style>${css}</style><style>body{margin:0;zoom:${zoom}}.panel{width:${width}px}.ts-parsed-text-content{display:block}</style><div class="panel"><div class="ts-chat-message-main"><div class="ts-parsed-text-content"><pre>${'long_code_without_spaces_'.repeat(80)}\n  indent preserved</pre><img width="3840" height="2160" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='3840' height='2160'%3E%3C/svg%3E"></div></div></div>`);
const v=await p.evaluate(()=>{const panel=document.querySelector('.panel'),pre=document.querySelector('pre'),im=document.querySelector('img');return {overflow:panel.scrollWidth>panel.clientWidth+1,codeScroll:pre.scrollWidth>pre.clientWidth,codeWhitespace:getComputedStyle(pre).whiteSpace,imageWidth:im.offsetWidth,imageHeight:im.offsetHeight}});
if(v.overflow||!v.codeScroll||v.codeWhitespace!=='pre'||Math.abs(v.imageWidth/v.imageHeight-16/9)>.02)throw Error(JSON.stringify({width,zoom,v}));cases.push({width,zoom,...v});}
await b.close();fs.writeFileSync(path.join(r,'test-results','PRUEFBERICHT-RC28-MEDIA.json'),JSON.stringify({liveClient:false,cases},null,2));console.log('PASS '+cases.length+' attachment/code cases');})().catch(e=>{console.error(e);process.exit(1)});
