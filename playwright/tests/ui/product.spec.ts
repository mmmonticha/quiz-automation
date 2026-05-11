import { test, expect } from '@playwright/test';
import { LoginPage } from '../../pages/login.page';
import { InventoryPage } from '../../pages/inventory.page';

test.describe('Products (TC5, TC7)', () => {
  test.beforeEach(async ({ page }) => {
    const login = new LoginPage(page);
    await login.goto();
    await login.login('standard_user', 'secret_sauce');
    await new InventoryPage(page).expectLoaded();
  });

  test('TC5 first product name and price match on detail page', async ({ page }) => {
    const inventory = new InventoryPage(page);
    const listName = await inventory.firstName();
    const listPrice = await inventory.firstPrice();

    await inventory.openFirstProduct();

    await expect(inventory.detailName).toHaveText(listName);
    await expect(inventory.detailPrice).toHaveText(listPrice);
  });

  test('TC7 adding 2 items shows cart badge "2"', async ({ page }) => {
    const inventory = new InventoryPage(page);
    await inventory.addToCartButtons.nth(0).click();
    await inventory.addToCartButtons.nth(1).click();
    await expect(inventory.cartBadge).toHaveText('2');
  });
});
