# quiz-automation

- **Robot Framework** (Python) — `robot/`
- **Playwright** (TypeScript) — `playwright/`

Targets:
- UI: https://www.saucedemo.com/
- API: https://jsonplaceholder.typicode.com/

## Running the Robot Framework suite

Requires Python 3.9+.

```bash
cd robot
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
rfbrowser init                         # one-time: installs Playwright browsers used by the Browser library
robot --outputdir results tests/
open results/report.html
```

Run a single suite:

```bash
robot --outputdir results tests/ui/login_tests.robot
robot --outputdir results tests/api/posts_tests.robot
```

## Running the Playwright suite

Requires Node 18+.

```bash
cd playwright
npm install
npx playwright install chromium        # one-time
npx playwright test
npx playwright show-report
```

Run a single file:

```bash
npx playwright test tests/ui/login.spec.ts
npx playwright test tests/api/posts.spec.ts
```