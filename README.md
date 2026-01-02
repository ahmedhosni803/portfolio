# Ahmed Hussiney Portfolio

Personal portfolio website built with **Jaspr** (Dart for Web) for high performance and SEO.

## 🚀 Live Demo
[https://ahmedhosni803.github.io/portfolio/](https://ahmedhosni803.github.io/portfolio/)

## 🛠️ Tech Stack
- **Framework**: [Jaspr](https://docs.page/schultek/jaspr) (DartSSG)
- **Language**: Dart
- **Styling**: CSS / Jaspr Styles (Mobile Responsive)
- **Deployment**: GitHub Pages

## 📂 Project Structure
- `jaspr_portfolio/`: The main web application source code.
- `lib/`: (Legacy) Previous Flutter mobile implementation.

## 📦 How to Build & Deploy

1. Navigate to the project directory:
   ```bash
   cd jaspr_portfolio
   ```

2. Install dependencies:
   ```bash
   dart pub get
   ```

3. Run in development mode:
   ```bash
   dart run jaspr_cli:jaspr serve
   ```

4. Build for production (Release):
   ```bash
   dart run build_runner build --release --output build
   dart run jaspr_cli:jaspr build
   ```

5. Deploy to GitHub Pages:
   ```bash
   cd build/jaspr
   git init
   git add .
   git commit -m "Deploy"
   git branch -M main
   git remote add origin https://github.com/ahmedhosni803/portfolio.git
   git push -u origin main:gh-pages --force
   ```

## 📄 License
This project is licensed for personal use.
