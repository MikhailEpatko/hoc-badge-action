# hoc-badge-action 
![Hits-of-Code Badge](https://github.com/MikhailEpatko/hits-of-code-badge/blob/image-data/hits.svg)


GitHub action to generate Hits-of-Code badge with hoc calculated metric.

**hoc** - is a command line tool to calculate Hits-of-Code metric in a source code repository (at the moment it supports Git 2+ and Subversion 1.7+). 

 You can read more about Hits-of-Code metric in this blog post: [Hits-of-Code Instead of SLoC](http://www.yegor256.com/2014/11/14/hits-of-code.html).

[**hoc** project page](https://github.com/yegor256/hoc/tree/master)

To install action copy the workflow code into a .github/workflows/main.yml file in your repository

```
on: [push]

jobs:
  lines_counter_job:
    runs-on: ubuntu-latest
    name: A job to count hits of code
    steps:
      - uses: actions/checkout@v4
      - id: badge-generator
        uses: ./                     # write the action name instead
        with:
          before: 2024-03-03'        # default value - now day
          dir: .                     # default value - include all files
          exclude: vendor/**         # no default value 
          since: 2000-01-01          # default value - '2000-01-01'
          output_dir: ./output       # default value - './output'
          filename: hoc-badge.svg    # default value - 'hoc-badge.svg'
```

The badge will be generated into file ./output/hoc-badge.svg by default.

Use whatever tool you prefer to upload it somewhere.
