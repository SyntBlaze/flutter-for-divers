# Payments & Monetization

Payments and monetization turn a product interaction into a purchase, an
entitlement, or advertising revenue. The implementation is more than a payment
button: it must coordinate the Flutter client, a store or payment provider, a
trusted backend, and product state that remains correct after retries, restarts,
refunds, subscription changes, and use on another device.

```text
Store purchase: paywall -> store checkout -> transaction evidence -> server verification -> entitlement -> UI
Direct payment: checkout -> backend-created payment -> wallet/card confirmation -> webhook -> order state -> UI
Advertising: consent and eligibility -> ad request -> ad or no-fill -> display lifecycle -> measurement

At every step: pending | completed | cancelled | failed | restored or reconciled
```

Choose the monetization path before choosing a package. In-app purchases are
designed for products and subscriptions fulfilled through an app store;
RevenueCat can add a managed entitlement layer, while In-App Purchase offers a
more direct store integration. Flutter Stripe supports processor-backed checkout,
and Pay presents supported platform-wallet payment sheets. Google Mobile Ads is
for ad-funded experiences. A product may combine these models, but each flow
needs its own fulfillment rules, failure states, privacy review, and tests.

Always confirm the current rules for every store, payment provider, product type,
and market in which the app is distributed. Package selection does not determine
whether a particular checkout or monetization model is permitted.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization) — Focused, bite-sized article covering Payments & Monetization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization) — Step-by-step material that builds practical Payments & Monetization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization) — Structured, in-depth material for learning about Payments & Monetization thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| RevenueCat Purchases | Managed in-app purchase and subscription infrastructure centered on products, offerings, and entitlements | Teams that want a service to coordinate store transactions and cross-platform subscription access | [💡](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization/RevenueCat-Purchases "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization/RevenueCat-Purchases "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization/RevenueCat-Purchases "Deep Dive") |
| In-App Purchase | Flutter integration with the purchase systems provided by supported app stores | Applications that want direct control of store products, transaction handling, verification, and restoration | [💡](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization/In-App-Purchase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization/In-App-Purchase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization/In-App-Purchase "Deep Dive") |
| Flutter Stripe | Flutter SDK for Stripe payment collection and supported checkout experiences | Eligible commerce that uses a backend to create and reconcile processor-backed payments | [💡](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization/Flutter-Stripe "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization/Flutter-Stripe "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization/Flutter-Stripe "Deep Dive") |
| Pay | Configuration-driven integration for supported platform wallets and payment sheets | Adding wallet payment options such as Apple Pay or Google Pay to an existing payment workflow | [💡](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization/Pay "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization/Pay "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization/Pay "Deep Dive") |
| Google Mobile Ads | Flutter integration for loading and presenting supported mobile ad formats | Applications whose monetization strategy includes banner, interstitial, rewarded, or native advertising | [💡](https://app.syntblaze.com/qt/flutter/Packages/Payments-and-Monetization/Google-Mobile-Ads "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Payments-and-Monetization/Google-Mobile-Ads "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Payments-and-Monetization/Google-Mobile-Ads "Deep Dive") |

## Questions

- [Should this product use an app-store purchase, direct payment, or advertising?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Should-this-product-use-an-app-store-purchase%2C-direct-payment%2C-or-advertising%3F)
- [When is RevenueCat preferable to integrating with stores directly?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/When-is-RevenueCat-preferable-to-integrating-with-stores-directly%3F)
- [When is direct control through In-App Purchase useful?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/When-is-direct-control-through-In-App-Purchase-useful%3F)
- [What is the difference between a transaction, a product, and an entitlement?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/What-is-the-difference-between-a-transaction%2C-a-product%2C-and-an-entitlement%3F)
- [Why should purchase evidence be verified by a trusted server?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Why-should-purchase-evidence-be-verified-by-a-trusted-server%3F)
- [How should consumable, non-consumable, and subscription products be modeled?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-should-consumable%2C-non-consumable%2C-and-subscription-products-be-modeled%3F)
- [How should pending, cancelled, failed, and interrupted purchases appear in the UI?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-should-pending%2C-cancelled%2C-failed%2C-and-interrupted-purchases-appear-in-the-UI%3F)
- [How are previous purchases restored without granting the same benefit twice?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-are-previous-purchases-restored-without-granting-the-same-benefit-twice%3F)
- [How should refunds, revocations, renewals, and expirations update access?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-should-refunds%2C-revocations%2C-renewals%2C-and-expirations-update-access%3F)
- [What belongs in the app versus the backend for a Stripe payment?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/What-belongs-in-the-app-versus-the-backend-for-a-Stripe-payment%3F)
- [How does a wallet package such as Pay fit into the payment processor flow?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-does-a-wallet-package-such-as-Pay-fit-into-the-payment-processor-flow%3F)
- [How are duplicate taps, callbacks, and webhooks made safe?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-are-duplicate-taps%2C-callbacks%2C-and-webhooks-made-safe%3F)
- [Which mobile ad format fits a particular screen or reward?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Which-mobile-ad-format-fits-a-particular-screen-or-reward%3F)
- [When may a rewarded ad grant an in-app reward?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/When-may-a-rewarded-ad-grant-an-in-app-reward%3F)
- [How should purchase, payment, and advertising flows be tested before release?](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/How-should-purchase%2C-payment%2C-and-advertising-flows-be-tested-before-release%3F)

## Best Practices

- [Treat the backend or verified entitlement service as the authority for paid access](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Treat-the-backend-or-verified-entitlement-service-as-the-authority-for-paid-access)
- [Verify store transaction evidence outside the client before granting durable value](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Verify-store-transaction-evidence-outside-the-client-before-granting-durable-value)
- [Create payment intents and other privileged payment objects on a trusted backend](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Create-payment-intents-and-other-privileged-payment-objects-on-a-trusted-backend)
- [Keep secret keys, webhook credentials, and verification credentials out of the app](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Keep-secret-keys%2C-webhook-credentials%2C-and-verification-credentials-out-of-the-app)
- [Grant products through stable entitlement identifiers rather than UI or store-product names](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Grant-products-through-stable-entitlement-identifiers-rather-than-UI-or-store-product-names)
- [Make fulfillment idempotent so repeated transactions, callbacks, and webhooks are harmless](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Make-fulfillment-idempotent-so-repeated-transactions%2C-callbacks%2C-and-webhooks-are-harmless)
- [Persist transaction and event identifiers before granting consumable value](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Persist-transaction-and-event-identifiers-before-granting-consumable-value)
- [Acknowledge or complete store transactions only after the required processing succeeds](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Acknowledge-or-complete-store-transactions-only-after-the-required-processing-succeeds)
- [Provide an explicit restore flow and reconcile entitlements at sign-in and app startup](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Provide-an-explicit-restore-flow-and-reconcile-entitlements-at-sign-in-and-app-startup)
- [Handle pending, cancelled, declined, expired, refunded, and revoked states explicitly](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Handle-pending%2C-cancelled%2C-declined%2C-expired%2C-refunded%2C-and-revoked-states-explicitly)
- [Keep the purchase UI responsive while preventing accidental duplicate submissions](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Keep-the-purchase-UI-responsive-while-preventing-accidental-duplicate-submissions)
- [Recover interrupted flows by querying authoritative state instead of trusting the last screen](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Recover-interrupted-flows-by-querying-authoritative-state-instead-of-trusting-the-last-screen)
- [Use provider webhooks or server notifications to reconcile changes that occur off-device](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Use-provider-webhooks-or-server-notifications-to-reconcile-changes-that-occur-off-device)
- [Collect only the payment, purchase, advertising, and diagnostic data the product requires](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Collect-only-the-payment%2C-purchase%2C-advertising%2C-and-diagnostic-data-the-product-requires)
- [Obtain and respect required consent choices before requesting personalized advertising](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Obtain-and-respect-required-consent-choices-before-requesting-personalized-advertising)
- [Design ads around content and interaction boundaries, and never obscure navigation or controls](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Design-ads-around-content-and-interaction-boundaries%2C-and-never-obscure-navigation-or-controls)
- [Grant rewarded-ad benefits only from the documented completion signal and make the grant idempotent](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Grant-rewarded-ad-benefits-only-from-the-documented-completion-signal-and-make-the-grant-idempotent)
- [Test approved, declined, cancelled, pending, restored, refunded, duplicate, offline, and timeout paths in sandbox environments](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Test-approved%2C-declined%2C-cancelled%2C-pending%2C-restored%2C-refunded%2C-duplicate%2C-offline%2C-and-timeout-paths-in-sandbox-environments)
- [Use separate test and production products, credentials, ad units, and backend configuration](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Use-separate-test-and-production-products%2C-credentials%2C-ad-units%2C-and-backend-configuration)
- [Monitor verification failures, webhook delays, entitlement mismatches, payment errors, and ad no-fill without logging sensitive data](https://app.syntblaze.com/qsp/flutter/Packages/Payments-and-Monetization/Monitor-verification-failures%2C-webhook-delays%2C-entitlement-mismatches%2C-payment-errors%2C-and-ad-no-fill-without-logging-sensitive-data)

[< Back to packages](../README.md)
