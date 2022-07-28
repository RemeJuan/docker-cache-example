# Docker Cache Example

This is an example alongside my blog post [DIY node_modules cache for Docker in your CI](https://remelehane.dev/posts/diy-node-cache-for-docker-ci).

For testing purposes, you will first need to build the cache image, you can do so with the following command:

`docker build . -f Dockerfile.cache -t node-cache`.

Once done, you can build the main image, which will pull in the `node-cache` image with the following command:

`docker build . -t docker-cache-example`.

In order to run the image, simply run `docker run -p 7010:7010 docker-cache-example`.

You should then be able to see the vanilla [CRA](http://create-react-app.dev) app running at [localhost:7010](http://localhost:7010).
