#!/usr/bin/env sh
# The webshop with project memory initialized and no behavior documented yet.
set -eu
mkdir -p src test docs/architecture
cat > package.json <<'FILE'
{
  "name": "webshop",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "test": "bun test"
  }
}
FILE
cat > tsconfig.json <<'FILE'
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "noEmit": true,
    "skipLibCheck": true
  },
  "include": ["src", "test"]
}
FILE
cat > src/products.ts <<'FILE'
export type Product = { id: string; name: string; priceCents: number };

const catalogue: Product[] = [
  { id: "rain-jacket", name: "Rain jacket", priceCents: 1990 },
  { id: "wool-socks", name: "Wool socks", priceCents: 1200 },
  { id: "water-bottle", name: "Water bottle", priceCents: 2000 },
  { id: "trail-map", name: "Trail map", priceCents: 850 },
  { id: "headlamp", name: "Headlamp", priceCents: 3499 },
];

export function listProducts(): Product[] {
  return catalogue.map((p) => ({ ...p }));
}

export function getProduct(id: string): Product {
  const product = catalogue.find((p) => p.id === id);
  if (!product) throw new Error(`Unknown product: ${id}`);
  return { ...product };
}
FILE
cat > src/orders.ts <<'FILE'
import { getProduct } from "./products";

export type OrderLine = { productId: string; quantity: number; unitPriceCents: number };
export type OrderStatus = "paid" | "delivered";
export type Order = {
  id: string;
  customerId: string;
  lines: OrderLine[];
  discountPercent: number;
  status: OrderStatus;
  deliveredAt?: Date;
};

let nextId = 1;

export function createOrder(input: {
  customerId: string;
  lines: { productId: string; quantity: number }[];
  discountPercent?: number;
}): Order {
  if (input.lines.length === 0) throw new Error("An order needs at least one line");
  const discountPercent = input.discountPercent ?? 0;
  if (discountPercent < 0 || discountPercent > 100) {
    throw new Error("Discount must be between 0 and 100 percent");
  }
  const lines = input.lines.map((line) => {
    if (!Number.isInteger(line.quantity) || line.quantity < 1) {
      throw new Error("Quantity must be a whole number of at least 1");
    }
    return {
      productId: line.productId,
      quantity: line.quantity,
      unitPriceCents: getProduct(line.productId).priceCents,
    };
  });
  return { id: `order-${nextId++}`, customerId: input.customerId, lines, discountPercent, status: "paid" };
}

export function subtotalCents(order: Order): number {
  return order.lines.reduce((sum, line) => sum + line.unitPriceCents * line.quantity, 0);
}

export function orderTotalCents(order: Order): number {
  // Discount on the subtotal, rounded half up to the cent, in integer arithmetic.
  const discounted = subtotalCents(order) * (100 - order.discountPercent);
  return Math.floor((discounted + 50) / 100);
}

export function markDelivered(order: Order, at: Date = new Date()): Order {
  return { ...order, status: "delivered", deliveredAt: at };
}
FILE
cat > src/returns.ts <<'FILE'
import type { Order } from "./orders";

export type ReturnItem = { productId: string; quantity: number };
export type ReturnStatus = "requested" | "approved" | "refunded";
export type Return = {
  id: string;
  orderId: string;
  items: ReturnItem[];
  refundCents: number;
  status: ReturnStatus;
  requestedAt: Date;
};

export const RETURN_WINDOW_DAYS = 30;
const DAY_MS = 86_400_000;
let nextId = 1;

export function calculateRefund(order: Order, items: ReturnItem[]): number {
  const subtotal = items.reduce((sum, item) => {
    const line = order.lines.find((l) => l.productId === item.productId);
    if (!line) throw new Error(`Product ${item.productId} is not on order ${order.id}`);
    return sum + line.unitPriceCents * item.quantity;
  }, 0);
  return Math.round(subtotal * (1 - order.discountPercent / 100));
}

