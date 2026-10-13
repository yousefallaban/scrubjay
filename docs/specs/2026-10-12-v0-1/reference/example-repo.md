Purpose: what `scrubjay-example` holds at tag `baseline`, and the latent bug the refund-fix scenario relies on, so a later session doesn't have to rediscover either.

Location: `~/MyProjects/scrubjay-example`, a separate git repo on branch `main`, tagged `baseline` at its first commit. Not on GitHub yet.

Stack: TypeScript on Bun, no dependencies. `bun test` runs 14 tests across 3 files.

Modules in `src/`:
- `products.ts`: a fixed catalogue of five products with prices in cents. `listProducts`, `getProduct`.
- `orders.ts`: `createOrder` with lines and an optional percentage discount, `subtotalCents`, `orderTotalCents` (integer arithmetic, rounded half up), `markDelivered`. Status is `paid` or `delivered`.
- `returns.ts`: `submitReturn` for some items of a delivered order, within 30 days, never more than ordered; `calculateRefund`; `approveReturn` and `refundReturn` move the status `requested` -> `approved` -> `refunded`.

No wishlist, no customers module, no docs/, no AGENTS.md, no CLAUDE.md. The wishlist is the feature the flow adds (T2, T10, T16). Returns is the domain docs-map maps first (T6).

The planted bug: `calculateRefund` applies the discount in floating point, `Math.round(subtotal * (1 - discount / 100))`, while `orderTotalCents` uses integer arithmetic. Most inputs agree; these don't:
- trail-map x1 at 33%: refund 569, correct 570
- trail-map x3 at 31%: refund 1759, correct 1760
- trail-map x3 at 33%: refund 1708, correct 1709
The tests cover only inputs where both agree. "Partial refunds are one cent off" (T10's fix scenario) is reported against the first case. Nothing in the example repo mentions the bug.

The parent folder has a `CLAUDE.md`, which is the case D42 guards against: without the import, Claude Code never loads the example's AGENTS.md.
