# astro_aso_csv_utility

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

- [ ] Requirements:
  - [ ] Want to check keyword difficulty and popularity across multiple regions before building an app
  - [ ] Or create a temporary app and check a single keyword across all regions
  - [ ] Want to add more then 50 Keywords for one store then also require CSV
- [ ] Pain Points:
  - [ ] Astro does not have a facility to import keywords for multiple regions (might come in future)
  - [ ] It also does not provide an API to check popularity or difficulty, so we cannot check it outside Astro
  - [ ] Need to create CSV files manually for different stores
  - [ ] Also does not provide a CSV template for importing keywords
    - [ ] So, I guess everyone has to build one by exporting keywords first, with one keyword per country
- [ ] Solutions:
  - [ ] Develop a CSV utility tool for macOS using Flutter
- [ ] Inputs:
  - [ ] App names (CSV-separated if multiple apps)
  - [ ] Countries-based / Language-based (if language-based is selected, then countries using those languages will be selected)
  - [ ] Keywords (CSV-separated if multiple keywords)
  - [ ] Show total CSV rows
- [ ] Options:
  - [ ] CSV split with a maximum row limit
    - [ ] Benefit: Useful if the CSV becomes large and you want to split it to improve import performance
- [ ] Result:
  - [ ] CSV file with either split or complete rows
- [ ] Import it into the Astro ASO Tool and check keywords easily across all regions
