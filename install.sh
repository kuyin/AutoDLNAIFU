
#!/bin/bash
export http_proxy=http://192.168.1.174:12798 && export https_proxy=http://192.168.1.174:12798
apt update
cd /root/autodl-tmp/
apt install -y -qq aria2
aria2c --summary-interval=5 -x 3 --allow-overwrite=true -Z \
 https://pub-2fdef7a2969f43289c42ac5ae3412fd4.r2.dev/naifu.tar \
 https://pub-2fdef7a2969f43289c42ac5ae3412fd4.r2.dev/animefull-latest.tar 
  
echo "Decompressing..."
tar xf naifu.tar && rm naifu.tar
echo "Done."


cd /root/autodl-tmp/naifu
pip install virtualenv && bash ./setup.sh
curl -Ls https://github.com/ekzhang/bore/releases/download/v0.4.0/bore-v0.4.0-x86_64-unknown-linux-musl.tar.gz | tar zx -C /usr/bin
curl -Lo /usr/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && chmod +x /usr/bin/cloudflared

