FROM nginx:1.19
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get update -y && apt-get install -y git curl nodejs && curl -sL https://github.com/gohugoio/hugo/releases/download/v0.80.0/hugo_extended_0.80.0_Linux-64bit.tar.gz | tar -xz hugo && mv hugo /usr/bin && npm i -g postcss-cli autoprefixer postcss
RUN git clone https://github.com/dmattoninnovtech/mslearn-aks-deployment-pipeline-github-actions /contoso-website
WORKDIR /contoso-website/src
RUN git submodule update --init themes/introduction
RUN hugo && mv public/* /usr/share/nginx/html
EXPOSE 80
