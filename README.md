# tools to work with hpmor text

This is a set of tools that make some linguistics analytics with the text
Harry Potter and the Methods of Rationality.

It uses the [plain text version of book](https://github.com/bessarabov/hpmor).

Maybe you shouldn't use this tools, but use the result of their work.

 * words statistics — https://gist.github.com/bessarabov/24aafa6492ae49f52d66
 * text split into sentences — https://gist.github.com/bessarabov/71315d4f647bf34a80cf

But if you need to use this tools, first you need to build docker image:

    docker build --tag hpmor-tools .

And then you should run that tools, something like this:

    docker run \
        --volume /Users/bessarabov/Dropbox/git/hpmor:/data \
        hpmor-tools
