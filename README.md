# ASTRO ASO CSV EXPORT UTILITY TOOL (Mac OS : Built with ❤️ in Flutter)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## if some apps from astro is not showing in utility tool then

- Just close astro for small time and reopen utility tool.

<!-- Tools Functinality -->

ASTRO CSV EXPORT TOOL (Tech: Flutter + macOS App - Open source)

- [x] Requirements:
  - [x] Want to check keyword difficulty and popularity across multiple regions before building an app
  - [x] Or create a temporary app and check a single keyword across all regions
  - [x] Want to add more then 50 Keywords for one store then also require CSV
- [x]Pain Points:
  - [x] Astro does not have a facility to import keywords for multiple regions (might come in future)
  - [x] It also does not provide an API to check popularity or difficulty, so we cannot check it outside Astro
  - [x] Need to create CSV files manually for different stores
  - [x] Also does not provide a CSV template for importing keywords
    - [ ] So, I guess everyone has to build one by exporting keywords first, with one keyword per country
- [x] Solutions:
  - [x] Develop a CSV utility tool for macOS using Flutter
- [x] Inputs:
  - [x] App names (CSV-separated if multiple apps)
  - [x] Countries-based / Language-based (if language-based is selected, then countries using those languages will be selected)
  - [x] Keywords (CSV-separated if multiple keywords)
  - [x] Show total CSV rows
- [x] Options:
  - [x] CSV split with a maximum row limit
    - [x] Benefit: Useful if the CSV becomes large and you want to split it to improve import performance
- [x] Result:
  - [x] CSV file with either split or complete rows
- [x] Import it into the Astro ASO Tool and check keywords easily across all regions
