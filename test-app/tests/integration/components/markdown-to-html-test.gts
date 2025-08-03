import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { find, render } from '@ember/test-helpers';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import testData from './test-data.yaml';

module('Integration | Component | markdown-to-html', function (hooks) {
  setupRenderingTest(hooks);

  // The YAML file has the input (md) and output (html) for each test case
  for (const item of testData.renderTests) {
    test(`it renders ${item.desc}`, async function (assert) {
      await render(
        <template><MarkdownToHtml @markdown={{item.md}} /></template>,
      );
      assert.strictEqual(find('div')!.innerHTML.trim(), item.html.trim());
    });
  }
});
