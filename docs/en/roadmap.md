# Roadmap

## Strapi i18n Automation

- When creating a new locale entry, implement a script to automatically:
  - Map all relations (categories, criteria, ...) to the correct translation in the target locale if available, otherwise fallback to English.
  - (Advanced) Integrate auto-translation for text fields (title, description, slug, ...) using translation APIs (Google Translate, Deepl, ...).
- Can be done via custom lifecycle or custom endpoint/script.
- Priority: Implement relation mapping script first, then add auto-translation.

> This plan aims to optimize multilingual content workflow and reduce manual work when managing content in Strapi.
