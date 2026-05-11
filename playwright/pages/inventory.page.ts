import { Locator, Page, expect } from '@playwright/test';

export class InventoryPage {
  readonly page: Page;
  readonly title: Locator;
  readonly itemNames: Locator;
  readonly itemPrices: Locator;
  readonly addToCartButtons: Locator;
  readonly cartBadge: Locator;
  readonly sortDropdown: Locator;
  readonly detailName: Locator;
  readonly detailPrice: Locator;

  constructor(page: Page) {
    this.page = page;
    this.title = page.locator('.title');
    this.itemNames = page.locator('[data-test="inventory-item-name"]');
    this.itemPrices = page.locator('[data-test="inventory-item-price"]');
    this.addToCartButtons = page.locator('button[data-test^="add-to-cart"]');
    this.cartBadge = page.locator('.shopping_cart_badge');
    this.sortDropdown = page.locator('[data-test="product-sort-container"]');
    this.detailName = page.locator('[data-test="inventory-item-name"]');
    this.detailPrice = page.locator('[data-test="inventory-item-price"]');
  }

  async expectLoaded() {
    await expect(this.page).toHaveURL(/\/inventory\.html$/);
    await expect(this.title).toHaveText('Products');
  }

  async firstName(): Promise<string> {
    return (await this.itemNames.first().textContent())?.trim() ?? '';
  }

  async firstPrice(): Promise<string> {
    return (await this.itemPrices.first().textContent())?.trim() ?? '';
  }

  async openFirstProduct() {
    await this.itemNames.first().click();
  }

  async sortBy(value: 'az' | 'za' | 'lohi' | 'hilo') {
    await this.sortDropdown.selectOption(value);
  }
}
