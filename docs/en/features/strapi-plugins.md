# Strapi Plugins

This document provides information about the Strapi plugins used in the RateBox project, their configurations, and troubleshooting tips.

## Core Plugins

RateBox uses several core Strapi plugins that come pre-installed with Strapi:

- **Users & Permissions**: Handles user authentication and authorization
- **Content-Manager**: Manages content types and entries
- **Upload**: Handles file uploads and management
- **Email**: Configures email services

## Custom Plugins

### Locale Select Plugin

The `strapi-plugin-locale-select` is a custom plugin developed specifically for RateBox to handle various locale-related functionalities.

#### Features

- **Address Autocomplete**: Integrates with Google Maps API to provide address autocomplete functionality
- **Location Select**: Allows selection of locations with proper localization
- **Language & Currency Selection**: Provides standardized selection components for languages and currencies

#### Configuration

To configure the Locale Select plugin:

1. Navigate to Strapi Admin > Settings > Locale Select
2. Enter your Google Maps API key in the designated field
3. Save the settings

#### Usage in Content Types

To use the Address Autocomplete field in your content types:

```json
{
  "attributes": {
    "Address": {
      "type": "customField",
      "customField": "plugin::locale-select.address-autocomplete"
    }
  }
}
```

#### Troubleshooting

If you encounter issues with the Address Autocomplete field:

1. Ensure your Google Maps API key is correctly configured in the plugin settings
2. Verify that the Google Maps API key has the Places API enabled
3. Check browser console for any JavaScript errors
4. Make sure the plugin version is compatible with your Strapi version

## Plugin Compatibility

The following table shows the compatibility of custom plugins with Strapi versions:

| Plugin | Strapi v4.x | Strapi v5.x |
|--------|------------|-------------|
| strapi-plugin-locale-select | 1.x.x | 2.x.x |

## Updating Plugins

To update a custom plugin:

```bash
npm install strapi-plugin-locale-select@latest --save
# or if using yarn
yarn add strapi-plugin-locale-select@latest
```

After updating, rebuild Strapi:

```bash
yarn build
yarn develop
```

## Developing Plugins

If you need to make changes to the plugin source code:

1. Update the source code in the plugin's development repository
2. Build and package the plugin as a tarball
3. Install the local tarball in your Strapi project:

```bash
npm install /path/to/strapi-plugin-locale-select-x.x.x.tgz --force
```

4. Rebuild and restart Strapi
