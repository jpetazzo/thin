What Is This?
-------------

This code shows how to run the `Thin <http://code.macournoyer.com/thin/>`_
web server on `DotCloud <http://www.dotcloud.com/>`_.

Thin is a fast asynchronous web server, able to run Rack and Rails apps.

To run this code on DotCloud, you need to `get a DotCloud account
<https://www.dotcloud.com/accounts/register/>`_. DotCloud has a free tier,
so you won't even need to draw your wallet!

Then clone this repository::

  $ git clone git://github.com/jpetazzo/thin.git

And push it to DotCloud::

  $ cd thin
  $ dotcloud push thin

Happy hacking! Remember: each time you modify something, you need to
git add + git commit your changes before doing ``dotcloud push``.


How Does It Work?
-----------------

Since DotCloud cannot run arbitrary web servers (yet!), we use a ruby
service (which uses the nginx web server to handle HTTP requests). Inside
this service, we setup Thin to run on port 8080. Then, we add a nginx
configuration snippet to proxy all incoming HTTP requests to port 8080,
effectively routing them to Thin.

To streamline scaling and deployment, we use a Gemfile (to install the
thin gem automatically), as well as the god process manager (to start
Thin automatically).

**This repository is also a step-by-step tutorial:** each commit
corresponds to one step, with the commit message providing explanations. 

You can view the whole tutorial, and the modified files at each step,
with at least three different methods:

* by using GitHub's awesome `compare view
  <https://github.com/jpetazzo/thin/compare/begin...end>`_:
  you will see the list of commits involved in the tutorial, and by
  clicking on each individual commit, you will see the file modifications
  for this step;
* by running ``git log --patch --reverse`` in your local repository,
  for a text-mode equivalent (with the added benefit of being available
  offline!);
* by browsing a more `traditional version 
  <http://docs.dotcloud.com/tutorials/ruby/thin/>`_ on DotCloud's
  documentation website.

You can also learn more by diving into `DotCloud documentations
<http://docs.dotcloud.com/>`_, especially the one for the `Ruby service
<http://docs.dotcloud.com/services/ruby/>`_ which is used by this app.


Is This A Hack?
---------------

Yes, in the positive acceptance of this word :-)


Is This Supported?
------------------

Not officially. However, since it uses only documented parts of DotCloud
(ruby service, postinstall script, nginx snippet...), it will very probably
still work with future versions of DotCloud.

As a matter of fact, when DotCloud will release better support for Thin
and other evented web servers, the modifications required to update your
code will most certainly be very, very minor.