export function submitReturn(order: Order, items: ReturnItem[], now: Date = new Date()): Return {
  if (order.status !== "delivered" || !order.deliveredAt) {
    throw new Error("Only delivered orders can be returned");
  }
  const ageDays = (now.getTime() - order.deliveredAt.getTime()) / DAY_MS;
  if (ageDays > RETURN_WINDOW_DAYS) {
    throw new Error(`Returns are accepted within ${RETURN_WINDOW_DAYS} days of delivery`);
  }
  if (items.length === 0) throw new Error("A return needs at least one item");
  for (const item of items) {
    const line = order.lines.find((l) => l.productId === item.productId);
    if (!line) throw new Error(`Product ${item.productId} is not on order ${order.id}`);
    if (!Number.isInteger(item.quantity) || item.quantity < 1) {
      throw new Error("Quantity must be a whole number of at least 1");
    }
    if (item.quantity > line.quantity) {
      throw new Error(`Cannot return more ${item.productId} than were ordered`);
    }
  }
  return {
    id: `return-${nextId++}`,
    orderId: order.id,
    items: items.map((i) => ({ ...i })),
    refundCents: calculateRefund(order, items),
    status: "requested",
    requestedAt: now,
  };
}

export function approveReturn(ret: Return): Return {
  if (ret.status !== "requested") throw new Error(`A ${ret.status} return cannot be approved`);
  return { ...ret, status: "approved" };
}

export function refundReturn(ret: Return): Return {
  if (ret.status !== "approved") throw new Error("Only an approved return can be refunded");
  return { ...ret, status: "refunded" };
}
FILE
cat > src/index.ts <<'FILE'
export * from "./products";
export * from "./orders";
export * from "./returns";
export * from "./wishlist";
FILE
cat > test/products.test.ts <<'FILE'
import { describe, expect, test } from "bun:test";
import { getProduct, listProducts } from "../src/products";

describe("products", () => {
  test("lists the catalogue with prices in cents", () => {
    const products = listProducts();
    expect(products.length).toBeGreaterThan(0);
    expect(products.find((p) => p.id === "rain-jacket")?.priceCents).toBe(1990);
  });

  test("rejects an unknown product", () => {
    expect(() => getProduct("unicorn")).toThrow("Unknown product");
  });
});
FILE
cat > test/orders.test.ts <<'FILE'
import { describe, expect, test } from "bun:test";
import { createOrder, markDelivered, orderTotalCents } from "../src/orders";

describe("orders", () => {
  test("totals the lines without a discount", () => {
    const order = createOrder({
      customerId: "sanne",
      lines: [
        { productId: "rain-jacket", quantity: 2 },
        { productId: "trail-map", quantity: 1 },
      ],
    });
    expect(orderTotalCents(order)).toBe(2 * 1990 + 850);
  });

  test("applies a percentage discount to the total", () => {
    const order = createOrder({
      customerId: "sanne",
      lines: [{ productId: "water-bottle", quantity: 1 }],
      discountPercent: 10,
    });
    expect(orderTotalCents(order)).toBe(1800);
  });

  test("rounds the discounted total half up to the cent", () => {
    const order = createOrder({
      customerId: "sanne",
      lines: [{ productId: "rain-jacket", quantity: 1 }],
      discountPercent: 15,
    });
    expect(orderTotalCents(order)).toBe(1692);
  });

  test("starts paid and becomes delivered", () => {
    const order = createOrder({ customerId: "sanne", lines: [{ productId: "headlamp", quantity: 1 }] });
    expect(order.status).toBe("paid");
    const delivered = markDelivered(order, new Date("2026-01-01"));
    expect(delivered.status).toBe("delivered");
    expect(delivered.deliveredAt).toEqual(new Date("2026-01-01"));
  });

  test("rejects an empty order and a bad quantity", () => {
    expect(() => createOrder({ customerId: "sanne", lines: [] })).toThrow("at least one line");
    expect(() => createOrder({ customerId: "sanne", lines: [{ productId: "headlamp", quantity: 0 }] })).toThrow(
      "at least 1",
    );
  });
});
FILE
cat > test/returns.test.ts <<'FILE'
import { describe, expect, test } from "bun:test";
import { createOrder, markDelivered } from "../src/orders";
import { approveReturn, refundReturn, submitReturn } from "../src/returns";

const deliveredAt = new Date("2026-01-01");
const inWindow = new Date("2026-01-20");

function deliveredOrder(lines: { productId: string; quantity: number }[], discountPercent = 0) {
  return markDelivered(createOrder({ customerId: "sanne", lines, discountPercent }), deliveredAt);
}

