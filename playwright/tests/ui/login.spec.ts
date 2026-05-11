import { test } from '@playwright/test';
import { LoginPage } from '../../pages/login.page';
import { InventoryPage } from '../../pages/inventory.page';

test.describe('Login (TC1–TC4)', () => {
  test('TC1 standard_user logs in and lands on inventory', async ({ page }) => {
    const login = new LoginPage(page);
    const inventory = new InventoryPage(page);
    await login.goto();
    await login.login('standard_user', 'secret_sauce');
    await inventory.expectLoaded();
  });

  test('TC2 wrong password shows credentials error', async ({ page }) => {
    const login = new LoginPage(page);
    await login.goto();
    await login.login('standard_user', 'wrong_password');
    await login.expectError('Username and password do not match');
  });

  test('TC3 empty username shows required error', async ({ page }) => {
    const login = new LoginPage(page);
    await login.goto();
    await login.login('', 'secret_sauce');
    await login.expectError('Username is required');
  });

  test('TC4 locked_out_user shows locked error', async ({ page }) => {
    const login = new LoginPage(page);
    await login.goto();
    await login.login('locked_out_user', 'secret_sauce');
    await login.expectError('Sorry, this user has been locked out');
  });
});
