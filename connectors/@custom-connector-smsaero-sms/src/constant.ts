import type { ConnectorMetadata } from '@logto/connector-kit';

export const endpoint = 'https://api.twilio.com/2010-04-01/Accounts/{{accountSID}}/Messages.json';

export const defaultMetadata: ConnectorMetadata = {
  id: 'smsaero-short-message-service',
  target: 'smsaero-sms',
  platform: null,
  name: {
    en: 'SMS Aero service',
  },
  logo: './logo.svg',
  logoDark: null,
  description: {
    en: 'SMS Aero offers users to use SMS-mailing in 5 minutes without viewing the contract. Developers are offered a convenient API with accessible classes and 24x7 chat support.',
  },
  readme: './README.md',
  configTemplate: './docs/config-template.json',
};