describe("returns", () => {
  test("refunds only the returned items of an order", () => {
    const order = deliveredOrder([
      { productId: "rain-jacket", quantity: 2 },
      { productId: "trail-map", quantity: 1 },
    ]);
    const ret = submitReturn(order, [{ productId: "rain-jacket", quantity: 1 }], inWindow);
    expect(ret.refundCents).toBe(1990);
    expect(ret.status).toBe("requested");
  });

  test("applies the order discount to the refund", () => {
    const order = deliveredOrder([{ productId: "water-bottle", quantity: 1 }], 10);
    const ret = submitReturn(order, [{ productId: "water-bottle", quantity: 1 }], inWindow);
    expect(ret.refundCents).toBe(1800);
  });

  test("rejects more items than were ordered", () => {
    const order = deliveredOrder([{ productId: "wool-socks", quantity: 1 }]);
    expect(() => submitReturn(order, [{ productId: "wool-socks", quantity: 2 }], inWindow)).toThrow(
      "more wool-socks than were ordered",
    );
  });

  test("rejects a product that is not on the order", () => {
    const order = deliveredOrder([{ productId: "wool-socks", quantity: 1 }]);
    expect(() => submitReturn(order, [{ productId: "headlamp", quantity: 1 }], inWindow)).toThrow("not on order");
  });

  test("rejects an order that has not been delivered", () => {
    const order = createOrder({ customerId: "sanne", lines: [{ productId: "wool-socks", quantity: 1 }] });
    expect(() => submitReturn(order, [{ productId: "wool-socks", quantity: 1 }], inWindow)).toThrow(
      "Only delivered orders",
    );
  });

  test("accepts a return on day 30 and rejects it after", () => {
    const order = deliveredOrder([{ productId: "wool-socks", quantity: 1 }]);
    expect(submitReturn(order, [{ productId: "wool-socks", quantity: 1 }], new Date("2026-01-31")).status).toBe(
      "requested",
    );
    expect(() => submitReturn(order, [{ productId: "wool-socks", quantity: 1 }], new Date("2026-02-05"))).toThrow(
      "within 30 days",
    );
  });

  test("moves from requested to approved to refunded, in that order", () => {
    const order = deliveredOrder([{ productId: "wool-socks", quantity: 1 }]);
    const requested = submitReturn(order, [{ productId: "wool-socks", quantity: 1 }], inWindow);
    expect(() => refundReturn(requested)).toThrow("Only an approved return");
    const approved = approveReturn(requested);
    expect(approved.status).toBe("approved");
    expect(() => approveReturn(approved)).toThrow("cannot be approved");
    expect(refundReturn(approved).status).toBe("refunded");
  });
});
FILE
cat > README.md <<'FILE'
# Webshop

A small webshop where customers buy outdoor gear and send items back when they don't fit. Support handles returns and refunds.

Run the tests: `bun test`
FILE
cat > AGENTS.md <<'FILE'
# Webshop

<!-- project-memory:start · managed by docs-init; edit outside these markers -->
## Project memory
- Start every task at docs/index.md, or at the active spec's tasks.md on a spec
  branch, and load only what they link to. Load glossary.md when naming things and
  decisions/ before changing a lasting choice.
- Answer what the product does from docs/behavior/; open the code only to change it.
- Every code change belongs to a spec in docs/specs/. None yet: start one (spec-start).
- One branch per spec, named after its slug. The active spec is the one matching the current branch.
- Every session adds its line to tasks.md. If something changes mid-way, update spec.md
  or plan.md, then recheck every task.
- Write specs, plans, tasks, glossary terms and decisions into docs/,
  never into SPEC.md, tasks/, CONTEXT.md or docs/superpowers/.
- Before opening a pull request, ship the spec (spec-ship), which writes the PR title and description.
<!-- project-memory:end -->
FILE
cat > CLAUDE.md <<'FILE'
@AGENTS.md
FILE
cat > docs/index.md <<'FILE'
---
product: Webshop
docs-format: 1
---
# Webshop

## What it is
A small webshop where customers buy outdoor gear and send items back when they don't fit. Support handles returns and refunds.

## Domains
| Domain | Covers | Owner |
| --- | --- | --- |
| returns | sending items back, refunds | Sanne |

## Behavior
See [behavior/](behavior/): one folder per domain, one file per capability, each a short list of claims with IDs.

## Architecture
See [architecture/](architecture/): one file per area, `stack.md` first.
FILE
cat > docs/architecture/stack.md <<'FILE'
---
area: stack
---
# Stack

## Commands
| Task | Command |
| --- | --- |
| Test | bun test |
FILE
mkdir -p docs/behavior/returns
cat > docs/behavior/returns/submit-return.md <<'FILE'
---
capability: returns/submit-return
---
# Submit a return

