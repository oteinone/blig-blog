# Personal Blog

A simple personal blog built with Hugo, featuring an About page and blog posts.

## Targets

- Clean, minimal design
- About page
- Blog posts list on homepage
- Write posts in Markdown
- Static site generation
- SFTP deployment to Hetzner

## Getting Started

### Local Development Commands

*Start the Hugo development server*
```bash
hugo server -D
```

### Creating Content

#### Add a New Blog Post

Create a new markdown file in `content/posts/`:

```bash
hugo new content posts/my-new-post.md
```

Or manually create a file with this frontmatter:

```markdown
---
title: "My Post Title"
date: 2026-01-01
draft: false
---

Your content here...
```

#### Edit the About Page

Edit the file at `content/about/_index.md`

### Building the Site

To build the static site:

```bash
hugo
```

This generates the site in the `public/` directory.

## Deployment to Hetzner

### Setup

1. Copy the example environment file:
```bash
cp .env.example .env
```

2. Edit `.env` with your Hetzner SFTP credentials:
```
SFTP_HOST=your-server.hetzner.com
SFTP_USER=your-username
SFTP_REMOTE_PATH=/var/www/html
```

### Deploy

Run the deployment script:

```bash
./deploy.sh
```

This will:
1. Build the Hugo site
2. Upload the `public/` directory to your Hetzner server via SFTP

## Configuration

Edit `hugo.toml` to customize:

- `title`: Your blog title
- `baseURL`: Your domain (important for production)
- Other site parameters

## File Structure

```
.
├── content/
│   ├── about/          # About page
│   └── posts/          # Blog posts
├── themes/
│   └── simple/         # Custom minimal theme
├── hugo.toml           # Hugo configuration
├── deploy.sh           # SFTP deployment script
└── public/             # Generated static site (created by hugo build)
```
