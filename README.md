# DREAD score calculator for Dradis

This simple addon adds a new page under `/calculators/dread` for you to perform DREAD score calculations:

![](https://cloud.githubusercontent.com/assets/53006/3952474/9ce4adf0-26e2-11e4-9400-c03c6f28a89c.png)

DREAD stands for (D)amage, (R)eproducibility, (E)xploitability, (A)ffected users, (D)iscoverability and is a common risk assessment model [introduced by Microsoft](http://blogs.msdn.com/b/david_leblanc/archive/2007/08/13/dreadful.aspx).

The add-on requires [Dradis CE](https://dradisframework.com/) > 3.0, or [Dradis Pro](https://dradisframework.com/pro/).


## Install

Add this to your `Gemfile.plugins`:

    gem 'dradis-calculator_dread'

And

    bundle install

Restart your Dradis server and you should be good to go.


## More information

See the Dradis Framework's [README.md](https://github.com/dradis/dradisframework/blob/master/README.md)


## Contributing

See the Dradis Framework's [CONTRIBUTING.md](https://github.com/dradis/dradisframework/blob/master/CONTRIBUTING.md)


## License

Dradis Framework and all its components are released under [GNU General Public License version 2.0](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html) as published by the Free Software Foundation and appearing in the file LICENSE included in the packaging of this file.


## Feature requests and bugs

Please use the [Dradis Framework issue tracker](https://github.com/dradis/dradis-ce/issues) for add-on improvements and bug reports.
