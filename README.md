# hoc-badge-action

![Hits-of-Code Badge](https://github.com/MikhailEpatko/hoc-badge-action/blob/image-data/hoc-badge.svg)

GitHub action to generate Hits-of-Code badge with hoc calculated metric.

**hoc** - is a command line tool to calculate Hits-of-Code metric
in a source code repository.

You can read more about Hits-of-Code metric in this blog post:
 [Hits-of-Code Instead of SLoC](http://www.yegor256.com/2014/11/14/hits-of-code.html).

[**hoc** project page](https://github.com/yegor256/hoc/tree/master)

To install action copy the workflow code into
a .github/workflows/main.yml file in your repository

```yaml
on: [push]

jobs:
  lines_counter_job:
    runs-on: ubuntu-latest
    name: A job to count hits of code
    steps:
      - uses: actions/checkout@v4
      - id: badge-generator
        uses: ./                     # Write the action name instead.
        with:
          since: 2000-01-01          # Default value: '2000-01-01'.
          before: 2024-03-03'        # Default value: now day.
          dir: .                     # Default value: include all files in the current directory.
          exclude: |-                # We can use multiline strings if we want something close to multiline values.
           dir1/**                  ## It's an important detail that we used '|-' in the YAML and not '|'.
           dir2/**/*                ## There is no default value for exclude option.
           dir3/file.txt
          output_dir: ./output       # Default value: './output'.
          filename: hoc-badge.svg    # Default value: 'hoc-badge.svg'.
```

The badge will be generated into the file ./output/hoc-badge.svg by default.

Use whatever tool you prefer to upload it somewhere.
