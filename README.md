# Astro ASO CSV Utility

Open-source macOS utility built with Flutter to generate Astro-compatible CSV files for large-scale keyword workflows.

## Why this tool exists

Astro ASO workflows can get repetitive when you need to:

- check many keywords across multiple regions
- build temporary app setups for keyword validation
- prepare CSV files for imports at scale (including more than 50 keywords)

This utility removes manual CSV preparation and helps you produce clean import files faster.

## What problem it solves

- Astro does not currently provide a direct multi-region keyword import workflow.
- Popularity/difficulty checks are typically tied to Astro usage patterns.
- Teams often create CSV files manually for each market or app.
- There is no simple built-in CSV template flow for these use cases.

## Features

- Generate Astro-ready CSV files from simple text inputs
- Support multiple app names (comma-separated)
- Support multiple keywords (comma-separated)
- Select targets by:
  - countries
  - languages (automatically maps to countries using selected languages)
- Preview total CSV row count before export
- Export as:
  - single CSV file
  - split CSV files by max row limit (better for large imports)

## Tech stack

- Flutter (macOS desktop)
- Dart SDK `>=3.5.4 <4.0.0`
- Flutter SDK `3.24.5`

## Requirements

- macOS
- Flutter SDK `3.24.5`
- Dart SDK compatible with project constraints

## Getting started

### 1) Clone the repository

```bash
git clone https://github.com/<your-org-or-username>/astro_aso_csv_utility.git
cd astro_aso_csv_utility
```

### 2) Install dependencies

```bash
flutter pub get
```

### 3) Run the app (macOS)

```bash
flutter run -d macos
```

## Usage flow

1. Enter one or more app names (comma-separated).
2. Choose target scope by countries or languages.
3. Enter one or more keywords (comma-separated).
4. Review generated row count.
5. (Optional) Set max rows per file for split export.
6. Export CSV and import into Astro.

## Notes

- If some Astro apps are not visible in your workflow, close Astro briefly and reopen the utility.
- For very large datasets, use split export to improve import performance and manageability.

## Contributing

Contributions are welcome. If you find a bug or want to improve the utility:

1. Open an issue with context and reproduction steps.
2. Fork the repo and create a feature branch.
3. Submit a pull request with a clear description.

## License

This project is open source. Add your preferred license file (`LICENSE`) and update this section (for example, MIT).
