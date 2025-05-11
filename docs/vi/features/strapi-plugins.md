# Plugin Strapi

Tu00e0i liu1ec7u nu00e0y cung cu1ea5p thu00f4ng tin vu1ec1 cu00e1c plugin Strapi u0111u01b0u1ee3c su1eed du1ee5ng trong du1ef1 u00e1n RateBox, cu1ea5u hu00ecnh vu00e0 cu00e1ch khu1eafc phu1ee5c su1ef1 cu1ed1.

## Plugin Cu01a1 bu1ea3n

RateBox su1eed du1ee5ng nhiu1ec1u plugin cu01a1 bu1ea3n u0111u01b0u1ee3c cu00e0i u0111u1eb7t su1eb5n vu1edbi Strapi:

- **Users & Permissions**: Xu1eed lu00fd xu00e1c thu1ef1c vu00e0 phu00e2n quyu1ec1n ngu01b0u1eddi du00f9ng
- **Content-Manager**: Quu1ea3n lu00fd lou1ea1i nu1ed9i dung vu00e0 mu1ee5c
- **Upload**: Xu1eed lu00fd tu1ea3i lu00ean vu00e0 quu1ea3n lu00fd tu1ec7p
- **Email**: Cu1ea5u hu00ecnh du1ecbch vu1ee5 email

## Plugin Tu00f9y chu1ec9nh

### Plugin Locale Select

`strapi-plugin-locale-select` lu00e0 plugin tu00f9y chu1ec9nh u0111u01b0u1ee3c phu00e1t triu1ec3n riu00eang cho RateBox u0111u1ec3 xu1eed lu00fd cu00e1c chu1ee9c nu0103ng liu00ean quan u0111u1ebfn u0111u1ecba phu01b0u01a1ng vu00e0 ngu00f4n ngu1eef.

#### Tu00ednh nu0103ng

- **Tu1ef1 u0111u1ed9ng hou00e0n thu00e0nh u0111u1ecba chu1ec9**: Tu00edch hu1ee3p vu1edbi Google Maps API u0111u1ec3 cung cu1ea5p chu1ee9c nu0103ng tu1ef1 u0111u1ed9ng hou00e0n thu00e0nh u0111u1ecba chu1ec9
- **Chu1ecdn vu1ecb tru00ed**: Cho phu00e9p chu1ecdn vu1ecb tru00ed vu1edbi tu00f9y chu1ec9nh u0111u1ecba phu01b0u01a1ng hu00f3a phu00f9 hu1ee3p
- **Chu1ecdn ngu00f4n ngu1eef & tiu1ec1n tu1ec7**: Cung cu1ea5p cu00e1c thu00e0nh phu1ea7n chu1ecdn chuu1ea9n hu00f3a cho ngu00f4n ngu1eef vu00e0 tiu1ec1n tu1ec7

#### Cu1ea5u hu00ecnh

u0110u1ec3 cu1ea5u hu00ecnh plugin Locale Select:

1. Truy cu1eadp Strapi Admin > Settings > Locale Select
2. Nhu1eadp key API Google Maps vu00e0o tru01b0u1eddng u0111u01b0u1ee3c chu1ec9 u0111u1ecbnh
3. Lu01b0u cu00e0i u0111u1eb7t

#### Su1eed du1ee5ng trong Content Types

u0110u1ec3 su1eed du1ee5ng tru01b0u1eddng Address Autocomplete trong cu00e1c lou1ea1i nu1ed9i dung cu1ee7a bu1ea1n:

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

#### Khu1eafc phu1ee5c su1ef1 cu1ed1

Nu1ebfu bu1ea1n gu1eb7p vu1ea5n u0111u1ec1 vu1edbi tru01b0u1eddng Address Autocomplete:

1. u0110u1ea3m bu1ea3o key API Google Maps u0111u01b0u1ee3c cu1ea5u hu00ecnh chu00ednh xu00e1c trong cu00e0i u0111u1eb7t plugin
2. Xu00e1c minh ru1eb1ng key API Google Maps u0111u00e3 bu1eadt Places API
3. Kiu1ec3m tra console tru00ecnh duyu1ec7t u0111u1ec3 biu1ebft bu1ea5t ku1ef3 lu1ed7i JavaScript nu00e0o
4. u0110u1ea3m bu1ea3o phiu00ean bu1ea3n plugin tu01b0u01a1ng thu00edch vu1edbi phiu00ean bu1ea3n Strapi cu1ee7a bu1ea1n

## Tu00ednh tu01b0u01a1ng thu00edch cu1ee7a Plugin

Bu1ea3ng sau u0111u00e2y cho thu1ea5y tu00ednh tu01b0u01a1ng thu00edch cu1ee7a cu00e1c plugin tu00f9y chu1ec9nh vu1edbi cu00e1c phiu00ean bu1ea3n Strapi:

| Plugin | Strapi v4.x | Strapi v5.x |
|--------|------------|-------------|
| strapi-plugin-locale-select | 1.x.x | 2.x.x |

## Cu1eadp nhu1eadt Plugin

u0110u1ec3 cu1eadp nhu1eadt plugin tu00f9y chu1ec9nh, su1eed du1ee5ng PowerShell:

```powershell
npm install strapi-plugin-locale-select@latest --save
# hou1eb7c nu1ebfu su1eed du1ee5ng yarn
yarn add strapi-plugin-locale-select@latest
```

Sau khi cu1eadp nhu1eadt, xu00e2y du1ef1ng lu1ea1i Strapi:

```powershell
yarn build
yarn develop
```

## Phu00e1t triu1ec3n Plugin

Nu1ebfu bu1ea1n cu1ea7n thay u0111u1ed5i mu00e3 nguu1ed3n plugin:

1. Cu1eadp nhu1eadt mu00e3 nguu1ed3n trong kho phu00e1t triu1ec3n plugin
2. Xu00e2y du1ef1ng vu00e0 u0111u00f3ng gu00f3i plugin du01b0u1edbi du1ea1ng tarball
3. Cu00e0i u0111u1eb7t tarball cu1ee5c bu1ed9 vu00e0o du1ef1 u00e1n Strapi cu1ee7a bu1ea1n:

```powershell
npm install D:\Projects\Locale-Select\strapi-plugin-locale-select-x.x.x.tgz --force
```

4. Xu00e2y du1ef1ng lu1ea1i vu00e0 khu1edfi u0111u1ed9ng lu1ea1i Strapi