- A customer returns some items of a delivered order, within 30 days of delivery {#partial-return}
  e.g. two jackets and a map delivered on 1 January -> on 20 January the customer returns one jacket
- A return never covers more of an item than the order holds {#not-more-than-ordered}
  e.g. one pair of socks ordered -> returning two is refused
- The refund is the price paid for the returned items, with the order's discount applied and rounded half up to the cent {#partial-refund}
  e.g. a trail map at 8.50 on an order with 33% off -> a refund of 5.70
- A return is requested, then approved by support, then refunded, in that order {#status-flow}
  e.g. refunding a return support hasn't approved -> refused
FILE
git init -q && git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m fixture
git checkout -q -b add-wishlist
mkdir -p docs/specs/2026-10-13-add-wishlist/reference
cat > docs/specs/2026-10-13-add-wishlist/spec.md <<'FILE'
---
id: 2026-10-13-add-wishlist
kind: feature
status: building
summary: Customers can save products to a wishlist and find them again on any device.
request: customers can save items to a wishlist
approved: {by: sanne, via: in session}
---
# Add wishlist

## Why
Customers lose track of products they like and leave without buying. A wishlist keeps what they liked within reach.

## What changes

### Add · wishlist/save-item
- A signed-in customer saves a product to their wishlist {#saves-item}
  e.g. Sanne saves "Rain jacket" -> it appears in her wishlist
- Saving the same product twice keeps one entry {#no-duplicates}
  e.g. Sanne saves "Rain jacket" again -> it still appears once
- A customer sees their saved products in the order they saved them {#lists-saved}
  e.g. Sanne saved a jacket, then a map -> the jacket is listed first

## Not doing
Sharing wishlists; price-drop alerts.
FILE
cat > docs/specs/2026-10-13-add-wishlist/plan.md <<'FILE'
---
spec: 2026-10-13-add-wishlist
---
## Approach
A wishlist module keyed by customer id, in memory like the other modules, with save, remove and list. Saving twice is a no-op.

## Files
src/wishlist.ts            new: save, remove, list per customer; rejects unknown products
test/wishlist.test.ts      new: one test per claim, named with the claim reference
src/index.ts               changed: export the wishlist module

## Architecture to update at ship
- data-model.md, from reference/data-model.md
FILE
cat > docs/specs/2026-10-13-add-wishlist/tasks.md <<'FILE'
---
spec: 2026-10-13-add-wishlist
---
Session 2026-10-13: started at T1; first message: "build the wishlist".
Session 2026-10-13: resumed at T2; first message: "continue".
Session 2026-10-13: resumed at T3; first message: "finish it".

- [x] T1 Wishlist types and an empty module -> check: `bun test` still passes
- [x] T2 Save and list, with duplicates kept to one entry -> saves-item, no-duplicates, lists-saved
- [x] T3 Export the module -> check: `bun test` passes in full
FILE
printf 'Purpose: draft data model for the wishlist.\n\nwishlist_items: customer_id, product_id, added_at; unique (customer_id, product_id)\n' > docs/specs/2026-10-13-add-wishlist/reference/data-model.md
cat > src/wishlist.ts <<'FILE'
import { getProduct } from "./products";
export type WishlistItem = { productId: string; addedAt: Date };
const lists = new Map<string, WishlistItem[]>();
export function save(customerId: string, productId: string, now: Date = new Date()): WishlistItem[] {
  getProduct(productId);
  const list = lists.get(customerId) ?? [];
  if (!list.some((i) => i.productId === productId)) list.push({ productId, addedAt: now });
  lists.set(customerId, list);
  return list.map((i) => ({ ...i }));
}
export function list(customerId: string): WishlistItem[] { return (lists.get(customerId) ?? []).map((i) => ({ ...i })); }
export function _reset(): void { lists.clear(); }
FILE
cat > test/wishlist.test.ts <<'FILE'
import { beforeEach, describe, expect, test } from "bun:test";
import { _reset, list, save } from "../src/wishlist";
describe("wishlist", () => {
  beforeEach(() => _reset());
  test("saves a product [wishlist/save-item#saves-item]", () => { save("sanne", "rain-jacket"); expect(list("sanne").map((i) => i.productId)).toEqual(["rain-jacket"]); });
  test("keeps one entry [wishlist/save-item#no-duplicates]", () => { save("sanne", "rain-jacket"); save("sanne", "rain-jacket"); expect(list("sanne")).toHaveLength(1); });
  test("lists in save order [wishlist/save-item#lists-saved]", () => { save("sanne", "rain-jacket"); save("sanne", "trail-map"); expect(list("sanne").map((i) => i.productId)).toEqual(["rain-jacket", "trail-map"]); });
});
FILE
git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m 'wishlist built'
