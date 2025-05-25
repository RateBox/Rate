'use strict';
// Strapi v5+ đã cài sẵn slugify, chỉ cần import
const { default: slugify } = require('slugify');

const CT = 'api::identity.identity';

const makeSlug = (id, name) =>
  `${id}-${slugify(name || '', { lower: true, strict: true })}`;

module.exports = {
  // Sau khi tạo mới, update slug theo id-name
  async afterCreate({ result }) {
    const slug = makeSlug(result.id, result.name);
    await strapi.entityService.update(CT, result.id, { data: { slug } });
  },

  // Khi đổi tên, update lại slug nếu cần
  async afterUpdate({ result }) {
    const desired = makeSlug(result.id, result.name);
    if (result.slug !== desired) {
      await strapi.entityService.update(CT, result.id, { data: { slug: desired } });
    }
  }
};
