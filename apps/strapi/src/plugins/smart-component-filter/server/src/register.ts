import type { Core } from '@strapi/strapi';

const register = ({ strapi }: { strapi: Core.Strapi }) => {
  // Register Custom Field for Component Multi-Select
  strapi.customFields.register({
    name: 'component-multi-select',
    plugin: 'smart-component-filter',
    type: 'json',
    inputSize: {
      default: 6,        // 6 columns out of 12 = 50% width
      isResizable: true  // Allow users to resize if needed
    },
  });
  
  console.log('✅ Custom Field plugin::smart-component-filter.component-multi-select registered in server');
};

export default register;
