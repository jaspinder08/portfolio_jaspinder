# Portfolio App - Flutter

A fully responsive portfolio application built with Flutter and Dart, designed for deployment on web and mobile platforms. This app showcases professional skills, projects, and experience with a modern, elegant design.

## ✨ Features

### 🏠 Welcome/Home Section
- Animated profile image with professional styling
- Professional name and tagline
- Call-to-action button
- Smooth fade and slide animations

### 👤 About Section
- Professional biography
- Education history
- Work experience timeline
- Skills with proficiency indicators (1-5 star rating)
- Organized by categories (Mobile, Frontend, Backend, etc.)

### 🚀 Projects Section
- Responsive grid layout (1 column on mobile, 2 on tablet, 3 on desktop)
- Project cards with images, descriptions, and technology tags
- External project links and GitHub repository links
- Technology stack indicators

### 💬 Testimonials Section
- Carousel of client/colleague testimonials
- Author information with profile pictures
- Page indicators for navigation
- Professional quote styling

### 📞 Contact Section
- Contact form with validation
- Required fields: Name, Email, Message
- Optional field: Phone number
- Contact information display
- Social media links (LinkedIn, GitHub, Twitter, Portfolio)
- Form submission with loading states

### 🎨 Design Features
- **Material Design 3** principles
- **Light and Dark themes** with theme toggle
- **Fully responsive** design for all screen sizes
- **Smooth animations** and transitions
- **Professional color scheme** with primary color variations
- **Card-based layout** with proper elevation and shadows

### 📱 Responsive Design
- **Mobile**: Single column layout with bottom navigation
- **Tablet**: Two-column layout with optimized spacing
- **Desktop**: Multi-column layout with horizontal navigation
- **Navigation**: Drawer for mobile, horizontal menu for desktop

## 🛠️ Technical Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart (null safety compliant)
- **State Management**: Provider pattern
- **Theme Management**: Custom ThemeProvider with persistence
- **URL Handling**: url_launcher package for external links
- **Storage**: SharedPreferences for theme persistence
- **Architecture**: Clean separation of concerns with models, screens, and providers

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
├── providers/                # State management
└── screens/                  # UI sections
    ├── home_screen.dart      # Main navigation and layout
    ├── welcome_section.dart  # Home/welcome section
    ├── about_section.dart    # About and skills section
    ├── projects_section.dart # Projects showcase
    ├── testimonials_section.dart # Client testimonials
    └── contact_section.dart  # Contact form and info
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart SDK 2.19 or higher
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd portfolio_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your images**
   - Place your profile and project images in the `assets/images/` folder
   - Update image paths in the code if needed
   - See `assets/images/README.md` for detailed image requirements

4. **Customize content**
   - Update personal information in each section
   - Modify project details, skills, and testimonials
   - Update contact information and social media links

5. **Run the app**
   ```bash
   # For web
   flutter run -d chrome
   
   # For mobile
   flutter run
   ```

## 📱 Platform Support

### Web Deployment
```bash
flutter build web
```
The built web files will be in `build/web/` directory, ready for deployment to any web hosting service.

### Mobile Deployment
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🎨 Customization

### Colors and Themes
- Modify `lib/providers/theme_provider.dart` to change color schemes
- Update primary and secondary colors in the theme data
- Customize card elevations and border radius values

### Content Updates
- **Profile**: Update name, tagline, and profile image in `welcome_section.dart`
- **About**: Modify bio, education, and work experience in `about_section.dart`
- **Projects**: Add/remove projects in `projects_section.dart`
- **Skills**: Update skill list and proficiency levels in `about_section.dart`
- **Testimonials**: Modify client quotes and information in `testimonials_section.dart`
- **Contact**: Update contact details and social links in `contact_section.dart`

### Styling
- Adjust responsive breakpoints in each section
- Modify card designs and spacing
- Update typography and font sizes
- Customize animation durations and curves

## 📦 Dependencies

The app uses the following key packages:

- **url_launcher**: For opening external links and URLs
- **provider**: For state management and theme switching
- **shared_preferences**: For persisting theme preferences

See `pubspec.yaml` for complete dependency list and versions.

## 🔧 Configuration

### Image Assets
- Ensure all images are properly referenced in `pubspec.yaml`
- Use consistent naming conventions for image files
- Optimize images for web and mobile performance

### External Links
- Update project links to point to your actual projects
- Modify social media URLs to your profiles
- Ensure all URLs are valid and accessible

## 🚀 Deployment

### Web Hosting
- **Netlify**: Drag and drop the `build/web` folder
- **Vercel**: Connect your repository and set build command
- **GitHub Pages**: Push the `build/web` folder to gh-pages branch
- **Firebase Hosting**: Use `firebase deploy` command

### Mobile App Stores
- **Google Play Store**: Upload the generated APK
- **Apple App Store**: Use Xcode to archive and upload

## 📝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on multiple platforms
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Support

If you have any questions or need help with customization:

1. Check the code comments for implementation details
2. Review the Flutter documentation for widget usage
3. Open an issue for bugs or feature requests
4. Contact the developer for custom development needs

## 🎯 Future Enhancements

- [ ] Blog section integration
- [ ] Portfolio analytics dashboard
- [ ] Multi-language support
- [ ] Advanced animations and micro-interactions
- [ ] SEO optimization for web
- [ ] PWA capabilities
- [ ] Offline support
- [ ] Social media sharing features
- [ ] Advanced IoT dashboard interface

---

**Built with ❤️ using Flutter and Dart**

*This portfolio app demonstrates modern Flutter development practices, responsive design principles, and professional UI/UX standards.*
