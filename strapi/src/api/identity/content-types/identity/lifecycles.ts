import slugify from 'slugify';

const CT = 'api::identity.identity';

const makeSlug = (id: number, name?: string) =>
  `${id}-${slugify(name || '', { lower: true, strict: true })}`;

export default {
  // After create, update slug with id-name
  async afterCreate({ result }: { result: any }) {
    const slug = makeSlug(result.id, result.name);
    await strapi.entityService.update(CT, result.id, { data: { Slug: slug } });
  },

  // After update, sync slug if name changed
  async afterUpdate({ result }: { result: any }) {
    const desired = makeSlug(result.id, result.name);
    if (result.slug !== desired) {
      await strapi.entityService.update(CT, result.id, { data: { Slug: desired } });
    }
  },
};
