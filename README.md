# Project Koku Website

Landing page and documentation for [Project Koku](https://github.com/project-koku),
hosted on [GitHub Pages](https://project-koku.github.io/).

Built with [Hugo](https://gohugo.io/) and the
[Hextra](https://github.com/imfing/hextra) theme.

## Local development

Prerequisites: [Hugo Extended](https://gohugo.io/installation/) (v0.147+)
and [Go](https://go.dev/dl/) (1.23+).

```bash
git clone https://github.com/project-koku/project-koku.github.io.git
cd project-koku.github.io
make serve        # http://localhost:1313
```

To build the static site for production:

```bash
make build        # output in public/
```

## Deployment

Pushes to `main` trigger the GitHub Actions workflow in
`.github/workflows/hugo.yaml`, which builds and deploys to GitHub Pages.
