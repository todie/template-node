import { describe, expect, it } from "vitest";
import { greet } from "../src/index.js";

describe("greet", () => {
  it("returns a greeting with the given name", () => {
    expect(greet("world")).toBe("Hello, world!");
  });

  it("works with different names", () => {
    expect(greet("todie")).toBe("Hello, todie!");
  });
});
