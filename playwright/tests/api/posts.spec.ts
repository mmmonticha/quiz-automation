import { test, expect, request } from '@playwright/test';

const API_URL = 'https://jsonplaceholder.typicode.com';

test.describe('JSONPlaceholder API (TC9, TC10, TC12)', () => {
  test('TC9 GET /posts/1 returns 200 with id, title, body', async () => {
    const context = await request.newContext({ baseURL: API_URL });
    const response = await context.get('/posts/1');
    expect(response.status()).toBe(200);

    const body = await response.json();
    expect(body).toHaveProperty('id');
    expect(body).toHaveProperty('title');
    expect(body).toHaveProperty('body');
  });

  test('TC10 POST /posts returns 201 with generated id', async () => {
    const context = await request.newContext({ baseURL: API_URL });
    const response = await context.post('/posts', {
      data: { title: 'foo', body: 'bar', userId: 1 },
    });
    expect(response.status()).toBe(201);

    const body = await response.json();
    expect(body).toHaveProperty('id');
    expect(typeof body.id).toBe('number');
  });

  test('TC12 GET /posts returns a non-empty array', async () => {
    const context = await request.newContext({ baseURL: API_URL });
    const response = await context.get('/posts');
    expect(response.status()).toBe(200);

    const body = await response.json();
    expect(Array.isArray(body)).toBe(true);
    expect(body.length).toBeGreaterThan(0);
  });
});
