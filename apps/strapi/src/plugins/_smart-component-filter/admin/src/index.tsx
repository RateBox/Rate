import { StrapiApp } from '@strapi/strapi/admin';
import ComponentFilter from './components/ComponentFilter';

const PLUGIN_ID = '_smart-component-filter';

export default {
  register(app: StrapiApp) {
    console.log('🚀 Smart Component Filter plugin registering...');
    
    // Register the plugin first
    app.registerPlugin({
      id: PLUGIN_ID,
      name: 'Smart Component Filter',
    });
  },

  async bootstrap(app: StrapiApp) {
    console.log('🚀 Smart Component Filter plugin bootstrapping...');
    
    try {
      // Inject component filter display in edit view
      app.getPlugin('content-manager').injectComponent('editView', 'right-links', {
        name: 'smart-filter-display',
        Component: ComponentFilter as any,
      });

      console.log('✅ Smart Component Filter plugin: Bootstrap completed');
    } catch (error) {
      console.error('❌ Failed to bootstrap Smart Component Filter plugin:', error);
    }
  },
}; 