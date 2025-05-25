# RateBox - Product and Service Review Platform

RateBox is a comprehensive product and service review platform, built with the goal of providing reliable information to users. This project is an upgraded version of [danhgia.net](https://danhgia.net), using modern technology to deliver a better experience.

## Technology Stack

- **Frontend**: Next.js
- **Backend/CMS**: Strapi
- **Database**: PostgreSQL
- **Deployment**: Docker

## Core Features

- Product/service review system
- Category management
- Blog
- Landing pages with components:
  - Hero sections
  - Features
  - Testimonials
  - Pricing plans
  - FAQs
  - Social media integration

## Documentation

The documentation is organized into the following sections:

1. [Introduction](introduction/overview.md)
2. [Getting Started](getting-started/installation.md)
3. [Features](features/review-system.md)
4. [Deployment](deployment/staging.md)
5. [Contributing](contributing/git-workflow.md)
6. [API Reference](api-reference/authentication.md)

## Contributing

We welcome all contributions! Please see the [contribution guide](contributing/git-workflow.md) for more details.

## License

---

### About Listing Type

**Listing Type** is used to group businesses that belong to the same Directory but have different data structures and review/rating criteria.

---

### The Role of Category

**Category** is a key component for organizing, classifying, and optimizing both user experience and SEO in a review/listing system. Main roles of Category include:

- Creating group-specific descriptions, featured images, meta titles, and meta descriptions (SEO for category pages).
- Building dedicated landing pages for each group of listings (e.g., `/category/travel` with its own banner, introduction, and content).
- Customizing UI, breadcrumbs, and dynamic menus for each group.
- Managing classification, filtering, sorting, and permissions by group.
- Supporting multi-level navigation/menus, making it easier for users to browse and find content.
- Enabling marketing campaigns or special landing pages for each topic or group.
- Optimizing search and pagination experience for each product/service group.

---

### Relationship between Category and Listing Type

- **Each Category always maps to one Listing Type.**
- **Multiple Categories can share the same Listing Type.** For example, "SUV", "Sedan", and "Truck" categories can all use the "Cars" Listing Type.
- This model allows you to reuse data schemas and review criteria for different groups, while each group can still have its own presentation, SEO, filtering, and landing page.
- Each Listing (data record) links to a Category, which in turn determines the appropriate Listing Type for rendering the correct form and review criteria.

[MIT License](LICENSE)

---

## TODO: Strapi i18n Automation

- When creating a new locale entry, implement a script to automatically:
  - Map all relations (categories, criteria, ...) to the correct translation in the target locale if available, otherwise fallback to English.
  - (Advanced) Integrate auto-translation for text fields (title, description, slug, ...) using translation APIs (Google Translate, Deepl, ...).
- Can be done via custom lifecycle or custom endpoint/script.
- Priority: Implement relation mapping script first, then add auto-translation.

> This plan aims to optimize multilingual content workflow and reduce manual work when managing content in Strapi.